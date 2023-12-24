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
entity uxn_top_0CLK_aeb7c7f5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_aeb7c7f5;
architecture arch of uxn_top_0CLK_aeb7c7f5 is
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
-- UNARY_OP_NOT[uxn_c_l302_c7_87d0]
signal UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l317_c9_defa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l302_c2_44a5]
signal ram_write_value_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l302_c2_44a5]
signal is_vram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l302_c2_44a5]
signal vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l302_c2_44a5]
signal vram_value_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l302_c2_44a5]
signal is_ram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l302_c2_44a5]
signal is_booted_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l302_c2_44a5]
signal device_ram_address_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l302_c2_44a5]
signal cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output : cpu_step_result_t;

-- boot_check_MUX[uxn_c_l302_c2_44a5]
signal boot_check_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(23 downto 0);

-- is_device_ram_write_MUX[uxn_c_l302_c2_44a5]
signal is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l302_c2_44a5]
signal u16_addr_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(15 downto 0);

-- BIN_OP_GT[uxn_c_l311_c44_740b]
signal BIN_OP_GT_uxn_c_l311_c44_740b_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l311_c44_740b_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l311_c44_740b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l311_c65_2ef7]
signal BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l311_c44_bc0a]
signal MUX_uxn_c_l311_c44_bc0a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l311_c44_bc0a_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c44_bc0a_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c44_bc0a_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l311_c16_4baa]
signal MUX_uxn_c_l311_c16_4baa_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l311_c16_4baa_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c16_4baa_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c16_4baa_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l312_c16_d7cf]
signal BIN_OP_EQ_uxn_c_l312_c16_d7cf_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c16_d7cf_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l312_c16_b35d]
signal MUX_uxn_c_l312_c16_b35d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_b35d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_b35d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_b35d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l314_c16_c718]
signal MUX_uxn_c_l314_c16_c718_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_c718_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_c718_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_c718_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l314_c3_83c3]
signal BIN_OP_PLUS_uxn_c_l314_c3_83c3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l314_c3_83c3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l315_c21_f8d3]
signal MUX_uxn_c_l315_c21_f8d3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l315_c21_f8d3_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l315_c21_f8d3_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l315_c21_f8d3_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l317_c14_fb63]
signal UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l317_c1_04d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l317_c9_defa]
signal ram_write_value_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l317_c9_defa]
signal is_vram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l317_c9_defa]
signal vram_write_layer_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l317_c9_defa]
signal vram_value_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l317_c9_defa]
signal is_ram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l317_c9_defa]
signal device_ram_address_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l317_c9_defa]
signal cpu_step_result_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output : cpu_step_result_t;

-- is_device_ram_write_MUX[uxn_c_l317_c9_defa]
signal is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l317_c9_defa]
signal u16_addr_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_defa_return_output : unsigned(15 downto 0);

-- step_cpu[uxn_c_l318_c21_3537]
signal step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l318_c21_3537_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l318_c21_3537_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l318_c21_3537_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l329_c19_8680]
signal main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l329_c19_8680_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l329_c19_8680_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l329_c19_8680_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l329_c19_8680_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l335_c26_325c]
signal device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l335_c26_325c_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l335_c26_325c_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l335_c26_325c_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l335_c26_325c_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l341_c20_d1fb]
signal step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l341_c20_d1fb_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l343_c20_88a1]
signal palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l343_c20_88a1_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l343_c20_88a1_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l343_c20_88a1_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l344_c18_ec9a]
signal vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l344_c18_ec9a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l302_c7_87d0
UNARY_OP_NOT_uxn_c_l302_c7_87d0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr,
UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output);

-- ram_write_value_MUX_uxn_c_l302_c2_44a5
ram_write_value_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l302_c2_44a5_cond,
ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue,
ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse,
ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output);

-- is_vram_write_MUX_uxn_c_l302_c2_44a5
is_vram_write_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l302_c2_44a5_cond,
is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue,
is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse,
is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output);

-- vram_write_layer_MUX_uxn_c_l302_c2_44a5
vram_write_layer_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond,
vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue,
vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse,
vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output);

-- vram_value_MUX_uxn_c_l302_c2_44a5
vram_value_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l302_c2_44a5_cond,
vram_value_MUX_uxn_c_l302_c2_44a5_iftrue,
vram_value_MUX_uxn_c_l302_c2_44a5_iffalse,
vram_value_MUX_uxn_c_l302_c2_44a5_return_output);

-- is_ram_write_MUX_uxn_c_l302_c2_44a5
is_ram_write_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l302_c2_44a5_cond,
is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue,
is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse,
is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output);

-- is_booted_MUX_uxn_c_l302_c2_44a5
is_booted_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l302_c2_44a5_cond,
is_booted_MUX_uxn_c_l302_c2_44a5_iftrue,
is_booted_MUX_uxn_c_l302_c2_44a5_iffalse,
is_booted_MUX_uxn_c_l302_c2_44a5_return_output);

-- device_ram_address_MUX_uxn_c_l302_c2_44a5
device_ram_address_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l302_c2_44a5_cond,
device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue,
device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse,
device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output);

-- cpu_step_result_MUX_uxn_c_l302_c2_44a5
cpu_step_result_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond,
cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue,
cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse,
cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output);

-- boot_check_MUX_uxn_c_l302_c2_44a5
boot_check_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l302_c2_44a5_cond,
boot_check_MUX_uxn_c_l302_c2_44a5_iftrue,
boot_check_MUX_uxn_c_l302_c2_44a5_iffalse,
boot_check_MUX_uxn_c_l302_c2_44a5_return_output);

-- is_device_ram_write_MUX_uxn_c_l302_c2_44a5
is_device_ram_write_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond,
is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue,
is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse,
is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output);

-- u16_addr_MUX_uxn_c_l302_c2_44a5
u16_addr_MUX_uxn_c_l302_c2_44a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l302_c2_44a5_cond,
u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue,
u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse,
u16_addr_MUX_uxn_c_l302_c2_44a5_return_output);

-- BIN_OP_GT_uxn_c_l311_c44_740b
BIN_OP_GT_uxn_c_l311_c44_740b : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l311_c44_740b_left,
BIN_OP_GT_uxn_c_l311_c44_740b_right,
BIN_OP_GT_uxn_c_l311_c44_740b_return_output);

-- BIN_OP_PLUS_uxn_c_l311_c65_2ef7
BIN_OP_PLUS_uxn_c_l311_c65_2ef7 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left,
BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right,
BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output);

-- MUX_uxn_c_l311_c44_bc0a
MUX_uxn_c_l311_c44_bc0a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l311_c44_bc0a_cond,
MUX_uxn_c_l311_c44_bc0a_iftrue,
MUX_uxn_c_l311_c44_bc0a_iffalse,
MUX_uxn_c_l311_c44_bc0a_return_output);

-- MUX_uxn_c_l311_c16_4baa
MUX_uxn_c_l311_c16_4baa : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l311_c16_4baa_cond,
MUX_uxn_c_l311_c16_4baa_iftrue,
MUX_uxn_c_l311_c16_4baa_iffalse,
MUX_uxn_c_l311_c16_4baa_return_output);

-- BIN_OP_EQ_uxn_c_l312_c16_d7cf
BIN_OP_EQ_uxn_c_l312_c16_d7cf : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l312_c16_d7cf_left,
BIN_OP_EQ_uxn_c_l312_c16_d7cf_right,
BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output);

-- MUX_uxn_c_l312_c16_b35d
MUX_uxn_c_l312_c16_b35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l312_c16_b35d_cond,
MUX_uxn_c_l312_c16_b35d_iftrue,
MUX_uxn_c_l312_c16_b35d_iffalse,
MUX_uxn_c_l312_c16_b35d_return_output);

-- MUX_uxn_c_l314_c16_c718
MUX_uxn_c_l314_c16_c718 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l314_c16_c718_cond,
MUX_uxn_c_l314_c16_c718_iftrue,
MUX_uxn_c_l314_c16_c718_iffalse,
MUX_uxn_c_l314_c16_c718_return_output);

-- BIN_OP_PLUS_uxn_c_l314_c3_83c3
BIN_OP_PLUS_uxn_c_l314_c3_83c3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l314_c3_83c3_left,
BIN_OP_PLUS_uxn_c_l314_c3_83c3_right,
BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output);

-- MUX_uxn_c_l315_c21_f8d3
MUX_uxn_c_l315_c21_f8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l315_c21_f8d3_cond,
MUX_uxn_c_l315_c21_f8d3_iftrue,
MUX_uxn_c_l315_c21_f8d3_iffalse,
MUX_uxn_c_l315_c21_f8d3_return_output);

-- UNARY_OP_NOT_uxn_c_l317_c14_fb63
UNARY_OP_NOT_uxn_c_l317_c14_fb63 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr,
UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output);

-- ram_write_value_MUX_uxn_c_l317_c9_defa
ram_write_value_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l317_c9_defa_cond,
ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue,
ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse,
ram_write_value_MUX_uxn_c_l317_c9_defa_return_output);

-- is_vram_write_MUX_uxn_c_l317_c9_defa
is_vram_write_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l317_c9_defa_cond,
is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue,
is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse,
is_vram_write_MUX_uxn_c_l317_c9_defa_return_output);

-- vram_write_layer_MUX_uxn_c_l317_c9_defa
vram_write_layer_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l317_c9_defa_cond,
vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue,
vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse,
vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output);

-- vram_value_MUX_uxn_c_l317_c9_defa
vram_value_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l317_c9_defa_cond,
vram_value_MUX_uxn_c_l317_c9_defa_iftrue,
vram_value_MUX_uxn_c_l317_c9_defa_iffalse,
vram_value_MUX_uxn_c_l317_c9_defa_return_output);

-- is_ram_write_MUX_uxn_c_l317_c9_defa
is_ram_write_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l317_c9_defa_cond,
is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue,
is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse,
is_ram_write_MUX_uxn_c_l317_c9_defa_return_output);

-- device_ram_address_MUX_uxn_c_l317_c9_defa
device_ram_address_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l317_c9_defa_cond,
device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue,
device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse,
device_ram_address_MUX_uxn_c_l317_c9_defa_return_output);

-- cpu_step_result_MUX_uxn_c_l317_c9_defa
cpu_step_result_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l317_c9_defa_cond,
cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue,
cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse,
cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output);

-- is_device_ram_write_MUX_uxn_c_l317_c9_defa
is_device_ram_write_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond,
is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue,
is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse,
is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output);

-- u16_addr_MUX_uxn_c_l317_c9_defa
u16_addr_MUX_uxn_c_l317_c9_defa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l317_c9_defa_cond,
u16_addr_MUX_uxn_c_l317_c9_defa_iftrue,
u16_addr_MUX_uxn_c_l317_c9_defa_iffalse,
u16_addr_MUX_uxn_c_l317_c9_defa_return_output);

-- step_cpu_uxn_c_l318_c21_3537
step_cpu_uxn_c_l318_c21_3537 : entity work.step_cpu_0CLK_c0bf3804 port map (
clk,
step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE,
step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value,
step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read,
step_cpu_uxn_c_l318_c21_3537_use_vector,
step_cpu_uxn_c_l318_c21_3537_vector,
step_cpu_uxn_c_l318_c21_3537_return_output);

-- main_ram_update_uxn_c_l329_c19_8680
main_ram_update_uxn_c_l329_c19_8680 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE,
main_ram_update_uxn_c_l329_c19_8680_ram_address,
main_ram_update_uxn_c_l329_c19_8680_value,
main_ram_update_uxn_c_l329_c19_8680_write_enable,
main_ram_update_uxn_c_l329_c19_8680_return_output);

-- device_ram_update_uxn_c_l335_c26_325c
device_ram_update_uxn_c_l335_c26_325c : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE,
device_ram_update_uxn_c_l335_c26_325c_device_address,
device_ram_update_uxn_c_l335_c26_325c_value,
device_ram_update_uxn_c_l335_c26_325c_write_enable,
device_ram_update_uxn_c_l335_c26_325c_return_output);

-- step_gpu_uxn_c_l341_c20_d1fb
step_gpu_uxn_c_l341_c20_d1fb : entity work.step_gpu_0CLK_6d83165a port map (
clk,
step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE,
step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area,
step_gpu_uxn_c_l341_c20_d1fb_is_vram_write,
step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer,
step_gpu_uxn_c_l341_c20_d1fb_vram_address,
step_gpu_uxn_c_l341_c20_d1fb_vram_value,
step_gpu_uxn_c_l341_c20_d1fb_return_output);

-- palette_snoop_uxn_c_l343_c20_88a1
palette_snoop_uxn_c_l343_c20_88a1 : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE,
palette_snoop_uxn_c_l343_c20_88a1_device_ram_address,
palette_snoop_uxn_c_l343_c20_88a1_device_ram_value,
palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write,
palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color,
palette_snoop_uxn_c_l343_c20_88a1_return_output);

-- vector_snoop_uxn_c_l344_c18_ec9a
vector_snoop_uxn_c_l344_c18_ec9a : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE,
vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address,
vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value,
vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write,
vector_snoop_uxn_c_l344_c18_ec9a_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output);



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
 UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output,
 ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output,
 is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output,
 vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output,
 vram_value_MUX_uxn_c_l302_c2_44a5_return_output,
 is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output,
 is_booted_MUX_uxn_c_l302_c2_44a5_return_output,
 device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output,
 cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output,
 boot_check_MUX_uxn_c_l302_c2_44a5_return_output,
 is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output,
 u16_addr_MUX_uxn_c_l302_c2_44a5_return_output,
 BIN_OP_GT_uxn_c_l311_c44_740b_return_output,
 BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output,
 MUX_uxn_c_l311_c44_bc0a_return_output,
 MUX_uxn_c_l311_c16_4baa_return_output,
 BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output,
 MUX_uxn_c_l312_c16_b35d_return_output,
 MUX_uxn_c_l314_c16_c718_return_output,
 BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output,
 MUX_uxn_c_l315_c21_f8d3_return_output,
 UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output,
 ram_write_value_MUX_uxn_c_l317_c9_defa_return_output,
 is_vram_write_MUX_uxn_c_l317_c9_defa_return_output,
 vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output,
 vram_value_MUX_uxn_c_l317_c9_defa_return_output,
 is_ram_write_MUX_uxn_c_l317_c9_defa_return_output,
 device_ram_address_MUX_uxn_c_l317_c9_defa_return_output,
 cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output,
 is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output,
 u16_addr_MUX_uxn_c_l317_c9_defa_return_output,
 step_cpu_uxn_c_l318_c21_3537_return_output,
 main_ram_update_uxn_c_l329_c19_8680_return_output,
 device_ram_update_uxn_c_l335_c26_325c_return_output,
 step_gpu_uxn_c_l341_c20_d1fb_return_output,
 palette_snoop_uxn_c_l343_c20_88a1_return_output,
 vector_snoop_uxn_c_l344_c18_ec9a_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l314_c3_00b0 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_defa_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_4baa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_4baa_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_4baa_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_bc0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l311_c44_740b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l311_c44_740b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l311_c44_740b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_bc0a_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_bc0a_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_bc0a_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_4baa_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_b35d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_b35d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_b35d_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_b35d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_c718_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_c718_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_c718_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_c718_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f8d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f8d3_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f8d3_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f8d3_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_defa_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_6630_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_3537_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_a4ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_40a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_5a7b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_86d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_f5d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_14b7_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_8680_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_8680_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_8680_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_8680_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_325c_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_325c_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_325c_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_325c_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_d1fb_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_75cb_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_6412_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_88a1_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_ec9a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_f2de_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l311_c16_4baa_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l314_c16_c718_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l311_c44_740b_right := to_unsigned(255, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l311_c44_bc0a_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l315_c21_f8d3_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l312_c16_b35d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l312_c16_b35d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l314_c16_c718_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l311_c16_4baa_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l315_c21_f8d3_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l318_c21_3537_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l311_c44_740b_left := u16_addr;
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_left := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l317_c9_defa_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l317_c14_fb63] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr <= VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output := UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;

     -- BIN_OP_PLUS[uxn_c_l311_c65_2ef7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left <= VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_left;
     BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right <= VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output := BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output;

     -- UNARY_OP_NOT[uxn_c_l302_c7_87d0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr <= VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output := UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l318_c69_6630] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_6630_return_output := gpu_step_result.is_new_frame;

     -- BIN_OP_GT[uxn_c_l311_c44_740b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l311_c44_740b_left <= VAR_BIN_OP_GT_uxn_c_l311_c44_740b_left;
     BIN_OP_GT_uxn_c_l311_c44_740b_right <= VAR_BIN_OP_GT_uxn_c_l311_c44_740b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l311_c44_740b_return_output := BIN_OP_GT_uxn_c_l311_c44_740b_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l311_c44_bc0a_cond := VAR_BIN_OP_GT_uxn_c_l311_c44_740b_return_output;
     VAR_MUX_uxn_c_l311_c44_bc0a_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l311_c65_2ef7_return_output, 24);
     VAR_step_cpu_uxn_c_l318_c21_3537_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_6630_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_boot_check_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_is_booted_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_vram_value_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_87d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_u16_addr_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_vram_value_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_fb63_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output;

     -- MUX[uxn_c_l311_c44_bc0a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l311_c44_bc0a_cond <= VAR_MUX_uxn_c_l311_c44_bc0a_cond;
     MUX_uxn_c_l311_c44_bc0a_iftrue <= VAR_MUX_uxn_c_l311_c44_bc0a_iftrue;
     MUX_uxn_c_l311_c44_bc0a_iffalse <= VAR_MUX_uxn_c_l311_c44_bc0a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l311_c44_bc0a_return_output := MUX_uxn_c_l311_c44_bc0a_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_MUX_uxn_c_l311_c16_4baa_iffalse := VAR_MUX_uxn_c_l311_c44_bc0a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l317_c1_04d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output;

     -- MUX[uxn_c_l311_c16_4baa] LATENCY=0
     -- Inputs
     MUX_uxn_c_l311_c16_4baa_cond <= VAR_MUX_uxn_c_l311_c16_4baa_cond;
     MUX_uxn_c_l311_c16_4baa_iftrue <= VAR_MUX_uxn_c_l311_c16_4baa_iftrue;
     MUX_uxn_c_l311_c16_4baa_iffalse <= VAR_MUX_uxn_c_l311_c16_4baa_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l311_c16_4baa_return_output := MUX_uxn_c_l311_c16_4baa_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_left := VAR_MUX_uxn_c_l311_c16_4baa_return_output;
     VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iftrue := VAR_MUX_uxn_c_l311_c16_4baa_return_output;
     VAR_step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_04d4_return_output;
     -- step_cpu[uxn_c_l318_c21_3537] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l318_c21_3537_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value <= VAR_step_cpu_uxn_c_l318_c21_3537_previous_ram_read_value;
     step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read <= VAR_step_cpu_uxn_c_l318_c21_3537_previous_device_ram_read;
     step_cpu_uxn_c_l318_c21_3537_use_vector <= VAR_step_cpu_uxn_c_l318_c21_3537_use_vector;
     step_cpu_uxn_c_l318_c21_3537_vector <= VAR_step_cpu_uxn_c_l318_c21_3537_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l318_c21_3537_return_output := step_cpu_uxn_c_l318_c21_3537_return_output;

     -- boot_check_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l302_c2_44a5_cond <= VAR_boot_check_MUX_uxn_c_l302_c2_44a5_cond;
     boot_check_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iftrue;
     boot_check_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_boot_check_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l302_c2_44a5_return_output := boot_check_MUX_uxn_c_l302_c2_44a5_return_output;

     -- BIN_OP_EQ[uxn_c_l312_c16_d7cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l312_c16_d7cf_left <= VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_left;
     BIN_OP_EQ_uxn_c_l312_c16_d7cf_right <= VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output := BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l312_c16_b35d_cond := VAR_BIN_OP_EQ_uxn_c_l312_c16_d7cf_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue := VAR_step_cpu_uxn_c_l318_c21_3537_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l322_c25_86d1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_86d1_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l320_c14_40a7] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_40a7_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l321_c24_5a7b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_5a7b_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l325_c22_14b7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_14b7_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_f2de LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_f2de_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l324_c19_f5d1] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_f5d1_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.is_vram_write;

     -- MUX[uxn_c_l312_c16_b35d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l312_c16_b35d_cond <= VAR_MUX_uxn_c_l312_c16_b35d_cond;
     MUX_uxn_c_l312_c16_b35d_iftrue <= VAR_MUX_uxn_c_l312_c16_b35d_iftrue;
     MUX_uxn_c_l312_c16_b35d_iffalse <= VAR_MUX_uxn_c_l312_c16_b35d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l312_c16_b35d_return_output := MUX_uxn_c_l312_c16_b35d_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l319_c18_a4ec] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_a4ec_return_output := VAR_step_cpu_uxn_c_l318_c21_3537_return_output.is_ram_write;

     -- cpu_step_result_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l317_c9_defa_cond <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_cond;
     cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iftrue;
     cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output := cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_40a7_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_86d1_return_output;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_a4ec_return_output;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_f5d1_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_14b7_return_output;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_5a7b_return_output;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_f2de_return_output;
     VAR_vram_value_MUX_uxn_c_l317_c9_defa_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_f2de_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right := VAR_MUX_uxn_c_l312_c16_b35d_return_output;
     VAR_MUX_uxn_c_l315_c21_f8d3_cond := VAR_MUX_uxn_c_l312_c16_b35d_return_output;
     VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iftrue := VAR_MUX_uxn_c_l312_c16_b35d_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_cpu_step_result_MUX_uxn_c_l317_c9_defa_return_output;
     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output;

     -- cpu_step_result_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_cond;
     cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iftrue;
     cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output := cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output;

     -- vram_value_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l317_c9_defa_cond <= VAR_vram_value_MUX_uxn_c_l317_c9_defa_cond;
     vram_value_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_vram_value_MUX_uxn_c_l317_c9_defa_iftrue;
     vram_value_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_vram_value_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l317_c9_defa_return_output := vram_value_MUX_uxn_c_l317_c9_defa_return_output;

     -- is_device_ram_write_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_cond;
     is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iftrue;
     is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output := is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output;

     -- is_booted_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l302_c2_44a5_cond <= VAR_is_booted_MUX_uxn_c_l302_c2_44a5_cond;
     is_booted_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iftrue;
     is_booted_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_is_booted_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l302_c2_44a5_return_output := is_booted_MUX_uxn_c_l302_c2_44a5_return_output;

     -- device_ram_address_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l317_c9_defa_cond <= VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_cond;
     device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iftrue;
     device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_return_output := device_ram_address_MUX_uxn_c_l317_c9_defa_return_output;

     -- is_vram_write_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l317_c9_defa_cond <= VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_cond;
     is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iftrue;
     is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_return_output := is_vram_write_MUX_uxn_c_l317_c9_defa_return_output;

     -- is_ram_write_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l317_c9_defa_cond <= VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_cond;
     is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iftrue;
     is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_return_output := is_ram_write_MUX_uxn_c_l317_c9_defa_return_output;

     -- vram_write_layer_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l317_c9_defa_cond <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_cond;
     vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iftrue;
     vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output := vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output;

     -- u16_addr_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l317_c9_defa_cond <= VAR_u16_addr_MUX_uxn_c_l317_c9_defa_cond;
     u16_addr_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iftrue;
     u16_addr_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_u16_addr_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l317_c9_defa_return_output := u16_addr_MUX_uxn_c_l317_c9_defa_return_output;

     -- ram_write_value_MUX[uxn_c_l317_c9_defa] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l317_c9_defa_cond <= VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_cond;
     ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue <= VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iftrue;
     ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse <= VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_return_output := ram_write_value_MUX_uxn_c_l317_c9_defa_return_output;

     -- MUX[uxn_c_l315_c21_f8d3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l315_c21_f8d3_cond <= VAR_MUX_uxn_c_l315_c21_f8d3_cond;
     MUX_uxn_c_l315_c21_f8d3_iftrue <= VAR_MUX_uxn_c_l315_c21_f8d3_iftrue;
     MUX_uxn_c_l315_c21_f8d3_iffalse <= VAR_MUX_uxn_c_l315_c21_f8d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l315_c21_f8d3_return_output := MUX_uxn_c_l315_c21_f8d3_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l314_c16_c718_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_b6d2_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue := VAR_MUX_uxn_c_l315_c21_f8d3_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_device_ram_address_MUX_uxn_c_l317_c9_defa_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_is_ram_write_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_is_vram_write_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_ram_write_value_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_u16_addr_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_vram_value_MUX_uxn_c_l317_c9_defa_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse := VAR_vram_write_layer_MUX_uxn_c_l317_c9_defa_return_output;
     -- ram_write_value_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l302_c2_44a5_cond <= VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_cond;
     ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iftrue;
     ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output := ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;

     -- MUX[uxn_c_l314_c16_c718] LATENCY=0
     -- Inputs
     MUX_uxn_c_l314_c16_c718_cond <= VAR_MUX_uxn_c_l314_c16_c718_cond;
     MUX_uxn_c_l314_c16_c718_iftrue <= VAR_MUX_uxn_c_l314_c16_c718_iftrue;
     MUX_uxn_c_l314_c16_c718_iffalse <= VAR_MUX_uxn_c_l314_c16_c718_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l314_c16_c718_return_output := MUX_uxn_c_l314_c16_c718_return_output;

     -- is_ram_write_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l302_c2_44a5_cond <= VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_cond;
     is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue;
     is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output := is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;

     -- is_vram_write_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l302_c2_44a5_cond <= VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_cond;
     is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iftrue;
     is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output := is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output;

     -- vram_value_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l302_c2_44a5_cond <= VAR_vram_value_MUX_uxn_c_l302_c2_44a5_cond;
     vram_value_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iftrue;
     vram_value_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_vram_value_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l302_c2_44a5_return_output := vram_value_MUX_uxn_c_l302_c2_44a5_return_output;

     -- is_device_ram_write_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_cond;
     is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iftrue;
     is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output := is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;

     -- vram_write_layer_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_cond;
     vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iftrue;
     vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output := vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output;

     -- device_ram_address_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l302_c2_44a5_cond <= VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_cond;
     device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iftrue;
     device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output := device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_right := VAR_MUX_uxn_c_l314_c16_c718_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_325c_device_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_325c_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_main_ram_update_uxn_c_l329_c19_8680_write_enable := VAR_is_ram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_325c_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_main_ram_update_uxn_c_l329_c19_8680_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_value := VAR_vram_value_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l302_c2_44a5_return_output;
     -- BIN_OP_PLUS[uxn_c_l314_c3_83c3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l314_c3_83c3_left <= VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_left;
     BIN_OP_PLUS_uxn_c_l314_c3_83c3_right <= VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output := BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output;

     -- vector_snoop[uxn_c_l344_c18_ec9a] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l344_c18_ec9a_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address <= VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_address;
     vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value <= VAR_vector_snoop_uxn_c_l344_c18_ec9a_device_ram_value;
     vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write <= VAR_vector_snoop_uxn_c_l344_c18_ec9a_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l344_c18_ec9a_return_output := vector_snoop_uxn_c_l344_c18_ec9a_return_output;

     -- device_ram_update[uxn_c_l335_c26_325c] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l335_c26_325c_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l335_c26_325c_device_address <= VAR_device_ram_update_uxn_c_l335_c26_325c_device_address;
     device_ram_update_uxn_c_l335_c26_325c_value <= VAR_device_ram_update_uxn_c_l335_c26_325c_value;
     device_ram_update_uxn_c_l335_c26_325c_write_enable <= VAR_device_ram_update_uxn_c_l335_c26_325c_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l335_c26_325c_return_output := device_ram_update_uxn_c_l335_c26_325c_return_output;

     -- Submodule level 8
     VAR_u16_addr_uxn_c_l314_c3_00b0 := resize(VAR_BIN_OP_PLUS_uxn_c_l314_c3_83c3_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l335_c26_325c_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l344_c18_ec9a_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue := VAR_u16_addr_uxn_c_l314_c3_00b0;
     -- u16_addr_MUX[uxn_c_l302_c2_44a5] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l302_c2_44a5_cond <= VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_cond;
     u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue <= VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iftrue;
     u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse <= VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_return_output := u16_addr_MUX_uxn_c_l302_c2_44a5_return_output;

     -- Submodule level 9
     VAR_main_ram_update_uxn_c_l329_c19_8680_ram_address := VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_return_output;
     VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_address := VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l302_c2_44a5_return_output;
     -- step_gpu[uxn_c_l341_c20_d1fb] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l341_c20_d1fb_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area <= VAR_step_gpu_uxn_c_l341_c20_d1fb_is_active_drawing_area;
     step_gpu_uxn_c_l341_c20_d1fb_is_vram_write <= VAR_step_gpu_uxn_c_l341_c20_d1fb_is_vram_write;
     step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer <= VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_write_layer;
     step_gpu_uxn_c_l341_c20_d1fb_vram_address <= VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_address;
     step_gpu_uxn_c_l341_c20_d1fb_vram_value <= VAR_step_gpu_uxn_c_l341_c20_d1fb_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l341_c20_d1fb_return_output := step_gpu_uxn_c_l341_c20_d1fb_return_output;

     -- main_ram_update[uxn_c_l329_c19_8680] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l329_c19_8680_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l329_c19_8680_ram_address <= VAR_main_ram_update_uxn_c_l329_c19_8680_ram_address;
     main_ram_update_uxn_c_l329_c19_8680_value <= VAR_main_ram_update_uxn_c_l329_c19_8680_value;
     main_ram_update_uxn_c_l329_c19_8680_write_enable <= VAR_main_ram_update_uxn_c_l329_c19_8680_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l329_c19_8680_return_output := main_ram_update_uxn_c_l329_c19_8680_return_output;

     -- Submodule level 10
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l329_c19_8680_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l341_c20_d1fb_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l343_c92_6412] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_6412_return_output := VAR_step_gpu_uxn_c_l341_c20_d1fb_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l342_c19_75cb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_75cb_return_output := VAR_step_gpu_uxn_c_l341_c20_d1fb_return_output.is_active_fill;

     -- Submodule level 11
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_75cb_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_6412_return_output;
     -- palette_snoop[uxn_c_l343_c20_88a1] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l343_c20_88a1_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l343_c20_88a1_device_ram_address <= VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_address;
     palette_snoop_uxn_c_l343_c20_88a1_device_ram_value <= VAR_palette_snoop_uxn_c_l343_c20_88a1_device_ram_value;
     palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write <= VAR_palette_snoop_uxn_c_l343_c20_88a1_is_device_ram_write;
     palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color <= VAR_palette_snoop_uxn_c_l343_c20_88a1_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l343_c20_88a1_return_output := palette_snoop_uxn_c_l343_c20_88a1_return_output;

     -- Submodule level 12
     VAR_return_output := VAR_palette_snoop_uxn_c_l343_c20_88a1_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l343_c20_88a1_return_output;
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
