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
-- Submodules: 42
entity uxn_top_0CLK_6a42bcc4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_6a42bcc4;
architecture arch of uxn_top_0CLK_6a42bcc4 is
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
-- UNARY_OP_NOT[uxn_c_l302_c7_3059]
signal UNARY_OP_NOT_uxn_c_l302_c7_3059_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l317_c9_572c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l302_c2_455c]
signal device_ram_address_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l302_c2_455c]
signal is_ram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l302_c2_455c]
signal ram_write_value_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l302_c2_455c]
signal cpu_step_result_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output : cpu_step_result_t;

-- is_booted_MUX[uxn_c_l302_c2_455c]
signal is_booted_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l302_c2_455c]
signal vram_value_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);

-- u16_addr_MUX[uxn_c_l302_c2_455c]
signal u16_addr_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l302_c2_455c_return_output : unsigned(15 downto 0);

-- vram_write_layer_MUX[uxn_c_l302_c2_455c]
signal vram_write_layer_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l302_c2_455c]
signal is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);

-- boot_check_MUX[uxn_c_l302_c2_455c]
signal boot_check_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l302_c2_455c_return_output : unsigned(23 downto 0);

-- is_vram_write_MUX[uxn_c_l302_c2_455c]
signal is_vram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_c_l311_c54_e048]
signal CONST_SR_8_uxn_c_l311_c54_e048_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_c_l311_c54_e048_return_output : unsigned(15 downto 0);

-- BIN_OP_NEQ[uxn_c_l311_c44_cd60]
signal BIN_OP_NEQ_uxn_c_l311_c44_cd60_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l311_c44_cd60_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l311_c77_6359]
signal BIN_OP_PLUS_uxn_c_l311_c77_6359_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l311_c77_6359_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l311_c44_12d5]
signal MUX_uxn_c_l311_c44_12d5_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l311_c44_12d5_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c44_12d5_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c44_12d5_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l311_c16_02c7]
signal MUX_uxn_c_l311_c16_02c7_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l311_c16_02c7_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c16_02c7_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l311_c16_02c7_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l312_c16_f90f]
signal BIN_OP_EQ_uxn_c_l312_c16_f90f_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c16_f90f_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l312_c16_732e]
signal MUX_uxn_c_l312_c16_732e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_732e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_732e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l312_c16_732e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l314_c16_f258]
signal MUX_uxn_c_l314_c16_f258_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_f258_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_f258_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_f258_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l314_c3_6eae]
signal BIN_OP_PLUS_uxn_c_l314_c3_6eae_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l314_c3_6eae_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l315_c21_f24e]
signal MUX_uxn_c_l315_c21_f24e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l315_c21_f24e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l315_c21_f24e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l315_c21_f24e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l317_c14_b334]
signal UNARY_OP_NOT_uxn_c_l317_c14_b334_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l317_c1_3697]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l317_c9_572c]
signal device_ram_address_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l317_c9_572c]
signal is_ram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l317_c9_572c]
signal ram_write_value_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l317_c9_572c]
signal cpu_step_result_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output : cpu_step_result_t;

-- vram_value_MUX[uxn_c_l317_c9_572c]
signal vram_value_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);

-- u16_addr_MUX[uxn_c_l317_c9_572c]
signal u16_addr_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l317_c9_572c_return_output : unsigned(15 downto 0);

-- vram_write_layer_MUX[uxn_c_l317_c9_572c]
signal vram_write_layer_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l317_c9_572c]
signal is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l317_c9_572c]
signal is_vram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l318_c21_f4d5]
signal step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l318_c21_f4d5_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l318_c21_f4d5_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l318_c21_f4d5_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l329_c19_e76a]
signal main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l329_c19_e76a_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l329_c19_e76a_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l329_c19_e76a_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l329_c19_e76a_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l335_c26_fc6a]
signal device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l335_c26_fc6a_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l335_c26_fc6a_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l335_c26_fc6a_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l335_c26_fc6a_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l341_c20_ab83]
signal step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l341_c20_ab83_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l343_c20_f3b1]
signal palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l343_c20_f3b1_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l344_c18_8179]
signal vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l344_c18_8179_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l344_c18_8179_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l344_c18_8179_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l302_c7_3059
UNARY_OP_NOT_uxn_c_l302_c7_3059 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l302_c7_3059_expr,
UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output);

-- device_ram_address_MUX_uxn_c_l302_c2_455c
device_ram_address_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l302_c2_455c_cond,
device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue,
device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse,
device_ram_address_MUX_uxn_c_l302_c2_455c_return_output);

-- is_ram_write_MUX_uxn_c_l302_c2_455c
is_ram_write_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l302_c2_455c_cond,
is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue,
is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse,
is_ram_write_MUX_uxn_c_l302_c2_455c_return_output);

-- ram_write_value_MUX_uxn_c_l302_c2_455c
ram_write_value_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l302_c2_455c_cond,
ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue,
ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse,
ram_write_value_MUX_uxn_c_l302_c2_455c_return_output);

-- cpu_step_result_MUX_uxn_c_l302_c2_455c
cpu_step_result_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l302_c2_455c_cond,
cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue,
cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse,
cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output);

-- is_booted_MUX_uxn_c_l302_c2_455c
is_booted_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l302_c2_455c_cond,
is_booted_MUX_uxn_c_l302_c2_455c_iftrue,
is_booted_MUX_uxn_c_l302_c2_455c_iffalse,
is_booted_MUX_uxn_c_l302_c2_455c_return_output);

-- vram_value_MUX_uxn_c_l302_c2_455c
vram_value_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l302_c2_455c_cond,
vram_value_MUX_uxn_c_l302_c2_455c_iftrue,
vram_value_MUX_uxn_c_l302_c2_455c_iffalse,
vram_value_MUX_uxn_c_l302_c2_455c_return_output);

-- u16_addr_MUX_uxn_c_l302_c2_455c
u16_addr_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l302_c2_455c_cond,
u16_addr_MUX_uxn_c_l302_c2_455c_iftrue,
u16_addr_MUX_uxn_c_l302_c2_455c_iffalse,
u16_addr_MUX_uxn_c_l302_c2_455c_return_output);

-- vram_write_layer_MUX_uxn_c_l302_c2_455c
vram_write_layer_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l302_c2_455c_cond,
vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue,
vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse,
vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output);

-- is_device_ram_write_MUX_uxn_c_l302_c2_455c
is_device_ram_write_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond,
is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue,
is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse,
is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output);

-- boot_check_MUX_uxn_c_l302_c2_455c
boot_check_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l302_c2_455c_cond,
boot_check_MUX_uxn_c_l302_c2_455c_iftrue,
boot_check_MUX_uxn_c_l302_c2_455c_iffalse,
boot_check_MUX_uxn_c_l302_c2_455c_return_output);

-- is_vram_write_MUX_uxn_c_l302_c2_455c
is_vram_write_MUX_uxn_c_l302_c2_455c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l302_c2_455c_cond,
is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue,
is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse,
is_vram_write_MUX_uxn_c_l302_c2_455c_return_output);

-- CONST_SR_8_uxn_c_l311_c54_e048
CONST_SR_8_uxn_c_l311_c54_e048 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_c_l311_c54_e048_x,
CONST_SR_8_uxn_c_l311_c54_e048_return_output);

-- BIN_OP_NEQ_uxn_c_l311_c44_cd60
BIN_OP_NEQ_uxn_c_l311_c44_cd60 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l311_c44_cd60_left,
BIN_OP_NEQ_uxn_c_l311_c44_cd60_right,
BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output);

-- BIN_OP_PLUS_uxn_c_l311_c77_6359
BIN_OP_PLUS_uxn_c_l311_c77_6359 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l311_c77_6359_left,
BIN_OP_PLUS_uxn_c_l311_c77_6359_right,
BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output);

-- MUX_uxn_c_l311_c44_12d5
MUX_uxn_c_l311_c44_12d5 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l311_c44_12d5_cond,
MUX_uxn_c_l311_c44_12d5_iftrue,
MUX_uxn_c_l311_c44_12d5_iffalse,
MUX_uxn_c_l311_c44_12d5_return_output);

-- MUX_uxn_c_l311_c16_02c7
MUX_uxn_c_l311_c16_02c7 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l311_c16_02c7_cond,
MUX_uxn_c_l311_c16_02c7_iftrue,
MUX_uxn_c_l311_c16_02c7_iffalse,
MUX_uxn_c_l311_c16_02c7_return_output);

-- BIN_OP_EQ_uxn_c_l312_c16_f90f
BIN_OP_EQ_uxn_c_l312_c16_f90f : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l312_c16_f90f_left,
BIN_OP_EQ_uxn_c_l312_c16_f90f_right,
BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output);

-- MUX_uxn_c_l312_c16_732e
MUX_uxn_c_l312_c16_732e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l312_c16_732e_cond,
MUX_uxn_c_l312_c16_732e_iftrue,
MUX_uxn_c_l312_c16_732e_iffalse,
MUX_uxn_c_l312_c16_732e_return_output);

-- MUX_uxn_c_l314_c16_f258
MUX_uxn_c_l314_c16_f258 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l314_c16_f258_cond,
MUX_uxn_c_l314_c16_f258_iftrue,
MUX_uxn_c_l314_c16_f258_iffalse,
MUX_uxn_c_l314_c16_f258_return_output);

-- BIN_OP_PLUS_uxn_c_l314_c3_6eae
BIN_OP_PLUS_uxn_c_l314_c3_6eae : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l314_c3_6eae_left,
BIN_OP_PLUS_uxn_c_l314_c3_6eae_right,
BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output);

-- MUX_uxn_c_l315_c21_f24e
MUX_uxn_c_l315_c21_f24e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l315_c21_f24e_cond,
MUX_uxn_c_l315_c21_f24e_iftrue,
MUX_uxn_c_l315_c21_f24e_iffalse,
MUX_uxn_c_l315_c21_f24e_return_output);

-- UNARY_OP_NOT_uxn_c_l317_c14_b334
UNARY_OP_NOT_uxn_c_l317_c14_b334 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l317_c14_b334_expr,
UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output);

-- device_ram_address_MUX_uxn_c_l317_c9_572c
device_ram_address_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l317_c9_572c_cond,
device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue,
device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse,
device_ram_address_MUX_uxn_c_l317_c9_572c_return_output);

-- is_ram_write_MUX_uxn_c_l317_c9_572c
is_ram_write_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l317_c9_572c_cond,
is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue,
is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse,
is_ram_write_MUX_uxn_c_l317_c9_572c_return_output);

-- ram_write_value_MUX_uxn_c_l317_c9_572c
ram_write_value_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l317_c9_572c_cond,
ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue,
ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse,
ram_write_value_MUX_uxn_c_l317_c9_572c_return_output);

-- cpu_step_result_MUX_uxn_c_l317_c9_572c
cpu_step_result_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l317_c9_572c_cond,
cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue,
cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse,
cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output);

-- vram_value_MUX_uxn_c_l317_c9_572c
vram_value_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l317_c9_572c_cond,
vram_value_MUX_uxn_c_l317_c9_572c_iftrue,
vram_value_MUX_uxn_c_l317_c9_572c_iffalse,
vram_value_MUX_uxn_c_l317_c9_572c_return_output);

-- u16_addr_MUX_uxn_c_l317_c9_572c
u16_addr_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l317_c9_572c_cond,
u16_addr_MUX_uxn_c_l317_c9_572c_iftrue,
u16_addr_MUX_uxn_c_l317_c9_572c_iffalse,
u16_addr_MUX_uxn_c_l317_c9_572c_return_output);

-- vram_write_layer_MUX_uxn_c_l317_c9_572c
vram_write_layer_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l317_c9_572c_cond,
vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue,
vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse,
vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output);

-- is_device_ram_write_MUX_uxn_c_l317_c9_572c
is_device_ram_write_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond,
is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue,
is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse,
is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output);

-- is_vram_write_MUX_uxn_c_l317_c9_572c
is_vram_write_MUX_uxn_c_l317_c9_572c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l317_c9_572c_cond,
is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue,
is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse,
is_vram_write_MUX_uxn_c_l317_c9_572c_return_output);

-- step_cpu_uxn_c_l318_c21_f4d5
step_cpu_uxn_c_l318_c21_f4d5 : entity work.step_cpu_0CLK_c0bf3804 port map (
clk,
step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE,
step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value,
step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read,
step_cpu_uxn_c_l318_c21_f4d5_use_vector,
step_cpu_uxn_c_l318_c21_f4d5_vector,
step_cpu_uxn_c_l318_c21_f4d5_return_output);

-- main_ram_update_uxn_c_l329_c19_e76a
main_ram_update_uxn_c_l329_c19_e76a : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE,
main_ram_update_uxn_c_l329_c19_e76a_ram_address,
main_ram_update_uxn_c_l329_c19_e76a_value,
main_ram_update_uxn_c_l329_c19_e76a_write_enable,
main_ram_update_uxn_c_l329_c19_e76a_return_output);

-- device_ram_update_uxn_c_l335_c26_fc6a
device_ram_update_uxn_c_l335_c26_fc6a : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE,
device_ram_update_uxn_c_l335_c26_fc6a_device_address,
device_ram_update_uxn_c_l335_c26_fc6a_value,
device_ram_update_uxn_c_l335_c26_fc6a_write_enable,
device_ram_update_uxn_c_l335_c26_fc6a_return_output);

-- step_gpu_uxn_c_l341_c20_ab83
step_gpu_uxn_c_l341_c20_ab83 : entity work.step_gpu_0CLK_6d83165a port map (
clk,
step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE,
step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area,
step_gpu_uxn_c_l341_c20_ab83_is_vram_write,
step_gpu_uxn_c_l341_c20_ab83_vram_write_layer,
step_gpu_uxn_c_l341_c20_ab83_vram_address,
step_gpu_uxn_c_l341_c20_ab83_vram_value,
step_gpu_uxn_c_l341_c20_ab83_return_output);

-- palette_snoop_uxn_c_l343_c20_f3b1
palette_snoop_uxn_c_l343_c20_f3b1 : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE,
palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address,
palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value,
palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write,
palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color,
palette_snoop_uxn_c_l343_c20_f3b1_return_output);

-- vector_snoop_uxn_c_l344_c18_8179
vector_snoop_uxn_c_l344_c18_8179 : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE,
vector_snoop_uxn_c_l344_c18_8179_device_ram_address,
vector_snoop_uxn_c_l344_c18_8179_device_ram_value,
vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write,
vector_snoop_uxn_c_l344_c18_8179_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output);



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
 UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output,
 device_ram_address_MUX_uxn_c_l302_c2_455c_return_output,
 is_ram_write_MUX_uxn_c_l302_c2_455c_return_output,
 ram_write_value_MUX_uxn_c_l302_c2_455c_return_output,
 cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output,
 is_booted_MUX_uxn_c_l302_c2_455c_return_output,
 vram_value_MUX_uxn_c_l302_c2_455c_return_output,
 u16_addr_MUX_uxn_c_l302_c2_455c_return_output,
 vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output,
 is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output,
 boot_check_MUX_uxn_c_l302_c2_455c_return_output,
 is_vram_write_MUX_uxn_c_l302_c2_455c_return_output,
 CONST_SR_8_uxn_c_l311_c54_e048_return_output,
 BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output,
 BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output,
 MUX_uxn_c_l311_c44_12d5_return_output,
 MUX_uxn_c_l311_c16_02c7_return_output,
 BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output,
 MUX_uxn_c_l312_c16_732e_return_output,
 MUX_uxn_c_l314_c16_f258_return_output,
 BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output,
 MUX_uxn_c_l315_c21_f24e_return_output,
 UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output,
 device_ram_address_MUX_uxn_c_l317_c9_572c_return_output,
 is_ram_write_MUX_uxn_c_l317_c9_572c_return_output,
 ram_write_value_MUX_uxn_c_l317_c9_572c_return_output,
 cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output,
 vram_value_MUX_uxn_c_l317_c9_572c_return_output,
 u16_addr_MUX_uxn_c_l317_c9_572c_return_output,
 vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output,
 is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output,
 is_vram_write_MUX_uxn_c_l317_c9_572c_return_output,
 step_cpu_uxn_c_l318_c21_f4d5_return_output,
 main_ram_update_uxn_c_l329_c19_e76a_return_output,
 device_ram_update_uxn_c_l335_c26_fc6a_return_output,
 step_gpu_uxn_c_l341_c20_ab83_return_output,
 palette_snoop_uxn_c_l343_c20_f3b1_return_output,
 vector_snoop_uxn_c_l344_c18_8179_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_572c_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_455c_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l314_c3_f2c4 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_572c_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_455c_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_455c_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_02c7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_02c7_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_02c7_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_12d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l311_c54_e048_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l311_c54_e048_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_c_l311_c44_bee1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_12d5_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_12d5_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l311_c44_12d5_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l311_c16_02c7_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_732e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_732e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_732e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l312_c16_732e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_f258_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_f258_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_f258_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_f258_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f24e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f24e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f24e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l315_c21_f24e_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_61c4_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_d3dc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_efdc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_620c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_1944_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_0c33_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_215d_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_e76a_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_e76a_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_e76a_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l329_c19_e76a_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_fc6a_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_fc6a_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_fc6a_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l335_c26_fc6a_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l341_c20_ab83_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_4c52_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_5be2_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l343_c20_f3b1_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l344_c18_8179_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_0161_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l311_c16_02c7_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l315_c21_f24e_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l314_c16_f258_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l314_c16_f258_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l312_c16_732e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l312_c16_732e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l311_c44_12d5_iffalse := resize(to_unsigned(0, 1), 24);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l302_c2_455c_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l302_c2_455c_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l311_c16_02c7_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l315_c21_f24e_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l318_c21_f4d5_vector := screen_vector;
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_left := u16_addr;
     VAR_CONST_SR_8_uxn_c_l311_c54_e048_x := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l302_c2_455c_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l317_c9_572c_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse := vram_write_layer;
     -- CONST_SR_8[uxn_c_l311_c54_e048] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_c_l311_c54_e048_x <= VAR_CONST_SR_8_uxn_c_l311_c54_e048_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_c_l311_c54_e048_return_output := CONST_SR_8_uxn_c_l311_c54_e048_return_output;

     -- UNARY_OP_NOT[uxn_c_l317_c14_b334] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l317_c14_b334_expr <= VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output := UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l318_c69_61c4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_61c4_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l302_c7_3059] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l302_c7_3059_expr <= VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output := UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;

     -- BIN_OP_PLUS[uxn_c_l311_c77_6359] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l311_c77_6359_left <= VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_left;
     BIN_OP_PLUS_uxn_c_l311_c77_6359_right <= VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output := BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l311_c44_12d5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l311_c77_6359_return_output, 24);
     VAR_step_cpu_uxn_c_l318_c21_f4d5_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l318_c69_61c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_boot_check_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_is_booted_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_vram_value_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_cond := VAR_UNARY_OP_NOT_uxn_c_l302_c7_3059_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_u16_addr_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_vram_value_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_cond := VAR_UNARY_OP_NOT_uxn_c_l317_c14_b334_return_output;
     -- CAST_TO_uint8_t[uxn_c_l311_c44_bee1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_c_l311_c44_bee1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_c_l311_c54_e048_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output;

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_left := VAR_CAST_TO_uint8_t_uxn_c_l311_c44_bee1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l317_c9_572c_return_output;
     -- BIN_OP_NEQ[uxn_c_l311_c44_cd60] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l311_c44_cd60_left <= VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_left;
     BIN_OP_NEQ_uxn_c_l311_c44_cd60_right <= VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output := BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l317_c1_3697] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l311_c44_12d5_cond := VAR_BIN_OP_NEQ_uxn_c_l311_c44_cd60_return_output;
     VAR_step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l317_c1_3697_return_output;
     -- MUX[uxn_c_l311_c44_12d5] LATENCY=0
     -- Inputs
     MUX_uxn_c_l311_c44_12d5_cond <= VAR_MUX_uxn_c_l311_c44_12d5_cond;
     MUX_uxn_c_l311_c44_12d5_iftrue <= VAR_MUX_uxn_c_l311_c44_12d5_iftrue;
     MUX_uxn_c_l311_c44_12d5_iffalse <= VAR_MUX_uxn_c_l311_c44_12d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l311_c44_12d5_return_output := MUX_uxn_c_l311_c44_12d5_return_output;

     -- step_cpu[uxn_c_l318_c21_f4d5] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l318_c21_f4d5_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value <= VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_ram_read_value;
     step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read <= VAR_step_cpu_uxn_c_l318_c21_f4d5_previous_device_ram_read;
     step_cpu_uxn_c_l318_c21_f4d5_use_vector <= VAR_step_cpu_uxn_c_l318_c21_f4d5_use_vector;
     step_cpu_uxn_c_l318_c21_f4d5_vector <= VAR_step_cpu_uxn_c_l318_c21_f4d5_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output := step_cpu_uxn_c_l318_c21_f4d5_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l311_c16_02c7_iffalse := VAR_MUX_uxn_c_l311_c44_12d5_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output;
     -- cpu_step_result_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l317_c9_572c_cond <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_cond;
     cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iftrue;
     cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output := cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output;

     -- MUX[uxn_c_l311_c16_02c7] LATENCY=0
     -- Inputs
     MUX_uxn_c_l311_c16_02c7_cond <= VAR_MUX_uxn_c_l311_c16_02c7_cond;
     MUX_uxn_c_l311_c16_02c7_iftrue <= VAR_MUX_uxn_c_l311_c16_02c7_iftrue;
     MUX_uxn_c_l311_c16_02c7_iffalse <= VAR_MUX_uxn_c_l311_c16_02c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l311_c16_02c7_return_output := MUX_uxn_c_l311_c16_02c7_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l319_c18_d3dc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_d3dc_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l324_c19_0c33] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_0c33_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l325_c22_215d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_215d_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l320_c14_efdc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_efdc_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_0161 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_0161_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l322_c25_1944] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_1944_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l321_c24_620c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_620c_return_output := VAR_step_cpu_uxn_c_l318_c21_f4d5_return_output.device_ram_address;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l320_c14_efdc_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l322_c25_1944_return_output;
     VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l319_c18_d3dc_return_output;
     VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l324_c19_0c33_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l325_c22_215d_return_output;
     VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l321_c24_620c_return_output;
     VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_0161_return_output;
     VAR_vram_value_MUX_uxn_c_l317_c9_572c_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l326_l323_DUPLICATE_0161_return_output;
     VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_left := VAR_MUX_uxn_c_l311_c16_02c7_return_output;
     VAR_boot_check_MUX_uxn_c_l302_c2_455c_iftrue := VAR_MUX_uxn_c_l311_c16_02c7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse := VAR_cpu_step_result_MUX_uxn_c_l317_c9_572c_return_output;
     -- is_device_ram_write_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_cond;
     is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iftrue;
     is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output := is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output;

     -- ram_write_value_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l317_c9_572c_cond <= VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_cond;
     ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iftrue;
     ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_return_output := ram_write_value_MUX_uxn_c_l317_c9_572c_return_output;

     -- device_ram_address_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l317_c9_572c_cond <= VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_cond;
     device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iftrue;
     device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_return_output := device_ram_address_MUX_uxn_c_l317_c9_572c_return_output;

     -- vram_value_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l317_c9_572c_cond <= VAR_vram_value_MUX_uxn_c_l317_c9_572c_cond;
     vram_value_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_vram_value_MUX_uxn_c_l317_c9_572c_iftrue;
     vram_value_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_vram_value_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l317_c9_572c_return_output := vram_value_MUX_uxn_c_l317_c9_572c_return_output;

     -- u16_addr_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l317_c9_572c_cond <= VAR_u16_addr_MUX_uxn_c_l317_c9_572c_cond;
     u16_addr_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iftrue;
     u16_addr_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_u16_addr_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l317_c9_572c_return_output := u16_addr_MUX_uxn_c_l317_c9_572c_return_output;

     -- boot_check_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l302_c2_455c_cond <= VAR_boot_check_MUX_uxn_c_l302_c2_455c_cond;
     boot_check_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_boot_check_MUX_uxn_c_l302_c2_455c_iftrue;
     boot_check_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_boot_check_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l302_c2_455c_return_output := boot_check_MUX_uxn_c_l302_c2_455c_return_output;

     -- vram_write_layer_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l317_c9_572c_cond <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_cond;
     vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iftrue;
     vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output := vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output;

     -- is_ram_write_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l317_c9_572c_cond <= VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_cond;
     is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iftrue;
     is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_return_output := is_ram_write_MUX_uxn_c_l317_c9_572c_return_output;

     -- BIN_OP_EQ[uxn_c_l312_c16_f90f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l312_c16_f90f_left <= VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_left;
     BIN_OP_EQ_uxn_c_l312_c16_f90f_right <= VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output := BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output;

     -- is_vram_write_MUX[uxn_c_l317_c9_572c] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l317_c9_572c_cond <= VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_cond;
     is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue <= VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iftrue;
     is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse <= VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_return_output := is_vram_write_MUX_uxn_c_l317_c9_572c_return_output;

     -- cpu_step_result_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l302_c2_455c_cond <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_cond;
     cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iftrue;
     cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output := cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l312_c16_732e_cond := VAR_BIN_OP_EQ_uxn_c_l312_c16_f90f_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse := VAR_device_ram_address_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse := VAR_is_ram_write_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse := VAR_is_vram_write_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse := VAR_ram_write_value_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iffalse := VAR_u16_addr_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_vram_value_MUX_uxn_c_l302_c2_455c_iffalse := VAR_vram_value_MUX_uxn_c_l317_c9_572c_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse := VAR_vram_write_layer_MUX_uxn_c_l317_c9_572c_return_output;
     -- MUX[uxn_c_l312_c16_732e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l312_c16_732e_cond <= VAR_MUX_uxn_c_l312_c16_732e_cond;
     MUX_uxn_c_l312_c16_732e_iftrue <= VAR_MUX_uxn_c_l312_c16_732e_iftrue;
     MUX_uxn_c_l312_c16_732e_iffalse <= VAR_MUX_uxn_c_l312_c16_732e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l312_c16_732e_return_output := MUX_uxn_c_l312_c16_732e_return_output;

     -- vram_write_layer_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l302_c2_455c_cond <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_cond;
     vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iftrue;
     vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output := vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output;

     -- vram_value_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l302_c2_455c_cond <= VAR_vram_value_MUX_uxn_c_l302_c2_455c_cond;
     vram_value_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_vram_value_MUX_uxn_c_l302_c2_455c_iftrue;
     vram_value_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_vram_value_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l302_c2_455c_return_output := vram_value_MUX_uxn_c_l302_c2_455c_return_output;

     -- is_device_ram_write_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_cond;
     is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iftrue;
     is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output := is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output;

     -- device_ram_address_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l302_c2_455c_cond <= VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_cond;
     device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iftrue;
     device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output := device_ram_address_MUX_uxn_c_l302_c2_455c_return_output;

     -- is_vram_write_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l302_c2_455c_cond <= VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_cond;
     is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iftrue;
     is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_return_output := is_vram_write_MUX_uxn_c_l302_c2_455c_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right := VAR_MUX_uxn_c_l312_c16_732e_return_output;
     VAR_MUX_uxn_c_l315_c21_f24e_cond := VAR_MUX_uxn_c_l312_c16_732e_return_output;
     VAR_is_booted_MUX_uxn_c_l302_c2_455c_iftrue := VAR_MUX_uxn_c_l312_c16_732e_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_fc6a_device_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_fc6a_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_step_gpu_uxn_c_l341_c20_ab83_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_step_gpu_uxn_c_l341_c20_ab83_vram_value := VAR_vram_value_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_step_gpu_uxn_c_l341_c20_ab83_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l302_c2_455c_return_output;
     -- is_booted_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l302_c2_455c_cond <= VAR_is_booted_MUX_uxn_c_l302_c2_455c_cond;
     is_booted_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_is_booted_MUX_uxn_c_l302_c2_455c_iftrue;
     is_booted_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_is_booted_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l302_c2_455c_return_output := is_booted_MUX_uxn_c_l302_c2_455c_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output;

     -- MUX[uxn_c_l315_c21_f24e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l315_c21_f24e_cond <= VAR_MUX_uxn_c_l315_c21_f24e_cond;
     MUX_uxn_c_l315_c21_f24e_iftrue <= VAR_MUX_uxn_c_l315_c21_f24e_iftrue;
     MUX_uxn_c_l315_c21_f24e_iffalse <= VAR_MUX_uxn_c_l315_c21_f24e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l315_c21_f24e_return_output := MUX_uxn_c_l315_c21_f24e_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l314_c16_f258_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output;
     VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l314_l313_DUPLICATE_daa6_return_output;
     VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue := VAR_MUX_uxn_c_l315_c21_f24e_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l302_c2_455c_return_output;
     -- is_ram_write_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l302_c2_455c_cond <= VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_cond;
     is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iftrue;
     is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_return_output := is_ram_write_MUX_uxn_c_l302_c2_455c_return_output;

     -- MUX[uxn_c_l314_c16_f258] LATENCY=0
     -- Inputs
     MUX_uxn_c_l314_c16_f258_cond <= VAR_MUX_uxn_c_l314_c16_f258_cond;
     MUX_uxn_c_l314_c16_f258_iftrue <= VAR_MUX_uxn_c_l314_c16_f258_iftrue;
     MUX_uxn_c_l314_c16_f258_iffalse <= VAR_MUX_uxn_c_l314_c16_f258_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l314_c16_f258_return_output := MUX_uxn_c_l314_c16_f258_return_output;

     -- ram_write_value_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l302_c2_455c_cond <= VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_cond;
     ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iftrue;
     ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output := ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;

     -- Submodule level 9
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_right := VAR_MUX_uxn_c_l314_c16_f258_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_main_ram_update_uxn_c_l329_c19_e76a_write_enable := VAR_is_ram_write_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_device_ram_update_uxn_c_l335_c26_fc6a_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_main_ram_update_uxn_c_l329_c19_e76a_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l302_c2_455c_return_output;
     -- device_ram_update[uxn_c_l335_c26_fc6a] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l335_c26_fc6a_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l335_c26_fc6a_device_address <= VAR_device_ram_update_uxn_c_l335_c26_fc6a_device_address;
     device_ram_update_uxn_c_l335_c26_fc6a_value <= VAR_device_ram_update_uxn_c_l335_c26_fc6a_value;
     device_ram_update_uxn_c_l335_c26_fc6a_write_enable <= VAR_device_ram_update_uxn_c_l335_c26_fc6a_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l335_c26_fc6a_return_output := device_ram_update_uxn_c_l335_c26_fc6a_return_output;

     -- vector_snoop[uxn_c_l344_c18_8179] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l344_c18_8179_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l344_c18_8179_device_ram_address <= VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_address;
     vector_snoop_uxn_c_l344_c18_8179_device_ram_value <= VAR_vector_snoop_uxn_c_l344_c18_8179_device_ram_value;
     vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write <= VAR_vector_snoop_uxn_c_l344_c18_8179_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l344_c18_8179_return_output := vector_snoop_uxn_c_l344_c18_8179_return_output;

     -- BIN_OP_PLUS[uxn_c_l314_c3_6eae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l314_c3_6eae_left <= VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_left;
     BIN_OP_PLUS_uxn_c_l314_c3_6eae_right <= VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output := BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output;

     -- Submodule level 10
     VAR_u16_addr_uxn_c_l314_c3_f2c4 := resize(VAR_BIN_OP_PLUS_uxn_c_l314_c3_6eae_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l335_c26_fc6a_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l344_c18_8179_return_output;
     VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iftrue := VAR_u16_addr_uxn_c_l314_c3_f2c4;
     -- u16_addr_MUX[uxn_c_l302_c2_455c] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l302_c2_455c_cond <= VAR_u16_addr_MUX_uxn_c_l302_c2_455c_cond;
     u16_addr_MUX_uxn_c_l302_c2_455c_iftrue <= VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iftrue;
     u16_addr_MUX_uxn_c_l302_c2_455c_iffalse <= VAR_u16_addr_MUX_uxn_c_l302_c2_455c_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l302_c2_455c_return_output := u16_addr_MUX_uxn_c_l302_c2_455c_return_output;

     -- Submodule level 11
     VAR_main_ram_update_uxn_c_l329_c19_e76a_ram_address := VAR_u16_addr_MUX_uxn_c_l302_c2_455c_return_output;
     VAR_step_gpu_uxn_c_l341_c20_ab83_vram_address := VAR_u16_addr_MUX_uxn_c_l302_c2_455c_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l302_c2_455c_return_output;
     -- main_ram_update[uxn_c_l329_c19_e76a] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l329_c19_e76a_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l329_c19_e76a_ram_address <= VAR_main_ram_update_uxn_c_l329_c19_e76a_ram_address;
     main_ram_update_uxn_c_l329_c19_e76a_value <= VAR_main_ram_update_uxn_c_l329_c19_e76a_value;
     main_ram_update_uxn_c_l329_c19_e76a_write_enable <= VAR_main_ram_update_uxn_c_l329_c19_e76a_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l329_c19_e76a_return_output := main_ram_update_uxn_c_l329_c19_e76a_return_output;

     -- step_gpu[uxn_c_l341_c20_ab83] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l341_c20_ab83_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area <= VAR_step_gpu_uxn_c_l341_c20_ab83_is_active_drawing_area;
     step_gpu_uxn_c_l341_c20_ab83_is_vram_write <= VAR_step_gpu_uxn_c_l341_c20_ab83_is_vram_write;
     step_gpu_uxn_c_l341_c20_ab83_vram_write_layer <= VAR_step_gpu_uxn_c_l341_c20_ab83_vram_write_layer;
     step_gpu_uxn_c_l341_c20_ab83_vram_address <= VAR_step_gpu_uxn_c_l341_c20_ab83_vram_address;
     step_gpu_uxn_c_l341_c20_ab83_vram_value <= VAR_step_gpu_uxn_c_l341_c20_ab83_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l341_c20_ab83_return_output := step_gpu_uxn_c_l341_c20_ab83_return_output;

     -- Submodule level 12
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l329_c19_e76a_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l341_c20_ab83_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l343_c92_5be2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_5be2_return_output := VAR_step_gpu_uxn_c_l341_c20_ab83_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l342_c19_4c52] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_4c52_return_output := VAR_step_gpu_uxn_c_l341_c20_ab83_return_output.is_active_fill;

     -- Submodule level 13
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l342_c19_4c52_return_output;
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l343_c92_5be2_return_output;
     -- palette_snoop[uxn_c_l343_c20_f3b1] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l343_c20_f3b1_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address <= VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_address;
     palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value <= VAR_palette_snoop_uxn_c_l343_c20_f3b1_device_ram_value;
     palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write <= VAR_palette_snoop_uxn_c_l343_c20_f3b1_is_device_ram_write;
     palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color <= VAR_palette_snoop_uxn_c_l343_c20_f3b1_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l343_c20_f3b1_return_output := palette_snoop_uxn_c_l343_c20_f3b1_return_output;

     -- Submodule level 14
     VAR_return_output := VAR_palette_snoop_uxn_c_l343_c20_f3b1_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l343_c20_f3b1_return_output;
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
