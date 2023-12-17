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
entity uxn_top_0CLK_27eedc4e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_27eedc4e;
architecture arch of uxn_top_0CLK_27eedc4e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal boot_check : unsigned(23 downto 0) := to_unsigned(0, 24);
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal gpu_step_result : gpu_step_result_t := gpu_step_result_t_NULL;
signal cpu_step_result : cpu_step_result_t := cpu_step_result_t_NULL;
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal u16_addr : unsigned(15 downto 0) := to_unsigned(255, 16);
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_address : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_device_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_vram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_write_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_boot_check : unsigned(23 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_u16_addr : unsigned(15 downto 0);
signal REG_COMB_screen_vector : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_address : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_device_ram_write : unsigned(0 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_value : unsigned(7 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l318_c7_ef66]
signal UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l333_c9_4567]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);

-- boot_check_MUX[uxn_c_l318_c2_8244]
signal boot_check_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l318_c2_8244_return_output : unsigned(23 downto 0);

-- ram_write_value_MUX[uxn_c_l318_c2_8244]
signal ram_write_value_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l318_c2_8244]
signal is_ram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l318_c2_8244]
signal is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l318_c2_8244]
signal is_booted_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l318_c2_8244]
signal vram_value_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l318_c2_8244]
signal is_vram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l318_c2_8244]
signal cpu_step_result_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l318_c2_8244]
signal u16_addr_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l318_c2_8244_return_output : unsigned(15 downto 0);

-- device_ram_address_MUX[uxn_c_l318_c2_8244]
signal device_ram_address_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l318_c2_8244]
signal vram_write_layer_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l327_c44_d857]
signal BIN_OP_GT_uxn_c_l327_c44_d857_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l327_c44_d857_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l327_c44_d857_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l327_c65_4307]
signal BIN_OP_PLUS_uxn_c_l327_c65_4307_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l327_c65_4307_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l327_c44_91dc]
signal MUX_uxn_c_l327_c44_91dc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l327_c44_91dc_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l327_c44_91dc_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l327_c44_91dc_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l327_c16_b8a0]
signal MUX_uxn_c_l327_c16_b8a0_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l327_c16_b8a0_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l327_c16_b8a0_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l327_c16_b8a0_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l328_c16_50ce]
signal BIN_OP_EQ_uxn_c_l328_c16_50ce_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l328_c16_50ce_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l328_c16_3f40]
signal MUX_uxn_c_l328_c16_3f40_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l328_c16_3f40_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l328_c16_3f40_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l328_c16_3f40_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l330_c16_28ff]
signal MUX_uxn_c_l330_c16_28ff_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_28ff_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_28ff_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_28ff_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l330_c3_12ba]
signal BIN_OP_PLUS_uxn_c_l330_c3_12ba_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l330_c3_12ba_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l331_c21_7954]
signal MUX_uxn_c_l331_c21_7954_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l331_c21_7954_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l331_c21_7954_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l331_c21_7954_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l333_c14_6a38]
signal UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l333_c1_6b75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l333_c9_4567]
signal ram_write_value_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l333_c9_4567]
signal is_ram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l333_c9_4567]
signal is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l333_c9_4567]
signal vram_value_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l333_c9_4567]
signal is_vram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l333_c9_4567]
signal cpu_step_result_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l333_c9_4567]
signal u16_addr_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l333_c9_4567_return_output : unsigned(15 downto 0);

-- device_ram_address_MUX[uxn_c_l333_c9_4567]
signal device_ram_address_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l333_c9_4567]
signal vram_write_layer_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l334_c21_237f]
signal step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l334_c21_237f_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l334_c21_237f_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l334_c21_237f_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l345_c19_2006]
signal main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l345_c19_2006_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l345_c19_2006_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l345_c19_2006_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l345_c19_2006_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l351_c26_b218]
signal device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l351_c26_b218_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l351_c26_b218_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l351_c26_b218_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l351_c26_b218_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l357_c20_a95a]
signal step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l357_c20_a95a_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l359_c20_78af]
signal palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l359_c20_78af_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l359_c20_78af_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l359_c20_78af_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l359_c20_78af_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l360_c18_d615]
signal vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l360_c18_d615_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l360_c18_d615_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l360_c18_d615_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l318_c7_ef66
UNARY_OP_NOT_uxn_c_l318_c7_ef66 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr,
UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567
FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output);

-- boot_check_MUX_uxn_c_l318_c2_8244
boot_check_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l318_c2_8244_cond,
boot_check_MUX_uxn_c_l318_c2_8244_iftrue,
boot_check_MUX_uxn_c_l318_c2_8244_iffalse,
boot_check_MUX_uxn_c_l318_c2_8244_return_output);

-- ram_write_value_MUX_uxn_c_l318_c2_8244
ram_write_value_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l318_c2_8244_cond,
ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue,
ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse,
ram_write_value_MUX_uxn_c_l318_c2_8244_return_output);

-- is_ram_write_MUX_uxn_c_l318_c2_8244
is_ram_write_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l318_c2_8244_cond,
is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue,
is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse,
is_ram_write_MUX_uxn_c_l318_c2_8244_return_output);

-- is_device_ram_write_MUX_uxn_c_l318_c2_8244
is_device_ram_write_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond,
is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue,
is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse,
is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output);

-- is_booted_MUX_uxn_c_l318_c2_8244
is_booted_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l318_c2_8244_cond,
is_booted_MUX_uxn_c_l318_c2_8244_iftrue,
is_booted_MUX_uxn_c_l318_c2_8244_iffalse,
is_booted_MUX_uxn_c_l318_c2_8244_return_output);

-- vram_value_MUX_uxn_c_l318_c2_8244
vram_value_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l318_c2_8244_cond,
vram_value_MUX_uxn_c_l318_c2_8244_iftrue,
vram_value_MUX_uxn_c_l318_c2_8244_iffalse,
vram_value_MUX_uxn_c_l318_c2_8244_return_output);

-- is_vram_write_MUX_uxn_c_l318_c2_8244
is_vram_write_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l318_c2_8244_cond,
is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue,
is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse,
is_vram_write_MUX_uxn_c_l318_c2_8244_return_output);

-- cpu_step_result_MUX_uxn_c_l318_c2_8244
cpu_step_result_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l318_c2_8244_cond,
cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue,
cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse,
cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output);

-- u16_addr_MUX_uxn_c_l318_c2_8244
u16_addr_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l318_c2_8244_cond,
u16_addr_MUX_uxn_c_l318_c2_8244_iftrue,
u16_addr_MUX_uxn_c_l318_c2_8244_iffalse,
u16_addr_MUX_uxn_c_l318_c2_8244_return_output);

-- device_ram_address_MUX_uxn_c_l318_c2_8244
device_ram_address_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l318_c2_8244_cond,
device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue,
device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse,
device_ram_address_MUX_uxn_c_l318_c2_8244_return_output);

-- vram_write_layer_MUX_uxn_c_l318_c2_8244
vram_write_layer_MUX_uxn_c_l318_c2_8244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l318_c2_8244_cond,
vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue,
vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse,
vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output);

-- BIN_OP_GT_uxn_c_l327_c44_d857
BIN_OP_GT_uxn_c_l327_c44_d857 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l327_c44_d857_left,
BIN_OP_GT_uxn_c_l327_c44_d857_right,
BIN_OP_GT_uxn_c_l327_c44_d857_return_output);

-- BIN_OP_PLUS_uxn_c_l327_c65_4307
BIN_OP_PLUS_uxn_c_l327_c65_4307 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l327_c65_4307_left,
BIN_OP_PLUS_uxn_c_l327_c65_4307_right,
BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output);

-- MUX_uxn_c_l327_c44_91dc
MUX_uxn_c_l327_c44_91dc : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l327_c44_91dc_cond,
MUX_uxn_c_l327_c44_91dc_iftrue,
MUX_uxn_c_l327_c44_91dc_iffalse,
MUX_uxn_c_l327_c44_91dc_return_output);

-- MUX_uxn_c_l327_c16_b8a0
MUX_uxn_c_l327_c16_b8a0 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l327_c16_b8a0_cond,
MUX_uxn_c_l327_c16_b8a0_iftrue,
MUX_uxn_c_l327_c16_b8a0_iffalse,
MUX_uxn_c_l327_c16_b8a0_return_output);

-- BIN_OP_EQ_uxn_c_l328_c16_50ce
BIN_OP_EQ_uxn_c_l328_c16_50ce : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l328_c16_50ce_left,
BIN_OP_EQ_uxn_c_l328_c16_50ce_right,
BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output);

-- MUX_uxn_c_l328_c16_3f40
MUX_uxn_c_l328_c16_3f40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l328_c16_3f40_cond,
MUX_uxn_c_l328_c16_3f40_iftrue,
MUX_uxn_c_l328_c16_3f40_iffalse,
MUX_uxn_c_l328_c16_3f40_return_output);

-- MUX_uxn_c_l330_c16_28ff
MUX_uxn_c_l330_c16_28ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l330_c16_28ff_cond,
MUX_uxn_c_l330_c16_28ff_iftrue,
MUX_uxn_c_l330_c16_28ff_iffalse,
MUX_uxn_c_l330_c16_28ff_return_output);

-- BIN_OP_PLUS_uxn_c_l330_c3_12ba
BIN_OP_PLUS_uxn_c_l330_c3_12ba : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l330_c3_12ba_left,
BIN_OP_PLUS_uxn_c_l330_c3_12ba_right,
BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output);

-- MUX_uxn_c_l331_c21_7954
MUX_uxn_c_l331_c21_7954 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l331_c21_7954_cond,
MUX_uxn_c_l331_c21_7954_iftrue,
MUX_uxn_c_l331_c21_7954_iffalse,
MUX_uxn_c_l331_c21_7954_return_output);

-- UNARY_OP_NOT_uxn_c_l333_c14_6a38
UNARY_OP_NOT_uxn_c_l333_c14_6a38 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr,
UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75
TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output);

-- ram_write_value_MUX_uxn_c_l333_c9_4567
ram_write_value_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l333_c9_4567_cond,
ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue,
ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse,
ram_write_value_MUX_uxn_c_l333_c9_4567_return_output);

-- is_ram_write_MUX_uxn_c_l333_c9_4567
is_ram_write_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l333_c9_4567_cond,
is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue,
is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse,
is_ram_write_MUX_uxn_c_l333_c9_4567_return_output);

-- is_device_ram_write_MUX_uxn_c_l333_c9_4567
is_device_ram_write_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond,
is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue,
is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse,
is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output);

-- vram_value_MUX_uxn_c_l333_c9_4567
vram_value_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l333_c9_4567_cond,
vram_value_MUX_uxn_c_l333_c9_4567_iftrue,
vram_value_MUX_uxn_c_l333_c9_4567_iffalse,
vram_value_MUX_uxn_c_l333_c9_4567_return_output);

-- is_vram_write_MUX_uxn_c_l333_c9_4567
is_vram_write_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l333_c9_4567_cond,
is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue,
is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse,
is_vram_write_MUX_uxn_c_l333_c9_4567_return_output);

-- cpu_step_result_MUX_uxn_c_l333_c9_4567
cpu_step_result_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l333_c9_4567_cond,
cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue,
cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse,
cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output);

-- u16_addr_MUX_uxn_c_l333_c9_4567
u16_addr_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l333_c9_4567_cond,
u16_addr_MUX_uxn_c_l333_c9_4567_iftrue,
u16_addr_MUX_uxn_c_l333_c9_4567_iffalse,
u16_addr_MUX_uxn_c_l333_c9_4567_return_output);

-- device_ram_address_MUX_uxn_c_l333_c9_4567
device_ram_address_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l333_c9_4567_cond,
device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue,
device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse,
device_ram_address_MUX_uxn_c_l333_c9_4567_return_output);

-- vram_write_layer_MUX_uxn_c_l333_c9_4567
vram_write_layer_MUX_uxn_c_l333_c9_4567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l333_c9_4567_cond,
vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue,
vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse,
vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output);

-- step_cpu_uxn_c_l334_c21_237f
step_cpu_uxn_c_l334_c21_237f : entity work.step_cpu_0CLK_f7a7fef8 port map (
clk,
step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE,
step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value,
step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read,
step_cpu_uxn_c_l334_c21_237f_use_vector,
step_cpu_uxn_c_l334_c21_237f_vector,
step_cpu_uxn_c_l334_c21_237f_return_output);

-- main_ram_update_uxn_c_l345_c19_2006
main_ram_update_uxn_c_l345_c19_2006 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE,
main_ram_update_uxn_c_l345_c19_2006_ram_address,
main_ram_update_uxn_c_l345_c19_2006_value,
main_ram_update_uxn_c_l345_c19_2006_write_enable,
main_ram_update_uxn_c_l345_c19_2006_return_output);

-- device_ram_update_uxn_c_l351_c26_b218
device_ram_update_uxn_c_l351_c26_b218 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE,
device_ram_update_uxn_c_l351_c26_b218_device_address,
device_ram_update_uxn_c_l351_c26_b218_value,
device_ram_update_uxn_c_l351_c26_b218_write_enable,
device_ram_update_uxn_c_l351_c26_b218_return_output);

-- step_gpu_uxn_c_l357_c20_a95a
step_gpu_uxn_c_l357_c20_a95a : entity work.step_gpu_0CLK_c787a2c4 port map (
clk,
step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE,
step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area,
step_gpu_uxn_c_l357_c20_a95a_is_vram_write,
step_gpu_uxn_c_l357_c20_a95a_vram_write_layer,
step_gpu_uxn_c_l357_c20_a95a_vram_address,
step_gpu_uxn_c_l357_c20_a95a_vram_value,
step_gpu_uxn_c_l357_c20_a95a_return_output);

-- palette_snoop_uxn_c_l359_c20_78af
palette_snoop_uxn_c_l359_c20_78af : entity work.palette_snoop_0CLK_cf70ec0f port map (
clk,
palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE,
palette_snoop_uxn_c_l359_c20_78af_device_ram_address,
palette_snoop_uxn_c_l359_c20_78af_device_ram_value,
palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write,
palette_snoop_uxn_c_l359_c20_78af_gpu_step_color,
palette_snoop_uxn_c_l359_c20_78af_return_output);

-- vector_snoop_uxn_c_l360_c18_d615
vector_snoop_uxn_c_l360_c18_d615 : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE,
vector_snoop_uxn_c_l360_c18_d615_device_ram_address,
vector_snoop_uxn_c_l360_c18_d615_device_ram_value,
vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write,
vector_snoop_uxn_c_l360_c18_d615_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_visible_pixel,
 rom_load_valid_byte,
 rom_load_address,
 rom_load_value,
 -- Registers
 boot_check,
 uxn_eval_result,
 is_booted,
 gpu_step_result,
 cpu_step_result,
 is_active_fill,
 is_ram_write,
 u16_addr,
 screen_vector,
 ram_write_value,
 ram_read_value,
 device_ram_address,
 device_ram_read_value,
 is_device_ram_write,
 is_vram_write,
 vram_write_layer,
 vram_value,
 -- All submodule outputs
 UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output,
 boot_check_MUX_uxn_c_l318_c2_8244_return_output,
 ram_write_value_MUX_uxn_c_l318_c2_8244_return_output,
 is_ram_write_MUX_uxn_c_l318_c2_8244_return_output,
 is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output,
 is_booted_MUX_uxn_c_l318_c2_8244_return_output,
 vram_value_MUX_uxn_c_l318_c2_8244_return_output,
 is_vram_write_MUX_uxn_c_l318_c2_8244_return_output,
 cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output,
 u16_addr_MUX_uxn_c_l318_c2_8244_return_output,
 device_ram_address_MUX_uxn_c_l318_c2_8244_return_output,
 vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output,
 BIN_OP_GT_uxn_c_l327_c44_d857_return_output,
 BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output,
 MUX_uxn_c_l327_c44_91dc_return_output,
 MUX_uxn_c_l327_c16_b8a0_return_output,
 BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output,
 MUX_uxn_c_l328_c16_3f40_return_output,
 MUX_uxn_c_l330_c16_28ff_return_output,
 BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output,
 MUX_uxn_c_l331_c21_7954_return_output,
 UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output,
 ram_write_value_MUX_uxn_c_l333_c9_4567_return_output,
 is_ram_write_MUX_uxn_c_l333_c9_4567_return_output,
 is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output,
 vram_value_MUX_uxn_c_l333_c9_4567_return_output,
 is_vram_write_MUX_uxn_c_l333_c9_4567_return_output,
 cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output,
 u16_addr_MUX_uxn_c_l333_c9_4567_return_output,
 device_ram_address_MUX_uxn_c_l333_c9_4567_return_output,
 vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output,
 step_cpu_uxn_c_l334_c21_237f_return_output,
 main_ram_update_uxn_c_l345_c19_2006_return_output,
 device_ram_update_uxn_c_l351_c26_b218_return_output,
 step_gpu_uxn_c_l357_c20_a95a_return_output,
 palette_snoop_uxn_c_l359_c20_78af_return_output,
 vector_snoop_uxn_c_l360_c18_d615_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l318_c2_8244_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l330_c3_54c0 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l333_c9_4567_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l318_c2_8244_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_b8a0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_b8a0_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_b8a0_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l327_c44_91dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l327_c44_d857_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l327_c44_d857_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l327_c44_d857_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c44_91dc_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l327_c44_91dc_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l327_c44_91dc_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_b8a0_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l328_c16_3f40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l328_c16_3f40_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l328_c16_3f40_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l328_c16_3f40_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_28ff_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_28ff_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_28ff_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_28ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l331_c21_7954_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l331_c21_7954_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l331_c21_7954_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l331_c21_7954_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l334_c69_df9e_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l334_c21_237f_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l335_c18_fc40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l336_c14_ca6a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l337_c24_9142_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l338_c25_5c7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l340_c19_eca9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l341_c22_6a7e_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l345_c19_2006_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l345_c19_2006_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l345_c19_2006_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l345_c19_2006_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l351_c26_b218_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l351_c26_b218_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l351_c26_b218_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l351_c26_b218_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l357_c20_a95a_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l358_c19_3142_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l359_c92_d6d2_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l359_c20_78af_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l360_c18_d615_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l339_l342_DUPLICATE_becb_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_u16_addr : unsigned(15 downto 0);
variable REG_VAR_screen_vector : unsigned(15 downto 0);
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_device_ram_address : unsigned(7 downto 0);
variable REG_VAR_device_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_is_device_ram_write : unsigned(0 downto 0);
variable REG_VAR_is_vram_write : unsigned(0 downto 0);
variable REG_VAR_vram_write_layer : unsigned(0 downto 0);
variable REG_VAR_vram_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_boot_check := boot_check;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_booted := is_booted;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_cpu_step_result := cpu_step_result;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_u16_addr := u16_addr;
  REG_VAR_screen_vector := screen_vector;
  REG_VAR_ram_write_value := ram_write_value;
  REG_VAR_ram_read_value := ram_read_value;
  REG_VAR_device_ram_address := device_ram_address;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_is_device_ram_write := is_device_ram_write;
  REG_VAR_is_vram_write := is_vram_write;
  REG_VAR_vram_write_layer := vram_write_layer;
  REG_VAR_vram_value := vram_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l328_c16_3f40_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l330_c16_28ff_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l327_c16_b8a0_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_GT_uxn_c_l327_c44_d857_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l331_c21_7954_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l330_c16_28ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l328_c16_3f40_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l327_c44_91dc_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_visible_pixel := is_visible_pixel;
     VAR_rom_load_valid_byte := rom_load_valid_byte;
     VAR_rom_load_address := rom_load_address;
     VAR_rom_load_value := rom_load_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l318_c2_8244_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l318_c2_8244_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l327_c16_b8a0_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l331_c21_7954_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l334_c21_237f_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l327_c44_d857_left := u16_addr;
     VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_left := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l318_c2_8244_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l333_c9_4567_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l333_c14_6a38] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr <= VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output := UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;

     -- BIN_OP_PLUS[uxn_c_l327_c65_4307] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l327_c65_4307_left <= VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_left;
     BIN_OP_PLUS_uxn_c_l327_c65_4307_right <= VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output := BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output;

     -- UNARY_OP_NOT[uxn_c_l318_c7_ef66] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr <= VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output := UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l334_c69_df9e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l334_c69_df9e_return_output := gpu_step_result.is_new_frame;

     -- BIN_OP_GT[uxn_c_l327_c44_d857] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l327_c44_d857_left <= VAR_BIN_OP_GT_uxn_c_l327_c44_d857_left;
     BIN_OP_GT_uxn_c_l327_c44_d857_right <= VAR_BIN_OP_GT_uxn_c_l327_c44_d857_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l327_c44_d857_return_output := BIN_OP_GT_uxn_c_l327_c44_d857_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l327_c44_91dc_cond := VAR_BIN_OP_GT_uxn_c_l327_c44_d857_return_output;
     VAR_MUX_uxn_c_l327_c44_91dc_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l327_c65_4307_return_output, 24);
     VAR_step_cpu_uxn_c_l334_c21_237f_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l334_c69_df9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_boot_check_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_is_booted_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_u16_addr_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_vram_value_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_cond := VAR_UNARY_OP_NOT_uxn_c_l318_c7_ef66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_u16_addr_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_vram_value_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_cond := VAR_UNARY_OP_NOT_uxn_c_l333_c14_6a38_return_output;
     -- MUX[uxn_c_l327_c44_91dc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l327_c44_91dc_cond <= VAR_MUX_uxn_c_l327_c44_91dc_cond;
     MUX_uxn_c_l327_c44_91dc_iftrue <= VAR_MUX_uxn_c_l327_c44_91dc_iftrue;
     MUX_uxn_c_l327_c44_91dc_iffalse <= VAR_MUX_uxn_c_l327_c44_91dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l327_c44_91dc_return_output := MUX_uxn_c_l327_c44_91dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_MUX_uxn_c_l327_c16_b8a0_iffalse := VAR_MUX_uxn_c_l327_c44_91dc_return_output;
     -- MUX[uxn_c_l327_c16_b8a0] LATENCY=0
     -- Inputs
     MUX_uxn_c_l327_c16_b8a0_cond <= VAR_MUX_uxn_c_l327_c16_b8a0_cond;
     MUX_uxn_c_l327_c16_b8a0_iftrue <= VAR_MUX_uxn_c_l327_c16_b8a0_iftrue;
     MUX_uxn_c_l327_c16_b8a0_iffalse <= VAR_MUX_uxn_c_l327_c16_b8a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l327_c16_b8a0_return_output := MUX_uxn_c_l327_c16_b8a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l333_c1_6b75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_left := VAR_MUX_uxn_c_l327_c16_b8a0_return_output;
     VAR_boot_check_MUX_uxn_c_l318_c2_8244_iftrue := VAR_MUX_uxn_c_l327_c16_b8a0_return_output;
     VAR_step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l333_c1_6b75_return_output;
     -- BIN_OP_EQ[uxn_c_l328_c16_50ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l328_c16_50ce_left <= VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_left;
     BIN_OP_EQ_uxn_c_l328_c16_50ce_right <= VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output := BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output;

     -- boot_check_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l318_c2_8244_cond <= VAR_boot_check_MUX_uxn_c_l318_c2_8244_cond;
     boot_check_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_boot_check_MUX_uxn_c_l318_c2_8244_iftrue;
     boot_check_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_boot_check_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l318_c2_8244_return_output := boot_check_MUX_uxn_c_l318_c2_8244_return_output;

     -- step_cpu[uxn_c_l334_c21_237f] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l334_c21_237f_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value <= VAR_step_cpu_uxn_c_l334_c21_237f_previous_ram_read_value;
     step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read <= VAR_step_cpu_uxn_c_l334_c21_237f_previous_device_ram_read;
     step_cpu_uxn_c_l334_c21_237f_use_vector <= VAR_step_cpu_uxn_c_l334_c21_237f_use_vector;
     step_cpu_uxn_c_l334_c21_237f_vector <= VAR_step_cpu_uxn_c_l334_c21_237f_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l334_c21_237f_return_output := step_cpu_uxn_c_l334_c21_237f_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l328_c16_3f40_cond := VAR_BIN_OP_EQ_uxn_c_l328_c16_50ce_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue := VAR_step_cpu_uxn_c_l334_c21_237f_return_output;
     -- MUX[uxn_c_l328_c16_3f40] LATENCY=0
     -- Inputs
     MUX_uxn_c_l328_c16_3f40_cond <= VAR_MUX_uxn_c_l328_c16_3f40_cond;
     MUX_uxn_c_l328_c16_3f40_iftrue <= VAR_MUX_uxn_c_l328_c16_3f40_iftrue;
     MUX_uxn_c_l328_c16_3f40_iffalse <= VAR_MUX_uxn_c_l328_c16_3f40_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l328_c16_3f40_return_output := MUX_uxn_c_l328_c16_3f40_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l339_l342_DUPLICATE_becb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l339_l342_DUPLICATE_becb_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.u8_value;

     -- cpu_step_result_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l333_c9_4567_cond <= VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_cond;
     cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iftrue;
     cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output := cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l337_c24_9142] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l337_c24_9142_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l338_c25_5c7e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l338_c25_5c7e_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l341_c22_6a7e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l341_c22_6a7e_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l340_c19_eca9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l340_c19_eca9_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l335_c18_fc40] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l335_c18_fc40_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l336_c14_ca6a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l336_c14_ca6a_return_output := VAR_step_cpu_uxn_c_l334_c21_237f_return_output.u16_addr;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l336_c14_ca6a_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l338_c25_5c7e_return_output;
     VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l335_c18_fc40_return_output;
     VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l340_c19_eca9_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l341_c22_6a7e_return_output;
     VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l337_c24_9142_return_output;
     VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l339_l342_DUPLICATE_becb_return_output;
     VAR_vram_value_MUX_uxn_c_l333_c9_4567_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l339_l342_DUPLICATE_becb_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right := VAR_MUX_uxn_c_l328_c16_3f40_return_output;
     VAR_MUX_uxn_c_l331_c21_7954_cond := VAR_MUX_uxn_c_l328_c16_3f40_return_output;
     VAR_is_booted_MUX_uxn_c_l318_c2_8244_iftrue := VAR_MUX_uxn_c_l328_c16_3f40_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse := VAR_cpu_step_result_MUX_uxn_c_l333_c9_4567_return_output;
     -- vram_write_layer_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l333_c9_4567_cond <= VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_cond;
     vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iftrue;
     vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output := vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output;

     -- vram_value_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l333_c9_4567_cond <= VAR_vram_value_MUX_uxn_c_l333_c9_4567_cond;
     vram_value_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_vram_value_MUX_uxn_c_l333_c9_4567_iftrue;
     vram_value_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_vram_value_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l333_c9_4567_return_output := vram_value_MUX_uxn_c_l333_c9_4567_return_output;

     -- u16_addr_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l333_c9_4567_cond <= VAR_u16_addr_MUX_uxn_c_l333_c9_4567_cond;
     u16_addr_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iftrue;
     u16_addr_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_u16_addr_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l333_c9_4567_return_output := u16_addr_MUX_uxn_c_l333_c9_4567_return_output;

     -- MUX[uxn_c_l331_c21_7954] LATENCY=0
     -- Inputs
     MUX_uxn_c_l331_c21_7954_cond <= VAR_MUX_uxn_c_l331_c21_7954_cond;
     MUX_uxn_c_l331_c21_7954_iftrue <= VAR_MUX_uxn_c_l331_c21_7954_iftrue;
     MUX_uxn_c_l331_c21_7954_iffalse <= VAR_MUX_uxn_c_l331_c21_7954_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l331_c21_7954_return_output := MUX_uxn_c_l331_c21_7954_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output;

     -- cpu_step_result_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l318_c2_8244_cond <= VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_cond;
     cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iftrue;
     cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output := cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output;

     -- is_device_ram_write_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond <= VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_cond;
     is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iftrue;
     is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output := is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output;

     -- ram_write_value_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l333_c9_4567_cond <= VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_cond;
     ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iftrue;
     ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_return_output := ram_write_value_MUX_uxn_c_l333_c9_4567_return_output;

     -- device_ram_address_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l333_c9_4567_cond <= VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_cond;
     device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iftrue;
     device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_return_output := device_ram_address_MUX_uxn_c_l333_c9_4567_return_output;

     -- is_booted_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l318_c2_8244_cond <= VAR_is_booted_MUX_uxn_c_l318_c2_8244_cond;
     is_booted_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_is_booted_MUX_uxn_c_l318_c2_8244_iftrue;
     is_booted_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_is_booted_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l318_c2_8244_return_output := is_booted_MUX_uxn_c_l318_c2_8244_return_output;

     -- is_ram_write_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l333_c9_4567_cond <= VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_cond;
     is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iftrue;
     is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_return_output := is_ram_write_MUX_uxn_c_l333_c9_4567_return_output;

     -- is_vram_write_MUX[uxn_c_l333_c9_4567] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l333_c9_4567_cond <= VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_cond;
     is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue <= VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iftrue;
     is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse <= VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_return_output := is_vram_write_MUX_uxn_c_l333_c9_4567_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l330_c16_28ff_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output;
     VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l330_l329_DUPLICATE_dbbb_return_output;
     VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue := VAR_MUX_uxn_c_l331_c21_7954_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse := VAR_device_ram_address_MUX_uxn_c_l333_c9_4567_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse := VAR_is_ram_write_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse := VAR_is_vram_write_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse := VAR_ram_write_value_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iffalse := VAR_u16_addr_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_vram_value_MUX_uxn_c_l318_c2_8244_iffalse := VAR_vram_value_MUX_uxn_c_l333_c9_4567_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse := VAR_vram_write_layer_MUX_uxn_c_l333_c9_4567_return_output;
     -- device_ram_address_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l318_c2_8244_cond <= VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_cond;
     device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iftrue;
     device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output := device_ram_address_MUX_uxn_c_l318_c2_8244_return_output;

     -- vram_value_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l318_c2_8244_cond <= VAR_vram_value_MUX_uxn_c_l318_c2_8244_cond;
     vram_value_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_vram_value_MUX_uxn_c_l318_c2_8244_iftrue;
     vram_value_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_vram_value_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l318_c2_8244_return_output := vram_value_MUX_uxn_c_l318_c2_8244_return_output;

     -- is_vram_write_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l318_c2_8244_cond <= VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_cond;
     is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iftrue;
     is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_return_output := is_vram_write_MUX_uxn_c_l318_c2_8244_return_output;

     -- ram_write_value_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l318_c2_8244_cond <= VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_cond;
     ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iftrue;
     ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output := ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;

     -- vram_write_layer_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l318_c2_8244_cond <= VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_cond;
     vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iftrue;
     vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output := vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output;

     -- MUX[uxn_c_l330_c16_28ff] LATENCY=0
     -- Inputs
     MUX_uxn_c_l330_c16_28ff_cond <= VAR_MUX_uxn_c_l330_c16_28ff_cond;
     MUX_uxn_c_l330_c16_28ff_iftrue <= VAR_MUX_uxn_c_l330_c16_28ff_iftrue;
     MUX_uxn_c_l330_c16_28ff_iffalse <= VAR_MUX_uxn_c_l330_c16_28ff_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l330_c16_28ff_return_output := MUX_uxn_c_l330_c16_28ff_return_output;

     -- is_ram_write_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l318_c2_8244_cond <= VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_cond;
     is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iftrue;
     is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_return_output := is_ram_write_MUX_uxn_c_l318_c2_8244_return_output;

     -- is_device_ram_write_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond <= VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_cond;
     is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iftrue;
     is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output := is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_right := VAR_MUX_uxn_c_l330_c16_28ff_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_device_ram_update_uxn_c_l351_c26_b218_device_address := VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_device_ram_update_uxn_c_l351_c26_b218_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_main_ram_update_uxn_c_l345_c19_2006_write_enable := VAR_is_ram_write_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_step_gpu_uxn_c_l357_c20_a95a_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_device_ram_update_uxn_c_l351_c26_b218_value := VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_main_ram_update_uxn_c_l345_c19_2006_value := VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_step_gpu_uxn_c_l357_c20_a95a_vram_value := VAR_vram_value_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_step_gpu_uxn_c_l357_c20_a95a_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l318_c2_8244_return_output;
     -- BIN_OP_PLUS[uxn_c_l330_c3_12ba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l330_c3_12ba_left <= VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_left;
     BIN_OP_PLUS_uxn_c_l330_c3_12ba_right <= VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output := BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output;

     -- vector_snoop[uxn_c_l360_c18_d615] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l360_c18_d615_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l360_c18_d615_device_ram_address <= VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_address;
     vector_snoop_uxn_c_l360_c18_d615_device_ram_value <= VAR_vector_snoop_uxn_c_l360_c18_d615_device_ram_value;
     vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write <= VAR_vector_snoop_uxn_c_l360_c18_d615_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l360_c18_d615_return_output := vector_snoop_uxn_c_l360_c18_d615_return_output;

     -- device_ram_update[uxn_c_l351_c26_b218] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l351_c26_b218_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l351_c26_b218_device_address <= VAR_device_ram_update_uxn_c_l351_c26_b218_device_address;
     device_ram_update_uxn_c_l351_c26_b218_value <= VAR_device_ram_update_uxn_c_l351_c26_b218_value;
     device_ram_update_uxn_c_l351_c26_b218_write_enable <= VAR_device_ram_update_uxn_c_l351_c26_b218_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l351_c26_b218_return_output := device_ram_update_uxn_c_l351_c26_b218_return_output;

     -- Submodule level 8
     VAR_u16_addr_uxn_c_l330_c3_54c0 := resize(VAR_BIN_OP_PLUS_uxn_c_l330_c3_12ba_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l351_c26_b218_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l360_c18_d615_return_output;
     VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iftrue := VAR_u16_addr_uxn_c_l330_c3_54c0;
     -- u16_addr_MUX[uxn_c_l318_c2_8244] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l318_c2_8244_cond <= VAR_u16_addr_MUX_uxn_c_l318_c2_8244_cond;
     u16_addr_MUX_uxn_c_l318_c2_8244_iftrue <= VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iftrue;
     u16_addr_MUX_uxn_c_l318_c2_8244_iffalse <= VAR_u16_addr_MUX_uxn_c_l318_c2_8244_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l318_c2_8244_return_output := u16_addr_MUX_uxn_c_l318_c2_8244_return_output;

     -- Submodule level 9
     VAR_main_ram_update_uxn_c_l345_c19_2006_ram_address := VAR_u16_addr_MUX_uxn_c_l318_c2_8244_return_output;
     VAR_step_gpu_uxn_c_l357_c20_a95a_vram_address := VAR_u16_addr_MUX_uxn_c_l318_c2_8244_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l318_c2_8244_return_output;
     -- main_ram_update[uxn_c_l345_c19_2006] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l345_c19_2006_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l345_c19_2006_ram_address <= VAR_main_ram_update_uxn_c_l345_c19_2006_ram_address;
     main_ram_update_uxn_c_l345_c19_2006_value <= VAR_main_ram_update_uxn_c_l345_c19_2006_value;
     main_ram_update_uxn_c_l345_c19_2006_write_enable <= VAR_main_ram_update_uxn_c_l345_c19_2006_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l345_c19_2006_return_output := main_ram_update_uxn_c_l345_c19_2006_return_output;

     -- step_gpu[uxn_c_l357_c20_a95a] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l357_c20_a95a_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area <= VAR_step_gpu_uxn_c_l357_c20_a95a_is_active_drawing_area;
     step_gpu_uxn_c_l357_c20_a95a_is_vram_write <= VAR_step_gpu_uxn_c_l357_c20_a95a_is_vram_write;
     step_gpu_uxn_c_l357_c20_a95a_vram_write_layer <= VAR_step_gpu_uxn_c_l357_c20_a95a_vram_write_layer;
     step_gpu_uxn_c_l357_c20_a95a_vram_address <= VAR_step_gpu_uxn_c_l357_c20_a95a_vram_address;
     step_gpu_uxn_c_l357_c20_a95a_vram_value <= VAR_step_gpu_uxn_c_l357_c20_a95a_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l357_c20_a95a_return_output := step_gpu_uxn_c_l357_c20_a95a_return_output;

     -- Submodule level 10
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l345_c19_2006_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l357_c20_a95a_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l359_c92_d6d2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l359_c92_d6d2_return_output := VAR_step_gpu_uxn_c_l357_c20_a95a_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l358_c19_3142] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l358_c19_3142_return_output := VAR_step_gpu_uxn_c_l357_c20_a95a_return_output.is_active_fill;

     -- Submodule level 11
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l358_c19_3142_return_output;
     VAR_palette_snoop_uxn_c_l359_c20_78af_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l359_c92_d6d2_return_output;
     -- palette_snoop[uxn_c_l359_c20_78af] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l359_c20_78af_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l359_c20_78af_device_ram_address <= VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_address;
     palette_snoop_uxn_c_l359_c20_78af_device_ram_value <= VAR_palette_snoop_uxn_c_l359_c20_78af_device_ram_value;
     palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write <= VAR_palette_snoop_uxn_c_l359_c20_78af_is_device_ram_write;
     palette_snoop_uxn_c_l359_c20_78af_gpu_step_color <= VAR_palette_snoop_uxn_c_l359_c20_78af_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l359_c20_78af_return_output := palette_snoop_uxn_c_l359_c20_78af_return_output;

     -- Submodule level 12
     VAR_return_output := VAR_palette_snoop_uxn_c_l359_c20_78af_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l359_c20_78af_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_boot_check <= REG_VAR_boot_check;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_gpu_step_result <= REG_VAR_gpu_step_result;
REG_COMB_cpu_step_result <= REG_VAR_cpu_step_result;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_u16_addr <= REG_VAR_u16_addr;
REG_COMB_screen_vector <= REG_VAR_screen_vector;
REG_COMB_ram_write_value <= REG_VAR_ram_write_value;
REG_COMB_ram_read_value <= REG_VAR_ram_read_value;
REG_COMB_device_ram_address <= REG_VAR_device_ram_address;
REG_COMB_device_ram_read_value <= REG_VAR_device_ram_read_value;
REG_COMB_is_device_ram_write <= REG_VAR_is_device_ram_write;
REG_COMB_is_vram_write <= REG_VAR_is_vram_write;
REG_COMB_vram_write_layer <= REG_VAR_vram_write_layer;
REG_COMB_vram_value <= REG_VAR_vram_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     boot_check <= REG_COMB_boot_check;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     is_booted <= REG_COMB_is_booted;
     gpu_step_result <= REG_COMB_gpu_step_result;
     cpu_step_result <= REG_COMB_cpu_step_result;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     u16_addr <= REG_COMB_u16_addr;
     screen_vector <= REG_COMB_screen_vector;
     ram_write_value <= REG_COMB_ram_write_value;
     ram_read_value <= REG_COMB_ram_read_value;
     device_ram_address <= REG_COMB_device_ram_address;
     device_ram_read_value <= REG_COMB_device_ram_read_value;
     is_device_ram_write <= REG_COMB_is_device_ram_write;
     is_vram_write <= REG_COMB_is_vram_write;
     vram_write_layer <= REG_COMB_vram_write_layer;
     vram_value <= REG_COMB_vram_value;
 end if;
 end if;
end process;

end arch;
