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
entity uxn_top_0CLK_8d4e68e9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_8d4e68e9;
architecture arch of uxn_top_0CLK_8d4e68e9 is
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
-- UNARY_OP_NOT[uxn_c_l319_c7_ccad]
signal UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l335_c9_0c74]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);

-- boot_check_MUX[uxn_c_l319_c2_7636]
signal boot_check_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_7636_return_output : unsigned(23 downto 0);

-- device_ram_address_MUX[uxn_c_l319_c2_7636]
signal device_ram_address_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l319_c2_7636]
signal vram_write_layer_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l319_c2_7636]
signal ram_write_value_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l319_c2_7636]
signal is_ram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l319_c2_7636]
signal is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l319_c2_7636]
signal is_vram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l319_c2_7636]
signal cpu_step_result_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l319_c2_7636]
signal u16_addr_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c2_7636_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l319_c2_7636]
signal vram_value_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);

-- is_booted_MUX[uxn_c_l319_c2_7636]
signal is_booted_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l329_c44_abae]
signal BIN_OP_GT_uxn_c_l329_c44_abae_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l329_c44_abae_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l329_c44_abae_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l329_c65_3535]
signal BIN_OP_PLUS_uxn_c_l329_c65_3535_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l329_c65_3535_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l329_c44_5d96]
signal MUX_uxn_c_l329_c44_5d96_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l329_c44_5d96_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c44_5d96_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c44_5d96_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l329_c16_324a]
signal MUX_uxn_c_l329_c16_324a_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l329_c16_324a_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c16_324a_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l329_c16_324a_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l330_c16_f147]
signal BIN_OP_EQ_uxn_c_l330_c16_f147_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l330_c16_f147_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l330_c16_f147_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l330_c16_9b82]
signal MUX_uxn_c_l330_c16_9b82_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_9b82_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_9b82_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l330_c16_9b82_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l332_c16_dc74]
signal MUX_uxn_c_l332_c16_dc74_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_dc74_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_dc74_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l332_c16_dc74_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l332_c3_57bf]
signal BIN_OP_PLUS_uxn_c_l332_c3_57bf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l332_c3_57bf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l333_c21_ba38]
signal MUX_uxn_c_l333_c21_ba38_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l333_c21_ba38_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l333_c21_ba38_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l333_c21_ba38_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l335_c14_3791]
signal UNARY_OP_NOT_uxn_c_l335_c14_3791_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l335_c1_f90d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l335_c9_0c74]
signal device_ram_address_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l335_c9_0c74]
signal vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l335_c9_0c74]
signal ram_write_value_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l335_c9_0c74]
signal is_ram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l335_c9_0c74]
signal is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l335_c9_0c74]
signal is_vram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l335_c9_0c74]
signal cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l335_c9_0c74]
signal u16_addr_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(15 downto 0);

-- vram_value_MUX[uxn_c_l335_c9_0c74]
signal vram_value_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);

-- step_cpu[uxn_c_l336_c21_22ed]
signal step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l336_c21_22ed_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l336_c21_22ed_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l336_c21_22ed_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l347_c19_d3b8]
signal main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_d3b8_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l347_c19_d3b8_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l347_c19_d3b8_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_d3b8_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l353_c26_a5e5]
signal device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_a5e5_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_a5e5_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_a5e5_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_a5e5_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l359_c20_a79d]
signal step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l359_c20_a79d_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l361_c20_d48a]
signal palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_d48a_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_d48a_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l361_c20_d48a_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l362_c18_e26a]
signal vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_e26a_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_e26a_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_e26a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l319_c7_ccad
UNARY_OP_NOT_uxn_c_l319_c7_ccad : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr,
UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output);

-- boot_check_MUX_uxn_c_l319_c2_7636
boot_check_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l319_c2_7636_cond,
boot_check_MUX_uxn_c_l319_c2_7636_iftrue,
boot_check_MUX_uxn_c_l319_c2_7636_iffalse,
boot_check_MUX_uxn_c_l319_c2_7636_return_output);

-- device_ram_address_MUX_uxn_c_l319_c2_7636
device_ram_address_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l319_c2_7636_cond,
device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue,
device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse,
device_ram_address_MUX_uxn_c_l319_c2_7636_return_output);

-- vram_write_layer_MUX_uxn_c_l319_c2_7636
vram_write_layer_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l319_c2_7636_cond,
vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue,
vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse,
vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output);

-- ram_write_value_MUX_uxn_c_l319_c2_7636
ram_write_value_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l319_c2_7636_cond,
ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue,
ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse,
ram_write_value_MUX_uxn_c_l319_c2_7636_return_output);

-- is_ram_write_MUX_uxn_c_l319_c2_7636
is_ram_write_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l319_c2_7636_cond,
is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue,
is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse,
is_ram_write_MUX_uxn_c_l319_c2_7636_return_output);

-- is_device_ram_write_MUX_uxn_c_l319_c2_7636
is_device_ram_write_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond,
is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue,
is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse,
is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output);

-- is_vram_write_MUX_uxn_c_l319_c2_7636
is_vram_write_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l319_c2_7636_cond,
is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue,
is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse,
is_vram_write_MUX_uxn_c_l319_c2_7636_return_output);

-- cpu_step_result_MUX_uxn_c_l319_c2_7636
cpu_step_result_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l319_c2_7636_cond,
cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue,
cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse,
cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output);

-- u16_addr_MUX_uxn_c_l319_c2_7636
u16_addr_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l319_c2_7636_cond,
u16_addr_MUX_uxn_c_l319_c2_7636_iftrue,
u16_addr_MUX_uxn_c_l319_c2_7636_iffalse,
u16_addr_MUX_uxn_c_l319_c2_7636_return_output);

-- vram_value_MUX_uxn_c_l319_c2_7636
vram_value_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l319_c2_7636_cond,
vram_value_MUX_uxn_c_l319_c2_7636_iftrue,
vram_value_MUX_uxn_c_l319_c2_7636_iffalse,
vram_value_MUX_uxn_c_l319_c2_7636_return_output);

-- is_booted_MUX_uxn_c_l319_c2_7636
is_booted_MUX_uxn_c_l319_c2_7636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l319_c2_7636_cond,
is_booted_MUX_uxn_c_l319_c2_7636_iftrue,
is_booted_MUX_uxn_c_l319_c2_7636_iffalse,
is_booted_MUX_uxn_c_l319_c2_7636_return_output);

-- BIN_OP_GT_uxn_c_l329_c44_abae
BIN_OP_GT_uxn_c_l329_c44_abae : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l329_c44_abae_left,
BIN_OP_GT_uxn_c_l329_c44_abae_right,
BIN_OP_GT_uxn_c_l329_c44_abae_return_output);

-- BIN_OP_PLUS_uxn_c_l329_c65_3535
BIN_OP_PLUS_uxn_c_l329_c65_3535 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l329_c65_3535_left,
BIN_OP_PLUS_uxn_c_l329_c65_3535_right,
BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output);

-- MUX_uxn_c_l329_c44_5d96
MUX_uxn_c_l329_c44_5d96 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l329_c44_5d96_cond,
MUX_uxn_c_l329_c44_5d96_iftrue,
MUX_uxn_c_l329_c44_5d96_iffalse,
MUX_uxn_c_l329_c44_5d96_return_output);

-- MUX_uxn_c_l329_c16_324a
MUX_uxn_c_l329_c16_324a : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l329_c16_324a_cond,
MUX_uxn_c_l329_c16_324a_iftrue,
MUX_uxn_c_l329_c16_324a_iffalse,
MUX_uxn_c_l329_c16_324a_return_output);

-- BIN_OP_EQ_uxn_c_l330_c16_f147
BIN_OP_EQ_uxn_c_l330_c16_f147 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l330_c16_f147_left,
BIN_OP_EQ_uxn_c_l330_c16_f147_right,
BIN_OP_EQ_uxn_c_l330_c16_f147_return_output);

-- MUX_uxn_c_l330_c16_9b82
MUX_uxn_c_l330_c16_9b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l330_c16_9b82_cond,
MUX_uxn_c_l330_c16_9b82_iftrue,
MUX_uxn_c_l330_c16_9b82_iffalse,
MUX_uxn_c_l330_c16_9b82_return_output);

-- MUX_uxn_c_l332_c16_dc74
MUX_uxn_c_l332_c16_dc74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l332_c16_dc74_cond,
MUX_uxn_c_l332_c16_dc74_iftrue,
MUX_uxn_c_l332_c16_dc74_iffalse,
MUX_uxn_c_l332_c16_dc74_return_output);

-- BIN_OP_PLUS_uxn_c_l332_c3_57bf
BIN_OP_PLUS_uxn_c_l332_c3_57bf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l332_c3_57bf_left,
BIN_OP_PLUS_uxn_c_l332_c3_57bf_right,
BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output);

-- MUX_uxn_c_l333_c21_ba38
MUX_uxn_c_l333_c21_ba38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l333_c21_ba38_cond,
MUX_uxn_c_l333_c21_ba38_iftrue,
MUX_uxn_c_l333_c21_ba38_iffalse,
MUX_uxn_c_l333_c21_ba38_return_output);

-- UNARY_OP_NOT_uxn_c_l335_c14_3791
UNARY_OP_NOT_uxn_c_l335_c14_3791 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l335_c14_3791_expr,
UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output);

-- device_ram_address_MUX_uxn_c_l335_c9_0c74
device_ram_address_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l335_c9_0c74_cond,
device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue,
device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse,
device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output);

-- vram_write_layer_MUX_uxn_c_l335_c9_0c74
vram_write_layer_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond,
vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue,
vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse,
vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output);

-- ram_write_value_MUX_uxn_c_l335_c9_0c74
ram_write_value_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l335_c9_0c74_cond,
ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue,
ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse,
ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output);

-- is_ram_write_MUX_uxn_c_l335_c9_0c74
is_ram_write_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l335_c9_0c74_cond,
is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue,
is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse,
is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output);

-- is_device_ram_write_MUX_uxn_c_l335_c9_0c74
is_device_ram_write_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond,
is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue,
is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse,
is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output);

-- is_vram_write_MUX_uxn_c_l335_c9_0c74
is_vram_write_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l335_c9_0c74_cond,
is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue,
is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse,
is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output);

-- cpu_step_result_MUX_uxn_c_l335_c9_0c74
cpu_step_result_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond,
cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue,
cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse,
cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output);

-- u16_addr_MUX_uxn_c_l335_c9_0c74
u16_addr_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l335_c9_0c74_cond,
u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue,
u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse,
u16_addr_MUX_uxn_c_l335_c9_0c74_return_output);

-- vram_value_MUX_uxn_c_l335_c9_0c74
vram_value_MUX_uxn_c_l335_c9_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l335_c9_0c74_cond,
vram_value_MUX_uxn_c_l335_c9_0c74_iftrue,
vram_value_MUX_uxn_c_l335_c9_0c74_iffalse,
vram_value_MUX_uxn_c_l335_c9_0c74_return_output);

-- step_cpu_uxn_c_l336_c21_22ed
step_cpu_uxn_c_l336_c21_22ed : entity work.step_cpu_0CLK_cedd1265 port map (
clk,
step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE,
step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value,
step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read,
step_cpu_uxn_c_l336_c21_22ed_use_vector,
step_cpu_uxn_c_l336_c21_22ed_vector,
step_cpu_uxn_c_l336_c21_22ed_return_output);

-- main_ram_update_uxn_c_l347_c19_d3b8
main_ram_update_uxn_c_l347_c19_d3b8 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE,
main_ram_update_uxn_c_l347_c19_d3b8_ram_address,
main_ram_update_uxn_c_l347_c19_d3b8_value,
main_ram_update_uxn_c_l347_c19_d3b8_write_enable,
main_ram_update_uxn_c_l347_c19_d3b8_return_output);

-- device_ram_update_uxn_c_l353_c26_a5e5
device_ram_update_uxn_c_l353_c26_a5e5 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE,
device_ram_update_uxn_c_l353_c26_a5e5_device_address,
device_ram_update_uxn_c_l353_c26_a5e5_value,
device_ram_update_uxn_c_l353_c26_a5e5_write_enable,
device_ram_update_uxn_c_l353_c26_a5e5_return_output);

-- step_gpu_uxn_c_l359_c20_a79d
step_gpu_uxn_c_l359_c20_a79d : entity work.step_gpu_0CLK_7e56aace port map (
clk,
step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE,
step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area,
step_gpu_uxn_c_l359_c20_a79d_is_vram_write,
step_gpu_uxn_c_l359_c20_a79d_vram_write_layer,
step_gpu_uxn_c_l359_c20_a79d_vram_address,
step_gpu_uxn_c_l359_c20_a79d_vram_value,
step_gpu_uxn_c_l359_c20_a79d_return_output);

-- palette_snoop_uxn_c_l361_c20_d48a
palette_snoop_uxn_c_l361_c20_d48a : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE,
palette_snoop_uxn_c_l361_c20_d48a_device_ram_address,
palette_snoop_uxn_c_l361_c20_d48a_device_ram_value,
palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write,
palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color,
palette_snoop_uxn_c_l361_c20_d48a_return_output);

-- vector_snoop_uxn_c_l362_c18_e26a
vector_snoop_uxn_c_l362_c18_e26a : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE,
vector_snoop_uxn_c_l362_c18_e26a_device_ram_address,
vector_snoop_uxn_c_l362_c18_e26a_device_ram_value,
vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write,
vector_snoop_uxn_c_l362_c18_e26a_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output);



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
 UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output,
 boot_check_MUX_uxn_c_l319_c2_7636_return_output,
 device_ram_address_MUX_uxn_c_l319_c2_7636_return_output,
 vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output,
 ram_write_value_MUX_uxn_c_l319_c2_7636_return_output,
 is_ram_write_MUX_uxn_c_l319_c2_7636_return_output,
 is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output,
 is_vram_write_MUX_uxn_c_l319_c2_7636_return_output,
 cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output,
 u16_addr_MUX_uxn_c_l319_c2_7636_return_output,
 vram_value_MUX_uxn_c_l319_c2_7636_return_output,
 is_booted_MUX_uxn_c_l319_c2_7636_return_output,
 BIN_OP_GT_uxn_c_l329_c44_abae_return_output,
 BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output,
 MUX_uxn_c_l329_c44_5d96_return_output,
 MUX_uxn_c_l329_c16_324a_return_output,
 BIN_OP_EQ_uxn_c_l330_c16_f147_return_output,
 MUX_uxn_c_l330_c16_9b82_return_output,
 MUX_uxn_c_l332_c16_dc74_return_output,
 BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output,
 MUX_uxn_c_l333_c21_ba38_return_output,
 UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output,
 device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output,
 vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output,
 ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output,
 is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output,
 is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output,
 is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output,
 cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output,
 u16_addr_MUX_uxn_c_l335_c9_0c74_return_output,
 vram_value_MUX_uxn_c_l335_c9_0c74_return_output,
 step_cpu_uxn_c_l336_c21_22ed_return_output,
 main_ram_update_uxn_c_l347_c19_d3b8_return_output,
 device_ram_update_uxn_c_l353_c26_a5e5_return_output,
 step_gpu_uxn_c_l359_c20_a79d_return_output,
 palette_snoop_uxn_c_l361_c20_d48a_return_output,
 vector_snoop_uxn_c_l362_c18_e26a_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_7636_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l332_c3_0e9d : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_7636_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_0c74_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_7636_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_7636_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_7636_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_7636_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_7636_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_324a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_324a_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_324a_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_5d96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_abae_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_abae_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l329_c44_abae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_5d96_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_5d96_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l329_c44_5d96_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l329_c16_324a_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_9b82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_9b82_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_9b82_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l330_c16_9b82_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_dc74_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_dc74_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_dc74_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l332_c16_dc74_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_ba38_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_ba38_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_ba38_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l333_c21_ba38_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l335_c9_0c74_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_cad0_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l336_c21_22ed_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_02df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_006e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_7ebf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_451f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_b690_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_d3b8_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_d3b8_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_d3b8_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_d3b8_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_a5e5_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_a5e5_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_a5e5_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_a5e5_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_a79d_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_bb46_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_7933_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_d48a_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_e26a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l344_l341_DUPLICATE_3e2f_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l330_c16_9b82_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l333_c21_ba38_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l332_c16_dc74_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l329_c44_abae_right := to_unsigned(255, 16);
     VAR_MUX_uxn_c_l330_c16_9b82_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l332_c16_dc74_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l329_c16_324a_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l329_c44_5d96_iffalse := resize(to_unsigned(0, 1), 24);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l319_c2_7636_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l319_c2_7636_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l329_c16_324a_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l333_c21_ba38_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l336_c21_22ed_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l329_c44_abae_left := u16_addr;
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_left := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l319_c2_7636_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l319_c7_ccad] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr <= VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output := UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l336_c69_cad0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_cad0_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l335_c14_3791] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l335_c14_3791_expr <= VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output := UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;

     -- BIN_OP_GT[uxn_c_l329_c44_abae] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l329_c44_abae_left <= VAR_BIN_OP_GT_uxn_c_l329_c44_abae_left;
     BIN_OP_GT_uxn_c_l329_c44_abae_right <= VAR_BIN_OP_GT_uxn_c_l329_c44_abae_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l329_c44_abae_return_output := BIN_OP_GT_uxn_c_l329_c44_abae_return_output;

     -- BIN_OP_PLUS[uxn_c_l329_c65_3535] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l329_c65_3535_left <= VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_left;
     BIN_OP_PLUS_uxn_c_l329_c65_3535_right <= VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output := BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l329_c44_5d96_cond := VAR_BIN_OP_GT_uxn_c_l329_c44_abae_return_output;
     VAR_MUX_uxn_c_l329_c44_5d96_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l329_c65_3535_return_output, 24);
     VAR_step_cpu_uxn_c_l336_c21_22ed_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l336_c69_cad0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_is_booted_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_ccad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_vram_value_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond := VAR_UNARY_OP_NOT_uxn_c_l335_c14_3791_return_output;
     -- MUX[uxn_c_l329_c44_5d96] LATENCY=0
     -- Inputs
     MUX_uxn_c_l329_c44_5d96_cond <= VAR_MUX_uxn_c_l329_c44_5d96_cond;
     MUX_uxn_c_l329_c44_5d96_iftrue <= VAR_MUX_uxn_c_l329_c44_5d96_iftrue;
     MUX_uxn_c_l329_c44_5d96_iffalse <= VAR_MUX_uxn_c_l329_c44_5d96_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l329_c44_5d96_return_output := MUX_uxn_c_l329_c44_5d96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_MUX_uxn_c_l329_c16_324a_iffalse := VAR_MUX_uxn_c_l329_c44_5d96_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l335_c1_f90d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output;

     -- MUX[uxn_c_l329_c16_324a] LATENCY=0
     -- Inputs
     MUX_uxn_c_l329_c16_324a_cond <= VAR_MUX_uxn_c_l329_c16_324a_cond;
     MUX_uxn_c_l329_c16_324a_iftrue <= VAR_MUX_uxn_c_l329_c16_324a_iftrue;
     MUX_uxn_c_l329_c16_324a_iffalse <= VAR_MUX_uxn_c_l329_c16_324a_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l329_c16_324a_return_output := MUX_uxn_c_l329_c16_324a_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_left := VAR_MUX_uxn_c_l329_c16_324a_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_7636_iftrue := VAR_MUX_uxn_c_l329_c16_324a_return_output;
     VAR_step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l335_c1_f90d_return_output;
     -- step_cpu[uxn_c_l336_c21_22ed] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l336_c21_22ed_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value <= VAR_step_cpu_uxn_c_l336_c21_22ed_previous_ram_read_value;
     step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read <= VAR_step_cpu_uxn_c_l336_c21_22ed_previous_device_ram_read;
     step_cpu_uxn_c_l336_c21_22ed_use_vector <= VAR_step_cpu_uxn_c_l336_c21_22ed_use_vector;
     step_cpu_uxn_c_l336_c21_22ed_vector <= VAR_step_cpu_uxn_c_l336_c21_22ed_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l336_c21_22ed_return_output := step_cpu_uxn_c_l336_c21_22ed_return_output;

     -- BIN_OP_EQ[uxn_c_l330_c16_f147] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l330_c16_f147_left <= VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_left;
     BIN_OP_EQ_uxn_c_l330_c16_f147_right <= VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_return_output := BIN_OP_EQ_uxn_c_l330_c16_f147_return_output;

     -- boot_check_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l319_c2_7636_cond <= VAR_boot_check_MUX_uxn_c_l319_c2_7636_cond;
     boot_check_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_boot_check_MUX_uxn_c_l319_c2_7636_iftrue;
     boot_check_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_boot_check_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l319_c2_7636_return_output := boot_check_MUX_uxn_c_l319_c2_7636_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l330_c16_9b82_cond := VAR_BIN_OP_EQ_uxn_c_l330_c16_f147_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l337_c18_02df] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_02df_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.is_ram_write;

     -- MUX[uxn_c_l330_c16_9b82] LATENCY=0
     -- Inputs
     MUX_uxn_c_l330_c16_9b82_cond <= VAR_MUX_uxn_c_l330_c16_9b82_cond;
     MUX_uxn_c_l330_c16_9b82_iftrue <= VAR_MUX_uxn_c_l330_c16_9b82_iftrue;
     MUX_uxn_c_l330_c16_9b82_iffalse <= VAR_MUX_uxn_c_l330_c16_9b82_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l330_c16_9b82_return_output := MUX_uxn_c_l330_c16_9b82_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l342_c19_451f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_451f_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l339_c24_7ebf] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_7ebf_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l343_c22_b690] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_b690_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.vram_write_layer;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l338_c14_006e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_006e_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l340_c25_bc0e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_bc0e_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l344_l341_DUPLICATE_3e2f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l344_l341_DUPLICATE_3e2f_return_output := VAR_step_cpu_uxn_c_l336_c21_22ed_return_output.u8_value;

     -- cpu_step_result_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_cond;
     cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iftrue;
     cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output := cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l338_c14_006e_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l340_c25_bc0e_return_output;
     VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l337_c18_02df_return_output;
     VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l342_c19_451f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l343_c22_b690_return_output;
     VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l339_c24_7ebf_return_output;
     VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l344_l341_DUPLICATE_3e2f_return_output;
     VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l344_l341_DUPLICATE_3e2f_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right := VAR_MUX_uxn_c_l330_c16_9b82_return_output;
     VAR_MUX_uxn_c_l333_c21_ba38_cond := VAR_MUX_uxn_c_l330_c16_9b82_return_output;
     VAR_is_booted_MUX_uxn_c_l319_c2_7636_iftrue := VAR_MUX_uxn_c_l330_c16_9b82_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse := VAR_cpu_step_result_MUX_uxn_c_l335_c9_0c74_return_output;
     -- is_booted_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l319_c2_7636_cond <= VAR_is_booted_MUX_uxn_c_l319_c2_7636_cond;
     is_booted_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_is_booted_MUX_uxn_c_l319_c2_7636_iftrue;
     is_booted_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_is_booted_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l319_c2_7636_return_output := is_booted_MUX_uxn_c_l319_c2_7636_return_output;

     -- device_ram_address_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l335_c9_0c74_cond <= VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_cond;
     device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iftrue;
     device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output := device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output;

     -- is_ram_write_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l335_c9_0c74_cond <= VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_cond;
     is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue;
     is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output := is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output;

     -- is_device_ram_write_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_cond;
     is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iftrue;
     is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output := is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output;

     -- is_vram_write_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l335_c9_0c74_cond <= VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_cond;
     is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iftrue;
     is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output := is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output;

     -- u16_addr_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l335_c9_0c74_cond <= VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_cond;
     u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iftrue;
     u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_return_output := u16_addr_MUX_uxn_c_l335_c9_0c74_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output;

     -- vram_value_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l335_c9_0c74_cond <= VAR_vram_value_MUX_uxn_c_l335_c9_0c74_cond;
     vram_value_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iftrue;
     vram_value_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_vram_value_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l335_c9_0c74_return_output := vram_value_MUX_uxn_c_l335_c9_0c74_return_output;

     -- cpu_step_result_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l319_c2_7636_cond <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_cond;
     cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iftrue;
     cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output := cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output;

     -- MUX[uxn_c_l333_c21_ba38] LATENCY=0
     -- Inputs
     MUX_uxn_c_l333_c21_ba38_cond <= VAR_MUX_uxn_c_l333_c21_ba38_cond;
     MUX_uxn_c_l333_c21_ba38_iftrue <= VAR_MUX_uxn_c_l333_c21_ba38_iftrue;
     MUX_uxn_c_l333_c21_ba38_iffalse <= VAR_MUX_uxn_c_l333_c21_ba38_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l333_c21_ba38_return_output := MUX_uxn_c_l333_c21_ba38_return_output;

     -- ram_write_value_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l335_c9_0c74_cond <= VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_cond;
     ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iftrue;
     ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output := ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output;

     -- vram_write_layer_MUX[uxn_c_l335_c9_0c74] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_cond;
     vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iftrue;
     vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output := vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l332_c16_dc74_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l332_l331_DUPLICATE_2850_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue := VAR_MUX_uxn_c_l333_c21_ba38_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse := VAR_device_ram_address_MUX_uxn_c_l335_c9_0c74_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse := VAR_is_ram_write_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse := VAR_is_vram_write_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse := VAR_ram_write_value_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iffalse := VAR_u16_addr_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_7636_iffalse := VAR_vram_value_MUX_uxn_c_l335_c9_0c74_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse := VAR_vram_write_layer_MUX_uxn_c_l335_c9_0c74_return_output;
     -- is_ram_write_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l319_c2_7636_cond <= VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_cond;
     is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iftrue;
     is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_return_output := is_ram_write_MUX_uxn_c_l319_c2_7636_return_output;

     -- device_ram_address_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l319_c2_7636_cond <= VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_cond;
     device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iftrue;
     device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output := device_ram_address_MUX_uxn_c_l319_c2_7636_return_output;

     -- vram_write_layer_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l319_c2_7636_cond <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_cond;
     vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iftrue;
     vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output := vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output;

     -- is_device_ram_write_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_cond;
     is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iftrue;
     is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output := is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output;

     -- is_vram_write_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l319_c2_7636_cond <= VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_cond;
     is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iftrue;
     is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_return_output := is_vram_write_MUX_uxn_c_l319_c2_7636_return_output;

     -- vram_value_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l319_c2_7636_cond <= VAR_vram_value_MUX_uxn_c_l319_c2_7636_cond;
     vram_value_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_vram_value_MUX_uxn_c_l319_c2_7636_iftrue;
     vram_value_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_vram_value_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l319_c2_7636_return_output := vram_value_MUX_uxn_c_l319_c2_7636_return_output;

     -- MUX[uxn_c_l332_c16_dc74] LATENCY=0
     -- Inputs
     MUX_uxn_c_l332_c16_dc74_cond <= VAR_MUX_uxn_c_l332_c16_dc74_cond;
     MUX_uxn_c_l332_c16_dc74_iftrue <= VAR_MUX_uxn_c_l332_c16_dc74_iftrue;
     MUX_uxn_c_l332_c16_dc74_iffalse <= VAR_MUX_uxn_c_l332_c16_dc74_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l332_c16_dc74_return_output := MUX_uxn_c_l332_c16_dc74_return_output;

     -- ram_write_value_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l319_c2_7636_cond <= VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_cond;
     ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iftrue;
     ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output := ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_right := VAR_MUX_uxn_c_l332_c16_dc74_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_a5e5_device_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_a5e5_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_d3b8_write_enable := VAR_is_ram_write_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_step_gpu_uxn_c_l359_c20_a79d_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_a5e5_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_d3b8_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_step_gpu_uxn_c_l359_c20_a79d_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_step_gpu_uxn_c_l359_c20_a79d_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_7636_return_output;
     -- device_ram_update[uxn_c_l353_c26_a5e5] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l353_c26_a5e5_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l353_c26_a5e5_device_address <= VAR_device_ram_update_uxn_c_l353_c26_a5e5_device_address;
     device_ram_update_uxn_c_l353_c26_a5e5_value <= VAR_device_ram_update_uxn_c_l353_c26_a5e5_value;
     device_ram_update_uxn_c_l353_c26_a5e5_write_enable <= VAR_device_ram_update_uxn_c_l353_c26_a5e5_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l353_c26_a5e5_return_output := device_ram_update_uxn_c_l353_c26_a5e5_return_output;

     -- vector_snoop[uxn_c_l362_c18_e26a] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l362_c18_e26a_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l362_c18_e26a_device_ram_address <= VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_address;
     vector_snoop_uxn_c_l362_c18_e26a_device_ram_value <= VAR_vector_snoop_uxn_c_l362_c18_e26a_device_ram_value;
     vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write <= VAR_vector_snoop_uxn_c_l362_c18_e26a_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l362_c18_e26a_return_output := vector_snoop_uxn_c_l362_c18_e26a_return_output;

     -- BIN_OP_PLUS[uxn_c_l332_c3_57bf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l332_c3_57bf_left <= VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_left;
     BIN_OP_PLUS_uxn_c_l332_c3_57bf_right <= VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output := BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output;

     -- Submodule level 8
     VAR_u16_addr_uxn_c_l332_c3_0e9d := resize(VAR_BIN_OP_PLUS_uxn_c_l332_c3_57bf_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l353_c26_a5e5_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l362_c18_e26a_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iftrue := VAR_u16_addr_uxn_c_l332_c3_0e9d;
     -- u16_addr_MUX[uxn_c_l319_c2_7636] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l319_c2_7636_cond <= VAR_u16_addr_MUX_uxn_c_l319_c2_7636_cond;
     u16_addr_MUX_uxn_c_l319_c2_7636_iftrue <= VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iftrue;
     u16_addr_MUX_uxn_c_l319_c2_7636_iffalse <= VAR_u16_addr_MUX_uxn_c_l319_c2_7636_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l319_c2_7636_return_output := u16_addr_MUX_uxn_c_l319_c2_7636_return_output;

     -- Submodule level 9
     VAR_main_ram_update_uxn_c_l347_c19_d3b8_ram_address := VAR_u16_addr_MUX_uxn_c_l319_c2_7636_return_output;
     VAR_step_gpu_uxn_c_l359_c20_a79d_vram_address := VAR_u16_addr_MUX_uxn_c_l319_c2_7636_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l319_c2_7636_return_output;
     -- main_ram_update[uxn_c_l347_c19_d3b8] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l347_c19_d3b8_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l347_c19_d3b8_ram_address <= VAR_main_ram_update_uxn_c_l347_c19_d3b8_ram_address;
     main_ram_update_uxn_c_l347_c19_d3b8_value <= VAR_main_ram_update_uxn_c_l347_c19_d3b8_value;
     main_ram_update_uxn_c_l347_c19_d3b8_write_enable <= VAR_main_ram_update_uxn_c_l347_c19_d3b8_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l347_c19_d3b8_return_output := main_ram_update_uxn_c_l347_c19_d3b8_return_output;

     -- step_gpu[uxn_c_l359_c20_a79d] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l359_c20_a79d_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area <= VAR_step_gpu_uxn_c_l359_c20_a79d_is_active_drawing_area;
     step_gpu_uxn_c_l359_c20_a79d_is_vram_write <= VAR_step_gpu_uxn_c_l359_c20_a79d_is_vram_write;
     step_gpu_uxn_c_l359_c20_a79d_vram_write_layer <= VAR_step_gpu_uxn_c_l359_c20_a79d_vram_write_layer;
     step_gpu_uxn_c_l359_c20_a79d_vram_address <= VAR_step_gpu_uxn_c_l359_c20_a79d_vram_address;
     step_gpu_uxn_c_l359_c20_a79d_vram_value <= VAR_step_gpu_uxn_c_l359_c20_a79d_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l359_c20_a79d_return_output := step_gpu_uxn_c_l359_c20_a79d_return_output;

     -- Submodule level 10
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l347_c19_d3b8_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l359_c20_a79d_return_output;
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l360_c19_bb46] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_bb46_return_output := VAR_step_gpu_uxn_c_l359_c20_a79d_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l361_c92_7933] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_7933_return_output := VAR_step_gpu_uxn_c_l359_c20_a79d_return_output.color;

     -- Submodule level 11
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_bb46_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_7933_return_output;
     -- palette_snoop[uxn_c_l361_c20_d48a] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l361_c20_d48a_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l361_c20_d48a_device_ram_address <= VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_address;
     palette_snoop_uxn_c_l361_c20_d48a_device_ram_value <= VAR_palette_snoop_uxn_c_l361_c20_d48a_device_ram_value;
     palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write <= VAR_palette_snoop_uxn_c_l361_c20_d48a_is_device_ram_write;
     palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color <= VAR_palette_snoop_uxn_c_l361_c20_d48a_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l361_c20_d48a_return_output := palette_snoop_uxn_c_l361_c20_d48a_return_output;

     -- Submodule level 12
     VAR_return_output := VAR_palette_snoop_uxn_c_l361_c20_d48a_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l361_c20_d48a_return_output;
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
