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
-- Submodules: 54
entity uxn_top_0CLK_3f5efacb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_3f5efacb;
architecture arch of uxn_top_0CLK_3f5efacb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal boot_check : unsigned(23 downto 0) := to_unsigned(0, 24);
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_device_ram_16bit : unsigned(0 downto 0) := to_unsigned(0, 1);
signal gpu_step_result : gpu_step_result_t := gpu_step_result_t_NULL;
signal cpu_step_result : cpu_step_result_t := cpu_step_result_t_NULL;
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal u16_value : unsigned(15 downto 0) := to_unsigned(255, 16);
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_address : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_device_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_vram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_write_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_address : unsigned(23 downto 0) := to_unsigned(0, 24);
signal vram_value : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_boot_check : unsigned(23 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_is_device_ram_16bit : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_u16_value : unsigned(15 downto 0);
signal REG_COMB_screen_vector : unsigned(15 downto 0);
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_address : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(15 downto 0);
signal REG_COMB_is_device_ram_write : unsigned(0 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_address : unsigned(23 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l324_c7_b386]
signal UNARY_OP_NOT_uxn_c_l324_c7_b386_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l339_c9_7d2d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l324_c2_3463]
signal device_ram_address_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l324_c2_3463_return_output : unsigned(7 downto 0);

-- ram_write_value_MUX[uxn_c_l324_c2_3463]
signal ram_write_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(7 downto 0);

-- is_device_ram_16bit_MUX[uxn_c_l324_c2_3463]
signal is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- u16_value_MUX[uxn_c_l324_c2_3463]
signal u16_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal u16_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(15 downto 0);
signal u16_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(15 downto 0);
signal u16_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l324_c2_3463]
signal vram_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(1 downto 0);

-- boot_check_MUX[uxn_c_l324_c2_3463]
signal boot_check_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l324_c2_3463_return_output : unsigned(23 downto 0);

-- vram_write_layer_MUX[uxn_c_l324_c2_3463]
signal vram_write_layer_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l324_c2_3463]
signal is_booted_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l324_c2_3463]
signal is_ram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l324_c2_3463]
signal vram_address_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l324_c2_3463_return_output : unsigned(23 downto 0);

-- is_device_ram_write_MUX[uxn_c_l324_c2_3463]
signal is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l324_c2_3463]
signal cpu_step_result_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output : cpu_step_result_t;

-- is_vram_write_MUX[uxn_c_l324_c2_3463]
signal is_vram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l333_c44_b556]
signal BIN_OP_GT_uxn_c_l333_c44_b556_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l333_c44_b556_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l333_c44_b556_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l333_c66_df21]
signal BIN_OP_PLUS_uxn_c_l333_c66_df21_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l333_c66_df21_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l333_c44_5e50]
signal MUX_uxn_c_l333_c44_5e50_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l333_c44_5e50_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l333_c44_5e50_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l333_c44_5e50_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l333_c16_66c1]
signal MUX_uxn_c_l333_c16_66c1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l333_c16_66c1_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l333_c16_66c1_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l333_c16_66c1_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l334_c16_600d]
signal BIN_OP_EQ_uxn_c_l334_c16_600d_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l334_c16_600d_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l334_c16_600d_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l334_c16_69dc]
signal MUX_uxn_c_l334_c16_69dc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l334_c16_69dc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l334_c16_69dc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l334_c16_69dc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l336_c17_a670]
signal MUX_uxn_c_l336_c17_a670_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l336_c17_a670_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l336_c17_a670_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l336_c17_a670_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l336_c3_85b1]
signal BIN_OP_PLUS_uxn_c_l336_c3_85b1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l336_c3_85b1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l337_c21_b2d1]
signal MUX_uxn_c_l337_c21_b2d1_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l337_c21_b2d1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l337_c21_b2d1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l337_c21_b2d1_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l339_c14_0490]
signal UNARY_OP_NOT_uxn_c_l339_c14_0490_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l339_c1_5662]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l339_c9_7d2d]
signal device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(7 downto 0);

-- ram_write_value_MUX[uxn_c_l339_c9_7d2d]
signal ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(7 downto 0);

-- is_device_ram_16bit_MUX[uxn_c_l339_c9_7d2d]
signal is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- u16_value_MUX[uxn_c_l339_c9_7d2d]
signal u16_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(15 downto 0);
signal u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(15 downto 0);
signal u16_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l339_c9_7d2d]
signal vram_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(1 downto 0);

-- vram_write_layer_MUX[uxn_c_l339_c9_7d2d]
signal vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l339_c9_7d2d]
signal is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l339_c9_7d2d]
signal vram_address_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(23 downto 0);

-- is_device_ram_write_MUX[uxn_c_l339_c9_7d2d]
signal is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l339_c9_7d2d]
signal cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output : cpu_step_result_t;

-- is_vram_write_MUX[uxn_c_l339_c9_7d2d]
signal is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l340_c21_bb2c]
signal step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read : unsigned(15 downto 0);
signal step_cpu_uxn_c_l340_c21_bb2c_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l340_c21_bb2c_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l340_c21_bb2c_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l353_c19_dfb4]
signal main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l353_c19_dfb4_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l353_c19_dfb4_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l353_c19_dfb4_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l353_c19_dfb4_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l360_c3_e474]
signal MUX_uxn_c_l360_c3_e474_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l360_c3_e474_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l360_c3_e474_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l360_c3_e474_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_c_l361_c36_f1a0]
signal CONST_SR_8_uxn_c_l361_c36_f1a0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_c_l361_c36_f1a0_return_output : unsigned(15 downto 0);

-- MUX[uxn_c_l361_c3_5886]
signal MUX_uxn_c_l361_c3_5886_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l361_c3_5886_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l361_c3_5886_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l361_c3_5886_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_c_l362_c3_ad8d]
signal BIN_OP_AND_uxn_c_l362_c3_ad8d_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l362_c3_ad8d_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l363_c26_edb3]
signal BIN_OP_PLUS_uxn_c_l363_c26_edb3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l363_c26_edb3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output : unsigned(8 downto 0);

-- MUX[uxn_c_l363_c3_c70d]
signal MUX_uxn_c_l363_c3_c70d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l363_c3_c70d_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l363_c3_c70d_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l363_c3_c70d_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l364_c3_9432]
signal MUX_uxn_c_l364_c3_9432_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l364_c3_9432_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l364_c3_9432_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l364_c3_9432_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l359_c26_9f99]
signal device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_write1_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_write1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l359_c26_9f99_return_output : unsigned(15 downto 0);

-- step_gpu[uxn_c_l368_c20_1492]
signal step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_vram_address : unsigned(23 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l368_c20_1492_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l370_c20_0493]
signal palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l370_c20_0493_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l370_c20_0493_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l370_c20_0493_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l370_c20_0493_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l371_c18_4765]
signal vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l371_c18_4765_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l371_c18_4765_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l371_c18_4765_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output : unsigned(0 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l324_c7_b386
UNARY_OP_NOT_uxn_c_l324_c7_b386 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l324_c7_b386_expr,
UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output);

-- device_ram_address_MUX_uxn_c_l324_c2_3463
device_ram_address_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l324_c2_3463_cond,
device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue,
device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse,
device_ram_address_MUX_uxn_c_l324_c2_3463_return_output);

-- ram_write_value_MUX_uxn_c_l324_c2_3463
ram_write_value_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l324_c2_3463_cond,
ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue,
ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse,
ram_write_value_MUX_uxn_c_l324_c2_3463_return_output);

-- is_device_ram_16bit_MUX_uxn_c_l324_c2_3463
is_device_ram_16bit_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond,
is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue,
is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse,
is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output);

-- u16_value_MUX_uxn_c_l324_c2_3463
u16_value_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_value_MUX_uxn_c_l324_c2_3463_cond,
u16_value_MUX_uxn_c_l324_c2_3463_iftrue,
u16_value_MUX_uxn_c_l324_c2_3463_iffalse,
u16_value_MUX_uxn_c_l324_c2_3463_return_output);

-- vram_value_MUX_uxn_c_l324_c2_3463
vram_value_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l324_c2_3463_cond,
vram_value_MUX_uxn_c_l324_c2_3463_iftrue,
vram_value_MUX_uxn_c_l324_c2_3463_iffalse,
vram_value_MUX_uxn_c_l324_c2_3463_return_output);

-- boot_check_MUX_uxn_c_l324_c2_3463
boot_check_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l324_c2_3463_cond,
boot_check_MUX_uxn_c_l324_c2_3463_iftrue,
boot_check_MUX_uxn_c_l324_c2_3463_iffalse,
boot_check_MUX_uxn_c_l324_c2_3463_return_output);

-- vram_write_layer_MUX_uxn_c_l324_c2_3463
vram_write_layer_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l324_c2_3463_cond,
vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue,
vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse,
vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output);

-- is_booted_MUX_uxn_c_l324_c2_3463
is_booted_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l324_c2_3463_cond,
is_booted_MUX_uxn_c_l324_c2_3463_iftrue,
is_booted_MUX_uxn_c_l324_c2_3463_iffalse,
is_booted_MUX_uxn_c_l324_c2_3463_return_output);

-- is_ram_write_MUX_uxn_c_l324_c2_3463
is_ram_write_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l324_c2_3463_cond,
is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue,
is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse,
is_ram_write_MUX_uxn_c_l324_c2_3463_return_output);

-- vram_address_MUX_uxn_c_l324_c2_3463
vram_address_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l324_c2_3463_cond,
vram_address_MUX_uxn_c_l324_c2_3463_iftrue,
vram_address_MUX_uxn_c_l324_c2_3463_iffalse,
vram_address_MUX_uxn_c_l324_c2_3463_return_output);

-- is_device_ram_write_MUX_uxn_c_l324_c2_3463
is_device_ram_write_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond,
is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue,
is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse,
is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output);

-- cpu_step_result_MUX_uxn_c_l324_c2_3463
cpu_step_result_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l324_c2_3463_cond,
cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue,
cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse,
cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output);

-- is_vram_write_MUX_uxn_c_l324_c2_3463
is_vram_write_MUX_uxn_c_l324_c2_3463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l324_c2_3463_cond,
is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue,
is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse,
is_vram_write_MUX_uxn_c_l324_c2_3463_return_output);

-- BIN_OP_GT_uxn_c_l333_c44_b556
BIN_OP_GT_uxn_c_l333_c44_b556 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l333_c44_b556_left,
BIN_OP_GT_uxn_c_l333_c44_b556_right,
BIN_OP_GT_uxn_c_l333_c44_b556_return_output);

-- BIN_OP_PLUS_uxn_c_l333_c66_df21
BIN_OP_PLUS_uxn_c_l333_c66_df21 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l333_c66_df21_left,
BIN_OP_PLUS_uxn_c_l333_c66_df21_right,
BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output);

-- MUX_uxn_c_l333_c44_5e50
MUX_uxn_c_l333_c44_5e50 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l333_c44_5e50_cond,
MUX_uxn_c_l333_c44_5e50_iftrue,
MUX_uxn_c_l333_c44_5e50_iffalse,
MUX_uxn_c_l333_c44_5e50_return_output);

-- MUX_uxn_c_l333_c16_66c1
MUX_uxn_c_l333_c16_66c1 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l333_c16_66c1_cond,
MUX_uxn_c_l333_c16_66c1_iftrue,
MUX_uxn_c_l333_c16_66c1_iffalse,
MUX_uxn_c_l333_c16_66c1_return_output);

-- BIN_OP_EQ_uxn_c_l334_c16_600d
BIN_OP_EQ_uxn_c_l334_c16_600d : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l334_c16_600d_left,
BIN_OP_EQ_uxn_c_l334_c16_600d_right,
BIN_OP_EQ_uxn_c_l334_c16_600d_return_output);

-- MUX_uxn_c_l334_c16_69dc
MUX_uxn_c_l334_c16_69dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l334_c16_69dc_cond,
MUX_uxn_c_l334_c16_69dc_iftrue,
MUX_uxn_c_l334_c16_69dc_iffalse,
MUX_uxn_c_l334_c16_69dc_return_output);

-- MUX_uxn_c_l336_c17_a670
MUX_uxn_c_l336_c17_a670 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l336_c17_a670_cond,
MUX_uxn_c_l336_c17_a670_iftrue,
MUX_uxn_c_l336_c17_a670_iffalse,
MUX_uxn_c_l336_c17_a670_return_output);

-- BIN_OP_PLUS_uxn_c_l336_c3_85b1
BIN_OP_PLUS_uxn_c_l336_c3_85b1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l336_c3_85b1_left,
BIN_OP_PLUS_uxn_c_l336_c3_85b1_right,
BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output);

-- MUX_uxn_c_l337_c21_b2d1
MUX_uxn_c_l337_c21_b2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l337_c21_b2d1_cond,
MUX_uxn_c_l337_c21_b2d1_iftrue,
MUX_uxn_c_l337_c21_b2d1_iffalse,
MUX_uxn_c_l337_c21_b2d1_return_output);

-- UNARY_OP_NOT_uxn_c_l339_c14_0490
UNARY_OP_NOT_uxn_c_l339_c14_0490 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l339_c14_0490_expr,
UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662
TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output);

-- device_ram_address_MUX_uxn_c_l339_c9_7d2d
device_ram_address_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond,
device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue,
device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse,
device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output);

-- ram_write_value_MUX_uxn_c_l339_c9_7d2d
ram_write_value_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond,
ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue,
ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse,
ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output);

-- is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d
is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond,
is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue,
is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse,
is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output);

-- u16_value_MUX_uxn_c_l339_c9_7d2d
u16_value_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_value_MUX_uxn_c_l339_c9_7d2d_cond,
u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue,
u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse,
u16_value_MUX_uxn_c_l339_c9_7d2d_return_output);

-- vram_value_MUX_uxn_c_l339_c9_7d2d
vram_value_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l339_c9_7d2d_cond,
vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue,
vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse,
vram_value_MUX_uxn_c_l339_c9_7d2d_return_output);

-- vram_write_layer_MUX_uxn_c_l339_c9_7d2d
vram_write_layer_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond,
vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue,
vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse,
vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output);

-- is_ram_write_MUX_uxn_c_l339_c9_7d2d
is_ram_write_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond,
is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue,
is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse,
is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output);

-- vram_address_MUX_uxn_c_l339_c9_7d2d
vram_address_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l339_c9_7d2d_cond,
vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue,
vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse,
vram_address_MUX_uxn_c_l339_c9_7d2d_return_output);

-- is_device_ram_write_MUX_uxn_c_l339_c9_7d2d
is_device_ram_write_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond,
is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue,
is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse,
is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output);

-- cpu_step_result_MUX_uxn_c_l339_c9_7d2d
cpu_step_result_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond,
cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue,
cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse,
cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output);

-- is_vram_write_MUX_uxn_c_l339_c9_7d2d
is_vram_write_MUX_uxn_c_l339_c9_7d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond,
is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue,
is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse,
is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output);

-- step_cpu_uxn_c_l340_c21_bb2c
step_cpu_uxn_c_l340_c21_bb2c : entity work.step_cpu_0CLK_da5203c6 port map (
clk,
step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE,
step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value,
step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read,
step_cpu_uxn_c_l340_c21_bb2c_use_vector,
step_cpu_uxn_c_l340_c21_bb2c_vector,
step_cpu_uxn_c_l340_c21_bb2c_return_output);

-- main_ram_update_uxn_c_l353_c19_dfb4
main_ram_update_uxn_c_l353_c19_dfb4 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE,
main_ram_update_uxn_c_l353_c19_dfb4_ram_address,
main_ram_update_uxn_c_l353_c19_dfb4_value,
main_ram_update_uxn_c_l353_c19_dfb4_write_enable,
main_ram_update_uxn_c_l353_c19_dfb4_return_output);

-- MUX_uxn_c_l360_c3_e474
MUX_uxn_c_l360_c3_e474 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l360_c3_e474_cond,
MUX_uxn_c_l360_c3_e474_iftrue,
MUX_uxn_c_l360_c3_e474_iffalse,
MUX_uxn_c_l360_c3_e474_return_output);

-- CONST_SR_8_uxn_c_l361_c36_f1a0
CONST_SR_8_uxn_c_l361_c36_f1a0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_c_l361_c36_f1a0_x,
CONST_SR_8_uxn_c_l361_c36_f1a0_return_output);

-- MUX_uxn_c_l361_c3_5886
MUX_uxn_c_l361_c3_5886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l361_c3_5886_cond,
MUX_uxn_c_l361_c3_5886_iftrue,
MUX_uxn_c_l361_c3_5886_iffalse,
MUX_uxn_c_l361_c3_5886_return_output);

-- BIN_OP_AND_uxn_c_l362_c3_ad8d
BIN_OP_AND_uxn_c_l362_c3_ad8d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l362_c3_ad8d_left,
BIN_OP_AND_uxn_c_l362_c3_ad8d_right,
BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output);

-- BIN_OP_PLUS_uxn_c_l363_c26_edb3
BIN_OP_PLUS_uxn_c_l363_c26_edb3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l363_c26_edb3_left,
BIN_OP_PLUS_uxn_c_l363_c26_edb3_right,
BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output);

-- MUX_uxn_c_l363_c3_c70d
MUX_uxn_c_l363_c3_c70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l363_c3_c70d_cond,
MUX_uxn_c_l363_c3_c70d_iftrue,
MUX_uxn_c_l363_c3_c70d_iffalse,
MUX_uxn_c_l363_c3_c70d_return_output);

-- MUX_uxn_c_l364_c3_9432
MUX_uxn_c_l364_c3_9432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l364_c3_9432_cond,
MUX_uxn_c_l364_c3_9432_iftrue,
MUX_uxn_c_l364_c3_9432_iffalse,
MUX_uxn_c_l364_c3_9432_return_output);

-- device_ram_update_uxn_c_l359_c26_9f99
device_ram_update_uxn_c_l359_c26_9f99 : entity work.device_ram_update_0CLK_e1b2c3f8 port map (
clk,
device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE,
device_ram_update_uxn_c_l359_c26_9f99_address0,
device_ram_update_uxn_c_l359_c26_9f99_write0_value,
device_ram_update_uxn_c_l359_c26_9f99_write0_enable,
device_ram_update_uxn_c_l359_c26_9f99_address1,
device_ram_update_uxn_c_l359_c26_9f99_write1_value,
device_ram_update_uxn_c_l359_c26_9f99_write1_enable,
device_ram_update_uxn_c_l359_c26_9f99_return_output);

-- step_gpu_uxn_c_l368_c20_1492
step_gpu_uxn_c_l368_c20_1492 : entity work.step_gpu_0CLK_f8366d56 port map (
clk,
step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE,
step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area,
step_gpu_uxn_c_l368_c20_1492_is_vram_write,
step_gpu_uxn_c_l368_c20_1492_vram_write_layer,
step_gpu_uxn_c_l368_c20_1492_vram_address,
step_gpu_uxn_c_l368_c20_1492_vram_value,
step_gpu_uxn_c_l368_c20_1492_return_output);

-- palette_snoop_uxn_c_l370_c20_0493
palette_snoop_uxn_c_l370_c20_0493 : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE,
palette_snoop_uxn_c_l370_c20_0493_device_ram_address,
palette_snoop_uxn_c_l370_c20_0493_device_ram_value,
palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write,
palette_snoop_uxn_c_l370_c20_0493_gpu_step_color,
palette_snoop_uxn_c_l370_c20_0493_return_output);

-- vector_snoop_uxn_c_l371_c18_4765
vector_snoop_uxn_c_l371_c18_4765 : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE,
vector_snoop_uxn_c_l371_c18_4765_device_ram_address,
vector_snoop_uxn_c_l371_c18_4765_device_ram_value,
vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write,
vector_snoop_uxn_c_l371_c18_4765_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output);



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
 is_device_ram_16bit,
 gpu_step_result,
 cpu_step_result,
 is_active_fill,
 is_ram_write,
 u16_value,
 screen_vector,
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
 UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output,
 device_ram_address_MUX_uxn_c_l324_c2_3463_return_output,
 ram_write_value_MUX_uxn_c_l324_c2_3463_return_output,
 is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output,
 u16_value_MUX_uxn_c_l324_c2_3463_return_output,
 vram_value_MUX_uxn_c_l324_c2_3463_return_output,
 boot_check_MUX_uxn_c_l324_c2_3463_return_output,
 vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output,
 is_booted_MUX_uxn_c_l324_c2_3463_return_output,
 is_ram_write_MUX_uxn_c_l324_c2_3463_return_output,
 vram_address_MUX_uxn_c_l324_c2_3463_return_output,
 is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output,
 cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output,
 is_vram_write_MUX_uxn_c_l324_c2_3463_return_output,
 BIN_OP_GT_uxn_c_l333_c44_b556_return_output,
 BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output,
 MUX_uxn_c_l333_c44_5e50_return_output,
 MUX_uxn_c_l333_c16_66c1_return_output,
 BIN_OP_EQ_uxn_c_l334_c16_600d_return_output,
 MUX_uxn_c_l334_c16_69dc_return_output,
 MUX_uxn_c_l336_c17_a670_return_output,
 BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output,
 MUX_uxn_c_l337_c21_b2d1_return_output,
 UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output,
 device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output,
 ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output,
 is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output,
 u16_value_MUX_uxn_c_l339_c9_7d2d_return_output,
 vram_value_MUX_uxn_c_l339_c9_7d2d_return_output,
 vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output,
 is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output,
 vram_address_MUX_uxn_c_l339_c9_7d2d_return_output,
 is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output,
 cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output,
 is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output,
 step_cpu_uxn_c_l340_c21_bb2c_return_output,
 main_ram_update_uxn_c_l353_c19_dfb4_return_output,
 MUX_uxn_c_l360_c3_e474_return_output,
 CONST_SR_8_uxn_c_l361_c36_f1a0_return_output,
 MUX_uxn_c_l361_c3_5886_return_output,
 BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output,
 BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output,
 MUX_uxn_c_l363_c3_c70d_return_output,
 MUX_uxn_c_l364_c3_9432_return_output,
 device_ram_update_uxn_c_l359_c26_9f99_return_output,
 step_gpu_uxn_c_l368_c20_1492_return_output,
 palette_snoop_uxn_c_l370_c20_0493_return_output,
 vector_snoop_uxn_c_l371_c18_4765_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(15 downto 0);
 variable VAR_u16_value_uxn_c_l336_c3_aa2f : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l324_c2_3463_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l324_c2_3463_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l324_c2_3463_return_output : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l333_c16_66c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l333_c16_66c1_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l333_c16_66c1_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l333_c44_5e50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l333_c44_b556_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l333_c44_b556_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l333_c44_b556_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l333_c44_5e50_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l333_c44_5e50_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l333_c44_5e50_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l333_c16_66c1_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l334_c16_69dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l334_c16_69dc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l334_c16_69dc_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l334_c16_69dc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l336_c17_a670_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l336_c17_a670_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l336_c17_a670_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l336_c17_a670_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l337_c21_b2d1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l337_c21_b2d1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l337_c21_b2d1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l337_c21_b2d1_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(15 downto 0);
 variable VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l340_c69_c2a4_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l341_c18_2f9c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_value_d41d_uxn_c_l342_c15_d2c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l343_c24_9325_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l344_c25_4a68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_16bit_d41d_uxn_c_l345_c25_61f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l347_c19_583d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l348_c22_5298_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l349_c18_78be_return_output : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l350_c16_a5e5_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l353_c19_dfb4_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l353_c19_dfb4_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l353_c19_dfb4_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l353_c19_dfb4_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_enable : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l360_c3_e474_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l360_c3_e474_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l360_c3_e474_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l360_c3_e474_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l361_c3_5886_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c3_5886_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l361_c3_5886_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_c_l361_c26_f4cc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l361_c3_5886_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l363_c3_c70d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l363_c3_c70d_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l363_c3_c70d_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_c_l363_c3_c70d_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l364_c3_9432_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l364_c3_9432_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l364_c3_9432_iffalse : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_c_l364_c26_0fee_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l364_c3_9432_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l359_c26_9f99_return_output : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_vram_address : unsigned(23 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l368_c20_1492_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l369_c19_8a6c_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l370_c92_b54f_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l370_c20_0493_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l371_c18_4765_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l350_l346_DUPLICATE_c980_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_is_device_ram_16bit : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_u16_value : unsigned(15 downto 0);
variable REG_VAR_screen_vector : unsigned(15 downto 0);
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_device_ram_address : unsigned(7 downto 0);
variable REG_VAR_device_ram_read_value : unsigned(15 downto 0);
variable REG_VAR_is_device_ram_write : unsigned(0 downto 0);
variable REG_VAR_is_vram_write : unsigned(0 downto 0);
variable REG_VAR_vram_write_layer : unsigned(0 downto 0);
variable REG_VAR_vram_address : unsigned(23 downto 0);
variable REG_VAR_vram_value : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_boot_check := boot_check;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_booted := is_booted;
  REG_VAR_is_device_ram_16bit := is_device_ram_16bit;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_cpu_step_result := cpu_step_result;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_u16_value := u16_value;
  REG_VAR_screen_vector := screen_vector;
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
     VAR_MUX_uxn_c_l333_c16_66c1_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l337_c21_b2d1_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l333_c44_5e50_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l336_c17_a670_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l333_c44_b556_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l361_c3_5886_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l360_c3_e474_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l336_c17_a670_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l334_c16_69dc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l334_c16_69dc_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l324_c2_3463_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l324_c2_3463_iffalse := is_booted;
     VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue := is_device_ram_16bit;
     VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse := is_device_ram_16bit;
     VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l333_c16_66c1_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l337_c21_b2d1_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l340_c21_bb2c_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l333_c44_b556_left := u16_value;
     VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_left := u16_value;
     VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse := u16_value;
     VAR_vram_address_MUX_uxn_c_l324_c2_3463_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l324_c2_3463_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l339_c14_0490] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l339_c14_0490_expr <= VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output := UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;

     -- BIN_OP_PLUS[uxn_c_l333_c66_df21] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l333_c66_df21_left <= VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_left;
     BIN_OP_PLUS_uxn_c_l333_c66_df21_right <= VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output := BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output;

     -- BIN_OP_GT[uxn_c_l333_c44_b556] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l333_c44_b556_left <= VAR_BIN_OP_GT_uxn_c_l333_c44_b556_left;
     BIN_OP_GT_uxn_c_l333_c44_b556_right <= VAR_BIN_OP_GT_uxn_c_l333_c44_b556_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l333_c44_b556_return_output := BIN_OP_GT_uxn_c_l333_c44_b556_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l340_c69_c2a4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l340_c69_c2a4_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l324_c7_b386] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l324_c7_b386_expr <= VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output := UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l333_c44_5e50_cond := VAR_BIN_OP_GT_uxn_c_l333_c44_b556_return_output;
     VAR_MUX_uxn_c_l333_c44_5e50_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l333_c66_df21_return_output, 24);
     VAR_step_cpu_uxn_c_l340_c21_bb2c_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l340_c69_c2a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_boot_check_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_is_booted_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_u16_value_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_vram_address_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_vram_value_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_cond := VAR_UNARY_OP_NOT_uxn_c_l324_c7_b386_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond := VAR_UNARY_OP_NOT_uxn_c_l339_c14_0490_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- MUX[uxn_c_l333_c44_5e50] LATENCY=0
     -- Inputs
     MUX_uxn_c_l333_c44_5e50_cond <= VAR_MUX_uxn_c_l333_c44_5e50_cond;
     MUX_uxn_c_l333_c44_5e50_iftrue <= VAR_MUX_uxn_c_l333_c44_5e50_iftrue;
     MUX_uxn_c_l333_c44_5e50_iffalse <= VAR_MUX_uxn_c_l333_c44_5e50_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l333_c44_5e50_return_output := MUX_uxn_c_l333_c44_5e50_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_MUX_uxn_c_l333_c16_66c1_iffalse := VAR_MUX_uxn_c_l333_c44_5e50_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l339_c1_5662] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output;

     -- MUX[uxn_c_l333_c16_66c1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l333_c16_66c1_cond <= VAR_MUX_uxn_c_l333_c16_66c1_cond;
     MUX_uxn_c_l333_c16_66c1_iftrue <= VAR_MUX_uxn_c_l333_c16_66c1_iftrue;
     MUX_uxn_c_l333_c16_66c1_iffalse <= VAR_MUX_uxn_c_l333_c16_66c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l333_c16_66c1_return_output := MUX_uxn_c_l333_c16_66c1_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_left := VAR_MUX_uxn_c_l333_c16_66c1_return_output;
     VAR_boot_check_MUX_uxn_c_l324_c2_3463_iftrue := VAR_MUX_uxn_c_l333_c16_66c1_return_output;
     VAR_step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l339_c1_5662_return_output;
     -- boot_check_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l324_c2_3463_cond <= VAR_boot_check_MUX_uxn_c_l324_c2_3463_cond;
     boot_check_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_boot_check_MUX_uxn_c_l324_c2_3463_iftrue;
     boot_check_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_boot_check_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l324_c2_3463_return_output := boot_check_MUX_uxn_c_l324_c2_3463_return_output;

     -- step_cpu[uxn_c_l340_c21_bb2c] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l340_c21_bb2c_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value <= VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_ram_read_value;
     step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read <= VAR_step_cpu_uxn_c_l340_c21_bb2c_previous_device_ram_read;
     step_cpu_uxn_c_l340_c21_bb2c_use_vector <= VAR_step_cpu_uxn_c_l340_c21_bb2c_use_vector;
     step_cpu_uxn_c_l340_c21_bb2c_vector <= VAR_step_cpu_uxn_c_l340_c21_bb2c_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output := step_cpu_uxn_c_l340_c21_bb2c_return_output;

     -- BIN_OP_EQ[uxn_c_l334_c16_600d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l334_c16_600d_left <= VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_left;
     BIN_OP_EQ_uxn_c_l334_c16_600d_right <= VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_return_output := BIN_OP_EQ_uxn_c_l334_c16_600d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l334_c16_69dc_cond := VAR_BIN_OP_EQ_uxn_c_l334_c16_600d_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l348_c22_5298] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l348_c22_5298_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l343_c24_9325] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l343_c24_9325_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_16bit_d41d[uxn_c_l345_c25_61f9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_16bit_d41d_uxn_c_l345_c25_61f9_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.is_device_ram_16bit;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l341_c18_2f9c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l341_c18_2f9c_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l347_c19_583d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l347_c19_583d_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_value_d41d[uxn_c_l342_c15_d2c1] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_value_d41d_uxn_c_l342_c15_d2c1_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l344_c25_4a68] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l344_c25_4a68_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.is_device_ram_write;

     -- cpu_step_result_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_cond;
     cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iftrue;
     cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output := cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- MUX[uxn_c_l334_c16_69dc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l334_c16_69dc_cond <= VAR_MUX_uxn_c_l334_c16_69dc_cond;
     MUX_uxn_c_l334_c16_69dc_iftrue <= VAR_MUX_uxn_c_l334_c16_69dc_iftrue;
     MUX_uxn_c_l334_c16_69dc_iffalse <= VAR_MUX_uxn_c_l334_c16_69dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l334_c16_69dc_return_output := MUX_uxn_c_l334_c16_69dc_return_output;

     -- CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d[uxn_c_l349_c18_78be] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l349_c18_78be_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l350_l346_DUPLICATE_c980 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l350_l346_DUPLICATE_c980_return_output := VAR_step_cpu_uxn_c_l340_c21_bb2c_return_output.u8_value;

     -- Submodule level 5
     VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_value_d41d_uxn_c_l342_c15_d2c1_return_output;
     VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_16bit_d41d_uxn_c_l345_c25_61f9_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l344_c25_4a68_return_output;
     VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l341_c18_2f9c_return_output;
     VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l347_c19_583d_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l348_c22_5298_return_output;
     VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l349_c18_78be_return_output;
     VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l343_c24_9325_return_output;
     VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l350_l346_DUPLICATE_c980_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right := VAR_MUX_uxn_c_l334_c16_69dc_return_output;
     VAR_MUX_uxn_c_l337_c21_b2d1_cond := VAR_MUX_uxn_c_l334_c16_69dc_return_output;
     VAR_is_booted_MUX_uxn_c_l324_c2_3463_iftrue := VAR_MUX_uxn_c_l334_c16_69dc_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse := VAR_cpu_step_result_MUX_uxn_c_l339_c9_7d2d_return_output;
     -- cpu_step_result_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l324_c2_3463_cond <= VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_cond;
     cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iftrue;
     cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output := cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output;

     -- u16_value_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     u16_value_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_cond;
     u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iftrue;
     u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_return_output := u16_value_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- CAST_TO_uint2_t[uxn_c_l350_c16_a5e5] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l350_c16_a5e5_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l350_l346_DUPLICATE_c980_return_output);

     -- is_device_ram_16bit_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_cond;
     is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iftrue;
     is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output := is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- is_booted_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l324_c2_3463_cond <= VAR_is_booted_MUX_uxn_c_l324_c2_3463_cond;
     is_booted_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_is_booted_MUX_uxn_c_l324_c2_3463_iftrue;
     is_booted_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_is_booted_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l324_c2_3463_return_output := is_booted_MUX_uxn_c_l324_c2_3463_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output;

     -- vram_address_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_cond;
     vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iftrue;
     vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_return_output := vram_address_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- is_ram_write_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_cond;
     is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue;
     is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output := is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- is_vram_write_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_cond;
     is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iftrue;
     is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output := is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- vram_write_layer_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_cond;
     vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iftrue;
     vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output := vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- is_device_ram_write_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_cond;
     is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iftrue;
     is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output := is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- device_ram_address_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_cond;
     device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iftrue;
     device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output := device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- MUX[uxn_c_l337_c21_b2d1] LATENCY=0
     -- Inputs
     MUX_uxn_c_l337_c21_b2d1_cond <= VAR_MUX_uxn_c_l337_c21_b2d1_cond;
     MUX_uxn_c_l337_c21_b2d1_iftrue <= VAR_MUX_uxn_c_l337_c21_b2d1_iftrue;
     MUX_uxn_c_l337_c21_b2d1_iffalse <= VAR_MUX_uxn_c_l337_c21_b2d1_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l337_c21_b2d1_return_output := MUX_uxn_c_l337_c21_b2d1_return_output;

     -- ram_write_value_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_cond;
     ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iftrue;
     ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output := ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l336_c17_a670_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output;
     VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l336_l335_DUPLICATE_e0a5_return_output;
     VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l350_c16_a5e5_return_output;
     VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue := VAR_MUX_uxn_c_l337_c21_b2d1_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse := VAR_device_ram_address_MUX_uxn_c_l339_c9_7d2d_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse := VAR_is_device_ram_16bit_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse := VAR_is_ram_write_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse := VAR_is_vram_write_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse := VAR_ram_write_value_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_u16_value_MUX_uxn_c_l324_c2_3463_iffalse := VAR_u16_value_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_vram_address_MUX_uxn_c_l324_c2_3463_iffalse := VAR_vram_address_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse := VAR_vram_write_layer_MUX_uxn_c_l339_c9_7d2d_return_output;
     -- is_device_ram_write_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond <= VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_cond;
     is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iftrue;
     is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output := is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;

     -- is_vram_write_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l324_c2_3463_cond <= VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_cond;
     is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iftrue;
     is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_return_output := is_vram_write_MUX_uxn_c_l324_c2_3463_return_output;

     -- MUX[uxn_c_l336_c17_a670] LATENCY=0
     -- Inputs
     MUX_uxn_c_l336_c17_a670_cond <= VAR_MUX_uxn_c_l336_c17_a670_cond;
     MUX_uxn_c_l336_c17_a670_iftrue <= VAR_MUX_uxn_c_l336_c17_a670_iftrue;
     MUX_uxn_c_l336_c17_a670_iffalse <= VAR_MUX_uxn_c_l336_c17_a670_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l336_c17_a670_return_output := MUX_uxn_c_l336_c17_a670_return_output;

     -- vram_value_MUX[uxn_c_l339_c9_7d2d] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l339_c9_7d2d_cond <= VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_cond;
     vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue <= VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iftrue;
     vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse <= VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_return_output := vram_value_MUX_uxn_c_l339_c9_7d2d_return_output;

     -- device_ram_address_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l324_c2_3463_cond <= VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_cond;
     device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iftrue;
     device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output := device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;

     -- is_device_ram_16bit_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond <= VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_cond;
     is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iftrue;
     is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output := is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;

     -- ram_write_value_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l324_c2_3463_cond <= VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_cond;
     ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iftrue;
     ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output := ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;

     -- is_ram_write_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l324_c2_3463_cond <= VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_cond;
     is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iftrue;
     is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_return_output := is_ram_write_MUX_uxn_c_l324_c2_3463_return_output;

     -- vram_address_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l324_c2_3463_cond <= VAR_vram_address_MUX_uxn_c_l324_c2_3463_cond;
     vram_address_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_vram_address_MUX_uxn_c_l324_c2_3463_iftrue;
     vram_address_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_vram_address_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l324_c2_3463_return_output := vram_address_MUX_uxn_c_l324_c2_3463_return_output;

     -- vram_write_layer_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l324_c2_3463_cond <= VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_cond;
     vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iftrue;
     vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output := vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_right := VAR_MUX_uxn_c_l336_c17_a670_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_left := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l360_c3_e474_iftrue := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l363_c3_c70d_iffalse := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_left := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l360_c3_e474_cond := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l361_c3_5886_cond := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l363_c3_c70d_cond := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l364_c3_9432_cond := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_is_device_ram_16bit := VAR_is_device_ram_16bit_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_right := VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_enable := VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_main_ram_update_uxn_c_l353_c19_dfb4_write_enable := VAR_is_ram_write_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_step_gpu_uxn_c_l368_c20_1492_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_MUX_uxn_c_l364_c3_9432_iffalse := VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_main_ram_update_uxn_c_l353_c19_dfb4_value := VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_step_gpu_uxn_c_l368_c20_1492_vram_address := VAR_vram_address_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_vram_value_MUX_uxn_c_l324_c2_3463_iffalse := VAR_vram_value_MUX_uxn_c_l339_c9_7d2d_return_output;
     VAR_step_gpu_uxn_c_l368_c20_1492_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l324_c2_3463_return_output;
     -- BIN_OP_PLUS[uxn_c_l336_c3_85b1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l336_c3_85b1_left <= VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_left;
     BIN_OP_PLUS_uxn_c_l336_c3_85b1_right <= VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output := BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output;

     -- vector_snoop[uxn_c_l371_c18_4765] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l371_c18_4765_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l371_c18_4765_device_ram_address <= VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_address;
     vector_snoop_uxn_c_l371_c18_4765_device_ram_value <= VAR_vector_snoop_uxn_c_l371_c18_4765_device_ram_value;
     vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write <= VAR_vector_snoop_uxn_c_l371_c18_4765_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l371_c18_4765_return_output := vector_snoop_uxn_c_l371_c18_4765_return_output;

     -- MUX[uxn_c_l360_c3_e474] LATENCY=0
     -- Inputs
     MUX_uxn_c_l360_c3_e474_cond <= VAR_MUX_uxn_c_l360_c3_e474_cond;
     MUX_uxn_c_l360_c3_e474_iftrue <= VAR_MUX_uxn_c_l360_c3_e474_iftrue;
     MUX_uxn_c_l360_c3_e474_iffalse <= VAR_MUX_uxn_c_l360_c3_e474_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l360_c3_e474_return_output := MUX_uxn_c_l360_c3_e474_return_output;

     -- BIN_OP_PLUS[uxn_c_l363_c26_edb3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l363_c26_edb3_left <= VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_left;
     BIN_OP_PLUS_uxn_c_l363_c26_edb3_right <= VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output := BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output;

     -- vram_value_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l324_c2_3463_cond <= VAR_vram_value_MUX_uxn_c_l324_c2_3463_cond;
     vram_value_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_vram_value_MUX_uxn_c_l324_c2_3463_iftrue;
     vram_value_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_vram_value_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l324_c2_3463_return_output := vram_value_MUX_uxn_c_l324_c2_3463_return_output;

     -- BIN_OP_AND[uxn_c_l362_c3_ad8d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l362_c3_ad8d_left <= VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_left;
     BIN_OP_AND_uxn_c_l362_c3_ad8d_right <= VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output := BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output;

     -- Submodule level 8
     VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_enable := VAR_BIN_OP_AND_uxn_c_l362_c3_ad8d_return_output;
     VAR_u16_value_uxn_c_l336_c3_aa2f := resize(VAR_BIN_OP_PLUS_uxn_c_l336_c3_85b1_return_output, 16);
     VAR_MUX_uxn_c_l363_c3_c70d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l363_c26_edb3_return_output, 8);
     VAR_device_ram_update_uxn_c_l359_c26_9f99_address0 := VAR_MUX_uxn_c_l360_c3_e474_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l371_c18_4765_return_output;
     VAR_step_gpu_uxn_c_l368_c20_1492_vram_value := VAR_vram_value_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_u16_value_MUX_uxn_c_l324_c2_3463_iftrue := VAR_u16_value_uxn_c_l336_c3_aa2f;
     -- u16_value_MUX[uxn_c_l324_c2_3463] LATENCY=0
     -- Inputs
     u16_value_MUX_uxn_c_l324_c2_3463_cond <= VAR_u16_value_MUX_uxn_c_l324_c2_3463_cond;
     u16_value_MUX_uxn_c_l324_c2_3463_iftrue <= VAR_u16_value_MUX_uxn_c_l324_c2_3463_iftrue;
     u16_value_MUX_uxn_c_l324_c2_3463_iffalse <= VAR_u16_value_MUX_uxn_c_l324_c2_3463_iffalse;
     -- Outputs
     VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output := u16_value_MUX_uxn_c_l324_c2_3463_return_output;

     -- step_gpu[uxn_c_l368_c20_1492] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l368_c20_1492_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area <= VAR_step_gpu_uxn_c_l368_c20_1492_is_active_drawing_area;
     step_gpu_uxn_c_l368_c20_1492_is_vram_write <= VAR_step_gpu_uxn_c_l368_c20_1492_is_vram_write;
     step_gpu_uxn_c_l368_c20_1492_vram_write_layer <= VAR_step_gpu_uxn_c_l368_c20_1492_vram_write_layer;
     step_gpu_uxn_c_l368_c20_1492_vram_address <= VAR_step_gpu_uxn_c_l368_c20_1492_vram_address;
     step_gpu_uxn_c_l368_c20_1492_vram_value <= VAR_step_gpu_uxn_c_l368_c20_1492_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l368_c20_1492_return_output := step_gpu_uxn_c_l368_c20_1492_return_output;

     -- MUX[uxn_c_l363_c3_c70d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l363_c3_c70d_cond <= VAR_MUX_uxn_c_l363_c3_c70d_cond;
     MUX_uxn_c_l363_c3_c70d_iftrue <= VAR_MUX_uxn_c_l363_c3_c70d_iftrue;
     MUX_uxn_c_l363_c3_c70d_iffalse <= VAR_MUX_uxn_c_l363_c3_c70d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l363_c3_c70d_return_output := MUX_uxn_c_l363_c3_c70d_return_output;

     -- Submodule level 9
     VAR_device_ram_update_uxn_c_l359_c26_9f99_address1 := VAR_MUX_uxn_c_l363_c3_c70d_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l368_c20_1492_return_output;
     VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_x := VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output;
     VAR_main_ram_update_uxn_c_l353_c19_dfb4_ram_address := VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output;
     REG_VAR_u16_value := VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l370_c92_b54f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l370_c92_b54f_return_output := VAR_step_gpu_uxn_c_l368_c20_1492_return_output.color;

     -- main_ram_update[uxn_c_l353_c19_dfb4] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l353_c19_dfb4_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l353_c19_dfb4_ram_address <= VAR_main_ram_update_uxn_c_l353_c19_dfb4_ram_address;
     main_ram_update_uxn_c_l353_c19_dfb4_value <= VAR_main_ram_update_uxn_c_l353_c19_dfb4_value;
     main_ram_update_uxn_c_l353_c19_dfb4_write_enable <= VAR_main_ram_update_uxn_c_l353_c19_dfb4_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l353_c19_dfb4_return_output := main_ram_update_uxn_c_l353_c19_dfb4_return_output;

     -- CAST_TO_uint8_t[uxn_c_l364_c26_0fee] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_c_l364_c26_0fee_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_u16_value_MUX_uxn_c_l324_c2_3463_return_output);

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l369_c19_8a6c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l369_c19_8a6c_return_output := VAR_step_gpu_uxn_c_l368_c20_1492_return_output.is_active_fill;

     -- CONST_SR_8[uxn_c_l361_c36_f1a0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_c_l361_c36_f1a0_x <= VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_return_output := CONST_SR_8_uxn_c_l361_c36_f1a0_return_output;

     -- Submodule level 10
     VAR_MUX_uxn_c_l364_c3_9432_iftrue := VAR_CAST_TO_uint8_t_uxn_c_l364_c26_0fee_return_output;
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l369_c19_8a6c_return_output;
     VAR_palette_snoop_uxn_c_l370_c20_0493_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l370_c92_b54f_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l353_c19_dfb4_return_output;
     -- MUX[uxn_c_l364_c3_9432] LATENCY=0
     -- Inputs
     MUX_uxn_c_l364_c3_9432_cond <= VAR_MUX_uxn_c_l364_c3_9432_cond;
     MUX_uxn_c_l364_c3_9432_iftrue <= VAR_MUX_uxn_c_l364_c3_9432_iftrue;
     MUX_uxn_c_l364_c3_9432_iffalse <= VAR_MUX_uxn_c_l364_c3_9432_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l364_c3_9432_return_output := MUX_uxn_c_l364_c3_9432_return_output;

     -- CAST_TO_uint8_t[uxn_c_l361_c26_f4cc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_c_l361_c26_f4cc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_c_l361_c36_f1a0_return_output);

     -- palette_snoop[uxn_c_l370_c20_0493] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l370_c20_0493_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l370_c20_0493_device_ram_address <= VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_address;
     palette_snoop_uxn_c_l370_c20_0493_device_ram_value <= VAR_palette_snoop_uxn_c_l370_c20_0493_device_ram_value;
     palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write <= VAR_palette_snoop_uxn_c_l370_c20_0493_is_device_ram_write;
     palette_snoop_uxn_c_l370_c20_0493_gpu_step_color <= VAR_palette_snoop_uxn_c_l370_c20_0493_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l370_c20_0493_return_output := palette_snoop_uxn_c_l370_c20_0493_return_output;

     -- Submodule level 11
     VAR_MUX_uxn_c_l361_c3_5886_iftrue := VAR_CAST_TO_uint8_t_uxn_c_l361_c26_f4cc_return_output;
     VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_value := VAR_MUX_uxn_c_l364_c3_9432_return_output;
     VAR_return_output := VAR_palette_snoop_uxn_c_l370_c20_0493_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l370_c20_0493_return_output;
     -- MUX[uxn_c_l361_c3_5886] LATENCY=0
     -- Inputs
     MUX_uxn_c_l361_c3_5886_cond <= VAR_MUX_uxn_c_l361_c3_5886_cond;
     MUX_uxn_c_l361_c3_5886_iftrue <= VAR_MUX_uxn_c_l361_c3_5886_iftrue;
     MUX_uxn_c_l361_c3_5886_iffalse <= VAR_MUX_uxn_c_l361_c3_5886_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l361_c3_5886_return_output := MUX_uxn_c_l361_c3_5886_return_output;

     -- Submodule level 12
     VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_value := VAR_MUX_uxn_c_l361_c3_5886_return_output;
     -- device_ram_update[uxn_c_l359_c26_9f99] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l359_c26_9f99_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l359_c26_9f99_address0 <= VAR_device_ram_update_uxn_c_l359_c26_9f99_address0;
     device_ram_update_uxn_c_l359_c26_9f99_write0_value <= VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_value;
     device_ram_update_uxn_c_l359_c26_9f99_write0_enable <= VAR_device_ram_update_uxn_c_l359_c26_9f99_write0_enable;
     device_ram_update_uxn_c_l359_c26_9f99_address1 <= VAR_device_ram_update_uxn_c_l359_c26_9f99_address1;
     device_ram_update_uxn_c_l359_c26_9f99_write1_value <= VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_value;
     device_ram_update_uxn_c_l359_c26_9f99_write1_enable <= VAR_device_ram_update_uxn_c_l359_c26_9f99_write1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l359_c26_9f99_return_output := device_ram_update_uxn_c_l359_c26_9f99_return_output;

     -- Submodule level 13
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l359_c26_9f99_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_boot_check <= REG_VAR_boot_check;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_is_device_ram_16bit <= REG_VAR_is_device_ram_16bit;
REG_COMB_gpu_step_result <= REG_VAR_gpu_step_result;
REG_COMB_cpu_step_result <= REG_VAR_cpu_step_result;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_u16_value <= REG_VAR_u16_value;
REG_COMB_screen_vector <= REG_VAR_screen_vector;
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
     boot_check <= REG_COMB_boot_check;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     is_booted <= REG_COMB_is_booted;
     is_device_ram_16bit <= REG_COMB_is_device_ram_16bit;
     gpu_step_result <= REG_COMB_gpu_step_result;
     cpu_step_result <= REG_COMB_cpu_step_result;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     u16_value <= REG_COMB_u16_value;
     screen_vector <= REG_COMB_screen_vector;
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
