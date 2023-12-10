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
entity uxn_top_0CLK_29bd925b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_29bd925b;
architecture arch of uxn_top_0CLK_29bd925b is
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
-- UNARY_OP_NOT[uxn_c_l319_c7_845e]
signal UNARY_OP_NOT_uxn_c_l319_c7_845e_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l335_c9_1b9a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l319_c2_33b7]
signal is_ram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l319_c2_33b7]
signal is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l319_c2_33b7]
signal ram_write_value_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l319_c2_33b7]
signal vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l319_c2_33b7]
signal device_ram_address_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);

-- u16_addr_MUX[uxn_c_l319_c2_33b7]
signal u16_addr_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(15 downto 0);

-- is_vram_write_MUX[uxn_c_l319_c2_33b7]
signal is_vram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l319_c2_33b7]
signal is_booted_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l319_c2_33b7]
signal cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output : cpu_step_result_t;

-- boot_check_MUX[uxn_c_l319_c2_33b7]
signal boot_check_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(23 downto 0);

-- vram_value_MUX[uxn_c_l319_c2_33b7]
signal vram_value_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_c_l329_c44_ec19]
signal BIN_OP_GT_uxn_c_l329_c44_ec19_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l329_c44_ec19_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l329_c44_ec19_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l329_c65_4454]
signal BIN_OP_PLUS_uxn_c_l329_c65_4454_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l329_c65_4454_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l329_c44_a765]
signal MUX_uxn_c_l329_c44_a765_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l329_c44_a765_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c44_a765_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c44_a765_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l329_c16_f2b3]
signal MUX_uxn_c_l329_c16_f2b3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l329_c16_f2b3_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c16_f2b3_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c16_f2b3_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l330_c16_d0ea]
signal BIN_OP_EQ_uxn_c_l330_c16_d0ea_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l330_c16_d0ea_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l330_c16_0f59]
signal MUX_uxn_c_l330_c16_0f59_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_0f59_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_0f59_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_0f59_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l332_c16_6309]
signal MUX_uxn_c_l332_c16_6309_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_6309_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_6309_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_6309_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l332_c3_b013]
signal BIN_OP_PLUS_uxn_c_l332_c3_b013_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l332_c3_b013_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l333_c21_8683]
signal MUX_uxn_c_l333_c21_8683_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l333_c21_8683_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l333_c21_8683_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l333_c21_8683_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l335_c14_b390]
signal UNARY_OP_NOT_uxn_c_l335_c14_b390_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l335_c1_663b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l335_c9_1b9a]
signal is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l335_c9_1b9a]
signal is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l335_c9_1b9a]
signal ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l335_c9_1b9a]
signal vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l335_c9_1b9a]
signal device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);

-- u16_addr_MUX[uxn_c_l335_c9_1b9a]
signal u16_addr_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(15 downto 0);

-- is_vram_write_MUX[uxn_c_l335_c9_1b9a]
signal is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l335_c9_1b9a]
signal cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output : cpu_step_result_t;

-- vram_value_MUX[uxn_c_l335_c9_1b9a]
signal vram_value_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);

-- step_cpu[uxn_c_l336_c21_499b]
signal step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l336_c21_499b_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l336_c21_499b_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l336_c21_499b_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l347_c19_be9b]
signal main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_be9b_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l347_c19_be9b_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l347_c19_be9b_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_be9b_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l353_c26_9a0a]
signal device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_9a0a_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_9a0a_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_9a0a_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_9a0a_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l359_c20_1ea2]
signal step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l359_c20_1ea2_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l361_c20_2e48]
signal palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_2e48_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_2e48_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l361_c20_2e48_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l362_c18_7d73]
signal vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_7d73_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_7d73_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_7d73_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l319_c7_845e
UNARY_OP_NOT_uxn_c_l319_c7_845e : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l319_c7_845e_expr,
UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output);

-- is_ram_write_MUX_uxn_c_l319_c2_33b7
is_ram_write_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l319_c2_33b7_cond,
is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue,
is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse,
is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output);

-- is_device_ram_write_MUX_uxn_c_l319_c2_33b7
is_device_ram_write_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond,
is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue,
is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse,
is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output);

-- ram_write_value_MUX_uxn_c_l319_c2_33b7
ram_write_value_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l319_c2_33b7_cond,
ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue,
ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse,
ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output);

-- vram_write_layer_MUX_uxn_c_l319_c2_33b7
vram_write_layer_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond,
vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue,
vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse,
vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output);

-- device_ram_address_MUX_uxn_c_l319_c2_33b7
device_ram_address_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l319_c2_33b7_cond,
device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue,
device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse,
device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output);

-- u16_addr_MUX_uxn_c_l319_c2_33b7
u16_addr_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l319_c2_33b7_cond,
u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue,
u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse,
u16_addr_MUX_uxn_c_l319_c2_33b7_return_output);

-- is_vram_write_MUX_uxn_c_l319_c2_33b7
is_vram_write_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l319_c2_33b7_cond,
is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue,
is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse,
is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output);

-- is_booted_MUX_uxn_c_l319_c2_33b7
is_booted_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l319_c2_33b7_cond,
is_booted_MUX_uxn_c_l319_c2_33b7_iftrue,
is_booted_MUX_uxn_c_l319_c2_33b7_iffalse,
is_booted_MUX_uxn_c_l319_c2_33b7_return_output);

-- cpu_step_result_MUX_uxn_c_l319_c2_33b7
cpu_step_result_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond,
cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue,
cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse,
cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output);

-- boot_check_MUX_uxn_c_l319_c2_33b7
boot_check_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l319_c2_33b7_cond,
boot_check_MUX_uxn_c_l319_c2_33b7_iftrue,
boot_check_MUX_uxn_c_l319_c2_33b7_iffalse,
boot_check_MUX_uxn_c_l319_c2_33b7_return_output);

-- vram_value_MUX_uxn_c_l319_c2_33b7
vram_value_MUX_uxn_c_l319_c2_33b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l319_c2_33b7_cond,
vram_value_MUX_uxn_c_l319_c2_33b7_iftrue,
vram_value_MUX_uxn_c_l319_c2_33b7_iffalse,
vram_value_MUX_uxn_c_l319_c2_33b7_return_output);

-- BIN_OP_GT_uxn_c_l329_c44_ec19
BIN_OP_GT_uxn_c_l329_c44_ec19 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l329_c44_ec19_left,
BIN_OP_GT_uxn_c_l329_c44_ec19_right,
BIN_OP_GT_uxn_c_l329_c44_ec19_return_output);

-- BIN_OP_PLUS_uxn_c_l329_c65_4454
BIN_OP_PLUS_uxn_c_l329_c65_4454 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l329_c65_4454_left,
BIN_OP_PLUS_uxn_c_l329_c65_4454_right,
BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output);

-- MUX_uxn_c_l329_c44_a765
MUX_uxn_c_l329_c44_a765 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l329_c44_a765_cond,
MUX_uxn_c_l329_c44_a765_iftrue,
MUX_uxn_c_l329_c44_a765_iffalse,
MUX_uxn_c_l329_c44_a765_return_output);

-- MUX_uxn_c_l329_c16_f2b3
MUX_uxn_c_l329_c16_f2b3 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l329_c16_f2b3_cond,
MUX_uxn_c_l329_c16_f2b3_iftrue,
MUX_uxn_c_l329_c16_f2b3_iffalse,
MUX_uxn_c_l329_c16_f2b3_return_output);

-- BIN_OP_EQ_uxn_c_l330_c16_d0ea
BIN_OP_EQ_uxn_c_l330_c16_d0ea : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l330_c16_d0ea_left,
BIN_OP_EQ_uxn_c_l330_c16_d0ea_right,
BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output);

-- MUX_uxn_c_l330_c16_0f59
MUX_uxn_c_l330_c16_0f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l330_c16_0f59_cond,
MUX_uxn_c_l330_c16_0f59_iftrue,
MUX_uxn_c_l330_c16_0f59_iffalse,
MUX_uxn_c_l330_c16_0f59_return_output);

-- MUX_uxn_c_l332_c16_6309
MUX_uxn_c_l332_c16_6309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l332_c16_6309_cond,
MUX_uxn_c_l332_c16_6309_iftrue,
MUX_uxn_c_l332_c16_6309_iffalse,
MUX_uxn_c_l332_c16_6309_return_output);

-- BIN_OP_PLUS_uxn_c_l332_c3_b013
BIN_OP_PLUS_uxn_c_l332_c3_b013 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l332_c3_b013_left,
BIN_OP_PLUS_uxn_c_l332_c3_b013_right,
BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output);

-- MUX_uxn_c_l333_c21_8683
MUX_uxn_c_l333_c21_8683 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l333_c21_8683_cond,
MUX_uxn_c_l333_c21_8683_iftrue,
MUX_uxn_c_l333_c21_8683_iffalse,
MUX_uxn_c_l333_c21_8683_return_output);

-- UNARY_OP_NOT_uxn_c_l335_c14_b390
UNARY_OP_NOT_uxn_c_l335_c14_b390 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l335_c14_b390_expr,
UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output);

-- is_ram_write_MUX_uxn_c_l335_c9_1b9a
is_ram_write_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond,
is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue,
is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse,
is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output);

-- is_device_ram_write_MUX_uxn_c_l335_c9_1b9a
is_device_ram_write_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond,
is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue,
is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse,
is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output);

-- ram_write_value_MUX_uxn_c_l335_c9_1b9a
ram_write_value_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond,
ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue,
ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse,
ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output);

-- vram_write_layer_MUX_uxn_c_l335_c9_1b9a
vram_write_layer_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond,
vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue,
vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse,
vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output);

-- device_ram_address_MUX_uxn_c_l335_c9_1b9a
device_ram_address_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond,
device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue,
device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse,
device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output);

-- u16_addr_MUX_uxn_c_l335_c9_1b9a
u16_addr_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l335_c9_1b9a_cond,
u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue,
u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse,
u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output);

-- is_vram_write_MUX_uxn_c_l335_c9_1b9a
is_vram_write_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond,
is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue,
is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse,
is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output);

-- cpu_step_result_MUX_uxn_c_l335_c9_1b9a
cpu_step_result_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond,
cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue,
cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse,
cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output);

-- vram_value_MUX_uxn_c_l335_c9_1b9a
vram_value_MUX_uxn_c_l335_c9_1b9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l335_c9_1b9a_cond,
vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue,
vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse,
vram_value_MUX_uxn_c_l335_c9_1b9a_return_output);

-- step_cpu_uxn_c_l336_c21_499b
step_cpu_uxn_c_l336_c21_499b : entity work.step_cpu_0CLK_59b2a0ae port map (
clk,
step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE,
step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value,
step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read,
step_cpu_uxn_c_l336_c21_499b_use_vector,
step_cpu_uxn_c_l336_c21_499b_vector,
step_cpu_uxn_c_l336_c21_499b_return_output);

-- main_ram_update_uxn_c_l347_c19_be9b
main_ram_update_uxn_c_l347_c19_be9b : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE,
main_ram_update_uxn_c_l347_c19_be9b_ram_address,
main_ram_update_uxn_c_l347_c19_be9b_value,
main_ram_update_uxn_c_l347_c19_be9b_write_enable,
main_ram_update_uxn_c_l347_c19_be9b_return_output);

-- device_ram_update_uxn_c_l353_c26_9a0a
device_ram_update_uxn_c_l353_c26_9a0a : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE,
device_ram_update_uxn_c_l353_c26_9a0a_device_address,
device_ram_update_uxn_c_l353_c26_9a0a_value,
device_ram_update_uxn_c_l353_c26_9a0a_write_enable,
device_ram_update_uxn_c_l353_c26_9a0a_return_output);

-- step_gpu_uxn_c_l359_c20_1ea2
step_gpu_uxn_c_l359_c20_1ea2 : entity work.step_gpu_0CLK_7e56aace port map (
clk,
step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE,
step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area,
step_gpu_uxn_c_l359_c20_1ea2_is_vram_write,
step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer,
step_gpu_uxn_c_l359_c20_1ea2_vram_address,
step_gpu_uxn_c_l359_c20_1ea2_vram_value,
step_gpu_uxn_c_l359_c20_1ea2_return_output);

-- palette_snoop_uxn_c_l361_c20_2e48
palette_snoop_uxn_c_l361_c20_2e48 : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE,
palette_snoop_uxn_c_l361_c20_2e48_device_ram_address,
palette_snoop_uxn_c_l361_c20_2e48_device_ram_value,
palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write,
palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color,
palette_snoop_uxn_c_l361_c20_2e48_return_output);

-- vector_snoop_uxn_c_l362_c18_7d73
vector_snoop_uxn_c_l362_c18_7d73 : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE,
vector_snoop_uxn_c_l362_c18_7d73_device_ram_address,
vector_snoop_uxn_c_l362_c18_7d73_device_ram_value,
vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write,
vector_snoop_uxn_c_l362_c18_7d73_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output);



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
 UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output,
 is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output,
 is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output,
 ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output,
 vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output,
 device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output,
 u16_addr_MUX_uxn_c_l319_c2_33b7_return_output,
 is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output,
 is_booted_MUX_uxn_c_l319_c2_33b7_return_output,
 cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output,
 boot_check_MUX_uxn_c_l319_c2_33b7_return_output,
 vram_value_MUX_uxn_c_l319_c2_33b7_return_output,
 BIN_OP_GT_uxn_c_l329_c44_ec19_return_output,
 BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output,
 MUX_uxn_c_l329_c44_a765_return_output,
 MUX_uxn_c_l329_c16_f2b3_return_output,
 BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output,
 MUX_uxn_c_l330_c16_0f59_return_output,
 MUX_uxn_c_l332_c16_6309_return_output,
 BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output,
 MUX_uxn_c_l333_c21_8683_return_output,
 UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output,
 is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output,
 is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output,
 ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output,
 vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output,
 device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output,
 u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output,
 is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output,
 cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output,
 vram_value_MUX_uxn_c_l335_c9_1b9a_return_output,
 step_cpu_uxn_c_l336_c21_499b_return_output,
 main_ram_update_uxn_c_l347_c19_be9b_return_output,
 device_ram_update_uxn_c_l353_c26_9a0a_return_output,
 step_gpu_uxn_c_l359_c20_1ea2_return_output,
 palette_snoop_uxn_c_l361_c20_2e48_return_output,
 vector_snoop_uxn_c_l362_c18_7d73_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l332_c3_af7a : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_33b7_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_33b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_f2b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_f2b3_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_f2b3_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_a765_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_a765_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_a765_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_a765_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_f2b3_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_0f59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_0f59_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_0f59_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_0f59_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_6309_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_6309_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_6309_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_6309_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_8683_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_8683_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_8683_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_8683_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_02a2_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_499b_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_3716_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_8d60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_18ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_a07a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_3c5f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_55be_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_be9b_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_be9b_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_be9b_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_be9b_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_9a0a_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_9a0a_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_9a0a_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_9a0a_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_1ea2_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_ae0e_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_3ec3_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_2e48_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_7d73_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l344_DUPLICATE_240a_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l330_c16_0f59_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l330_c16_0f59_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l333_c21_8683_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l329_c44_a765_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l329_c16_f2b3_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l332_c16_6309_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l332_c16_6309_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l329_c16_f2b3_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l333_c21_8683_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l336_c21_499b_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_left := u16_addr;
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_left := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l319_c7_845e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l319_c7_845e_expr <= VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output := UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;

     -- UNARY_OP_NOT[uxn_c_l335_c14_b390] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l335_c14_b390_expr <= VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output := UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;

     -- BIN_OP_GT[uxn_c_l329_c44_ec19] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l329_c44_ec19_left <= VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_left;
     BIN_OP_GT_uxn_c_l329_c44_ec19_right <= VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_return_output := BIN_OP_GT_uxn_c_l329_c44_ec19_return_output;

     -- BIN_OP_PLUS[uxn_c_l329_c65_4454] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l329_c65_4454_left <= VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_left;
     BIN_OP_PLUS_uxn_c_l329_c65_4454_right <= VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output := BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l336_c69_02a2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_02a2_return_output := gpu_step_result.is_new_frame;

     -- Submodule level 1
     VAR_MUX_uxn_c_l329_c44_a765_cond := VAR_BIN_OP_GT_uxn_c_l329_c44_ec19_return_output;
     VAR_MUX_uxn_c_l329_c44_a765_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l329_c65_4454_return_output, 24);
     VAR_step_cpu_uxn_c_l336_c21_499b_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_02a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_is_booted_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_845e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_b390_return_output;
     -- MUX[uxn_c_l329_c44_a765] LATENCY=0
     -- Inputs
     MUX_uxn_c_l329_c44_a765_cond <= VAR_MUX_uxn_c_l329_c44_a765_cond;
     MUX_uxn_c_l329_c44_a765_iftrue <= VAR_MUX_uxn_c_l329_c44_a765_iftrue;
     MUX_uxn_c_l329_c44_a765_iffalse <= VAR_MUX_uxn_c_l329_c44_a765_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l329_c44_a765_return_output := MUX_uxn_c_l329_c44_a765_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_MUX_uxn_c_l329_c16_f2b3_iffalse := VAR_MUX_uxn_c_l329_c44_a765_return_output;
     -- MUX[uxn_c_l329_c16_f2b3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l329_c16_f2b3_cond <= VAR_MUX_uxn_c_l329_c16_f2b3_cond;
     MUX_uxn_c_l329_c16_f2b3_iftrue <= VAR_MUX_uxn_c_l329_c16_f2b3_iftrue;
     MUX_uxn_c_l329_c16_f2b3_iffalse <= VAR_MUX_uxn_c_l329_c16_f2b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l329_c16_f2b3_return_output := MUX_uxn_c_l329_c16_f2b3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l335_c1_663b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_left := VAR_MUX_uxn_c_l329_c16_f2b3_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iftrue := VAR_MUX_uxn_c_l329_c16_f2b3_return_output;
     VAR_step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_663b_return_output;
     -- boot_check_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l319_c2_33b7_cond <= VAR_boot_check_MUX_uxn_c_l319_c2_33b7_cond;
     boot_check_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iftrue;
     boot_check_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_boot_check_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l319_c2_33b7_return_output := boot_check_MUX_uxn_c_l319_c2_33b7_return_output;

     -- step_cpu[uxn_c_l336_c21_499b] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l336_c21_499b_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value <= VAR_step_cpu_uxn_c_l336_c21_499b_previous_ram_read_value;
     step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read <= VAR_step_cpu_uxn_c_l336_c21_499b_previous_device_ram_read;
     step_cpu_uxn_c_l336_c21_499b_use_vector <= VAR_step_cpu_uxn_c_l336_c21_499b_use_vector;
     step_cpu_uxn_c_l336_c21_499b_vector <= VAR_step_cpu_uxn_c_l336_c21_499b_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l336_c21_499b_return_output := step_cpu_uxn_c_l336_c21_499b_return_output;

     -- BIN_OP_EQ[uxn_c_l330_c16_d0ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l330_c16_d0ea_left <= VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_left;
     BIN_OP_EQ_uxn_c_l330_c16_d0ea_right <= VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output := BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l330_c16_0f59_cond := VAR_BIN_OP_EQ_uxn_c_l330_c16_d0ea_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_step_cpu_uxn_c_l336_c21_499b_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l343_c22_55be] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_55be_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l344_DUPLICATE_240a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l344_DUPLICATE_240a_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.u8_value;

     -- cpu_step_result_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_cond;
     cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iftrue;
     cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output := cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l342_c19_3c5f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_3c5f_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l339_c24_18ba] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_18ba_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l337_c18_3716] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_3716_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l338_c14_8d60] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_8d60_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.u16_addr;

     -- MUX[uxn_c_l330_c16_0f59] LATENCY=0
     -- Inputs
     MUX_uxn_c_l330_c16_0f59_cond <= VAR_MUX_uxn_c_l330_c16_0f59_cond;
     MUX_uxn_c_l330_c16_0f59_iftrue <= VAR_MUX_uxn_c_l330_c16_0f59_iftrue;
     MUX_uxn_c_l330_c16_0f59_iffalse <= VAR_MUX_uxn_c_l330_c16_0f59_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l330_c16_0f59_return_output := MUX_uxn_c_l330_c16_0f59_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l340_c25_a07a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_a07a_return_output := VAR_step_cpu_uxn_c_l336_c21_499b_return_output.is_device_ram_write;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_8d60_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_a07a_return_output;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_3716_return_output;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_3c5f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_55be_return_output;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_18ba_return_output;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l344_DUPLICATE_240a_return_output;
     VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l344_DUPLICATE_240a_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right := VAR_MUX_uxn_c_l330_c16_0f59_return_output;
     VAR_MUX_uxn_c_l333_c21_8683_cond := VAR_MUX_uxn_c_l330_c16_0f59_return_output;
     VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iftrue := VAR_MUX_uxn_c_l330_c16_0f59_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_cpu_step_result_MUX_uxn_c_l335_c9_1b9a_return_output;
     -- is_booted_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l319_c2_33b7_cond <= VAR_is_booted_MUX_uxn_c_l319_c2_33b7_cond;
     is_booted_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iftrue;
     is_booted_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_is_booted_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l319_c2_33b7_return_output := is_booted_MUX_uxn_c_l319_c2_33b7_return_output;

     -- is_ram_write_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_cond;
     is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue;
     is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output := is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- u16_addr_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_cond;
     u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iftrue;
     u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output := u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- device_ram_address_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_cond;
     device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iftrue;
     device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output := device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- is_vram_write_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_cond;
     is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iftrue;
     is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output := is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- vram_write_layer_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_cond;
     vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iftrue;
     vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output := vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- is_device_ram_write_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_cond;
     is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iftrue;
     is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output := is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- vram_value_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_cond;
     vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iftrue;
     vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_return_output := vram_value_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- MUX[uxn_c_l333_c21_8683] LATENCY=0
     -- Inputs
     MUX_uxn_c_l333_c21_8683_cond <= VAR_MUX_uxn_c_l333_c21_8683_cond;
     MUX_uxn_c_l333_c21_8683_iftrue <= VAR_MUX_uxn_c_l333_c21_8683_iftrue;
     MUX_uxn_c_l333_c21_8683_iffalse <= VAR_MUX_uxn_c_l333_c21_8683_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l333_c21_8683_return_output := MUX_uxn_c_l333_c21_8683_return_output;

     -- ram_write_value_MUX[uxn_c_l335_c9_1b9a] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond <= VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_cond;
     ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue <= VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iftrue;
     ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse <= VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output := ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output;

     -- cpu_step_result_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_cond;
     cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iftrue;
     cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output := cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l332_c16_6309_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_7b70_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue := VAR_MUX_uxn_c_l333_c21_8683_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_device_ram_address_MUX_uxn_c_l335_c9_1b9a_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_is_ram_write_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_is_vram_write_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_ram_write_value_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_u16_addr_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_vram_value_MUX_uxn_c_l335_c9_1b9a_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse := VAR_vram_write_layer_MUX_uxn_c_l335_c9_1b9a_return_output;
     -- device_ram_address_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l319_c2_33b7_cond <= VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_cond;
     device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iftrue;
     device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output := device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output;

     -- is_vram_write_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l319_c2_33b7_cond <= VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_cond;
     is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iftrue;
     is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output := is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output;

     -- ram_write_value_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l319_c2_33b7_cond <= VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_cond;
     ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iftrue;
     ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output := ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;

     -- is_device_ram_write_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_cond;
     is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue;
     is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output := is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;

     -- vram_value_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l319_c2_33b7_cond <= VAR_vram_value_MUX_uxn_c_l319_c2_33b7_cond;
     vram_value_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iftrue;
     vram_value_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_vram_value_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l319_c2_33b7_return_output := vram_value_MUX_uxn_c_l319_c2_33b7_return_output;

     -- vram_write_layer_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_cond;
     vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iftrue;
     vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output := vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output;

     -- MUX[uxn_c_l332_c16_6309] LATENCY=0
     -- Inputs
     MUX_uxn_c_l332_c16_6309_cond <= VAR_MUX_uxn_c_l332_c16_6309_cond;
     MUX_uxn_c_l332_c16_6309_iftrue <= VAR_MUX_uxn_c_l332_c16_6309_iftrue;
     MUX_uxn_c_l332_c16_6309_iffalse <= VAR_MUX_uxn_c_l332_c16_6309_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l332_c16_6309_return_output := MUX_uxn_c_l332_c16_6309_return_output;

     -- is_ram_write_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l319_c2_33b7_cond <= VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_cond;
     is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iftrue;
     is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output := is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_right := VAR_MUX_uxn_c_l332_c16_6309_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_9a0a_device_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_9a0a_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_be9b_write_enable := VAR_is_ram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_9a0a_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_be9b_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_33b7_return_output;
     -- BIN_OP_PLUS[uxn_c_l332_c3_b013] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l332_c3_b013_left <= VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_left;
     BIN_OP_PLUS_uxn_c_l332_c3_b013_right <= VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output := BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output;

     -- device_ram_update[uxn_c_l353_c26_9a0a] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l353_c26_9a0a_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l353_c26_9a0a_device_address <= VAR_device_ram_update_uxn_c_l353_c26_9a0a_device_address;
     device_ram_update_uxn_c_l353_c26_9a0a_value <= VAR_device_ram_update_uxn_c_l353_c26_9a0a_value;
     device_ram_update_uxn_c_l353_c26_9a0a_write_enable <= VAR_device_ram_update_uxn_c_l353_c26_9a0a_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l353_c26_9a0a_return_output := device_ram_update_uxn_c_l353_c26_9a0a_return_output;

     -- vector_snoop[uxn_c_l362_c18_7d73] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l362_c18_7d73_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l362_c18_7d73_device_ram_address <= VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_address;
     vector_snoop_uxn_c_l362_c18_7d73_device_ram_value <= VAR_vector_snoop_uxn_c_l362_c18_7d73_device_ram_value;
     vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write <= VAR_vector_snoop_uxn_c_l362_c18_7d73_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l362_c18_7d73_return_output := vector_snoop_uxn_c_l362_c18_7d73_return_output;

     -- Submodule level 8
     VAR_u16_addr_uxn_c_l332_c3_af7a := resize(VAR_BIN_OP_PLUS_uxn_c_l332_c3_b013_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l353_c26_9a0a_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l362_c18_7d73_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue := VAR_u16_addr_uxn_c_l332_c3_af7a;
     -- u16_addr_MUX[uxn_c_l319_c2_33b7] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l319_c2_33b7_cond <= VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_cond;
     u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue <= VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iftrue;
     u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse <= VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_return_output := u16_addr_MUX_uxn_c_l319_c2_33b7_return_output;

     -- Submodule level 9
     VAR_main_ram_update_uxn_c_l347_c19_be9b_ram_address := VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_return_output;
     VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_address := VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l319_c2_33b7_return_output;
     -- step_gpu[uxn_c_l359_c20_1ea2] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l359_c20_1ea2_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area <= VAR_step_gpu_uxn_c_l359_c20_1ea2_is_active_drawing_area;
     step_gpu_uxn_c_l359_c20_1ea2_is_vram_write <= VAR_step_gpu_uxn_c_l359_c20_1ea2_is_vram_write;
     step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer <= VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_write_layer;
     step_gpu_uxn_c_l359_c20_1ea2_vram_address <= VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_address;
     step_gpu_uxn_c_l359_c20_1ea2_vram_value <= VAR_step_gpu_uxn_c_l359_c20_1ea2_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l359_c20_1ea2_return_output := step_gpu_uxn_c_l359_c20_1ea2_return_output;

     -- main_ram_update[uxn_c_l347_c19_be9b] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l347_c19_be9b_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l347_c19_be9b_ram_address <= VAR_main_ram_update_uxn_c_l347_c19_be9b_ram_address;
     main_ram_update_uxn_c_l347_c19_be9b_value <= VAR_main_ram_update_uxn_c_l347_c19_be9b_value;
     main_ram_update_uxn_c_l347_c19_be9b_write_enable <= VAR_main_ram_update_uxn_c_l347_c19_be9b_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l347_c19_be9b_return_output := main_ram_update_uxn_c_l347_c19_be9b_return_output;

     -- Submodule level 10
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l347_c19_be9b_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l359_c20_1ea2_return_output;
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l360_c19_ae0e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_ae0e_return_output := VAR_step_gpu_uxn_c_l359_c20_1ea2_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l361_c92_3ec3] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_3ec3_return_output := VAR_step_gpu_uxn_c_l359_c20_1ea2_return_output.color;

     -- Submodule level 11
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_ae0e_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_3ec3_return_output;
     -- palette_snoop[uxn_c_l361_c20_2e48] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l361_c20_2e48_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l361_c20_2e48_device_ram_address <= VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_address;
     palette_snoop_uxn_c_l361_c20_2e48_device_ram_value <= VAR_palette_snoop_uxn_c_l361_c20_2e48_device_ram_value;
     palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write <= VAR_palette_snoop_uxn_c_l361_c20_2e48_is_device_ram_write;
     palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color <= VAR_palette_snoop_uxn_c_l361_c20_2e48_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l361_c20_2e48_return_output := palette_snoop_uxn_c_l361_c20_2e48_return_output;

     -- Submodule level 12
     VAR_return_output := VAR_palette_snoop_uxn_c_l361_c20_2e48_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l361_c20_2e48_return_output;
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
