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
entity uxn_top_0CLK_dd8c04b0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 code : in unsigned(3 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_dd8c04b0;
architecture arch of uxn_top_0CLK_dd8c04b0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal main_clock_cycle : unsigned(31 downto 0) := to_unsigned(0, 32);
signal boot_check : unsigned(23 downto 0) := to_unsigned(0, 24);
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal gpu_step_result : gpu_step_result_t := gpu_step_result_t_NULL;
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ram_address : unsigned(15 downto 0) := to_unsigned(255, 16);
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
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
signal REG_COMB_boot_check : unsigned(23 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_screen_vector : unsigned(15 downto 0);
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
-- UNARY_OP_NOT[uxn_c_l322_c7_4b30]
signal UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l334_c9_8ba4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l322_c2_0406]
signal is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l322_c2_0406]
signal ram_write_value_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l322_c2_0406_return_output : unsigned(7 downto 0);

-- boot_check_MUX[uxn_c_l322_c2_0406]
signal boot_check_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l322_c2_0406_return_output : unsigned(23 downto 0);

-- is_ram_write_MUX[uxn_c_l322_c2_0406]
signal is_ram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l322_c2_0406]
signal device_ram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l322_c2_0406]
signal vram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(31 downto 0);

-- is_vram_write_MUX[uxn_c_l322_c2_0406]
signal is_vram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l322_c2_0406]
signal ram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(15 downto 0);

-- vram_write_layer_MUX[uxn_c_l322_c2_0406]
signal vram_write_layer_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l322_c2_0406]
signal vram_value_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l322_c2_0406_return_output : unsigned(1 downto 0);

-- is_booted_MUX[uxn_c_l322_c2_0406]
signal is_booted_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l324_c18_5d2b]
signal MUX_uxn_c_l324_c18_5d2b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c18_5d2b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c18_5d2b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c18_5d2b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l324_c3_1db0]
signal BIN_OP_PLUS_uxn_c_l324_c3_1db0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l324_c3_1db0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l325_c44_e4b2]
signal BIN_OP_GT_uxn_c_l325_c44_e4b2_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l325_c44_e4b2_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l325_c68_f968]
signal BIN_OP_PLUS_uxn_c_l325_c68_f968_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l325_c68_f968_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l325_c44_d786]
signal MUX_uxn_c_l325_c44_d786_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l325_c44_d786_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l325_c44_d786_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l325_c44_d786_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l325_c16_3dbd]
signal MUX_uxn_c_l325_c16_3dbd_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l325_c16_3dbd_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l325_c16_3dbd_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l325_c16_3dbd_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l327_c16_2dd7]
signal BIN_OP_EQ_uxn_c_l327_c16_2dd7_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c16_2dd7_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l327_c16_02a8]
signal MUX_uxn_c_l327_c16_02a8_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l327_c16_02a8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l327_c16_02a8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l327_c16_02a8_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l334_c14_0f88]
signal UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l334_c1_1b14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l334_c9_8ba4]
signal is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l334_c9_8ba4]
signal ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l334_c9_8ba4]
signal is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l334_c9_8ba4]
signal device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l334_c9_8ba4]
signal vram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(31 downto 0);

-- is_vram_write_MUX[uxn_c_l334_c9_8ba4]
signal is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l334_c9_8ba4]
signal ram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(15 downto 0);

-- vram_write_layer_MUX[uxn_c_l334_c9_8ba4]
signal vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l334_c9_8ba4]
signal vram_value_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(1 downto 0);

-- step_cpu[uxn_c_l335_c39_c496]
signal step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l335_c39_c496_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l335_c39_c496_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l335_c39_c496_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l347_c19_5a9c]
signal main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_5a9c_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l347_c19_5a9c_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l347_c19_5a9c_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l347_c19_5a9c_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l353_c26_52c6]
signal device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_52c6_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_52c6_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l353_c26_52c6_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l353_c26_52c6_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l359_c20_9681]
signal step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l359_c20_9681_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l361_c20_a88a]
signal palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_a88a_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_a88a_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l361_c20_a88a_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l362_c18_5212]
signal vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_5212_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_5212_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l362_c18_5212_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l364_c2_99d5]
signal BIN_OP_PLUS_uxn_c_l364_c2_99d5_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l364_c2_99d5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l322_c7_4b30
UNARY_OP_NOT_uxn_c_l322_c7_4b30 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr,
UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4
FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output);

-- is_device_ram_write_MUX_uxn_c_l322_c2_0406
is_device_ram_write_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond,
is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue,
is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse,
is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output);

-- ram_write_value_MUX_uxn_c_l322_c2_0406
ram_write_value_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l322_c2_0406_cond,
ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue,
ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse,
ram_write_value_MUX_uxn_c_l322_c2_0406_return_output);

-- boot_check_MUX_uxn_c_l322_c2_0406
boot_check_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l322_c2_0406_cond,
boot_check_MUX_uxn_c_l322_c2_0406_iftrue,
boot_check_MUX_uxn_c_l322_c2_0406_iffalse,
boot_check_MUX_uxn_c_l322_c2_0406_return_output);

-- is_ram_write_MUX_uxn_c_l322_c2_0406
is_ram_write_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l322_c2_0406_cond,
is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue,
is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse,
is_ram_write_MUX_uxn_c_l322_c2_0406_return_output);

-- device_ram_address_MUX_uxn_c_l322_c2_0406
device_ram_address_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l322_c2_0406_cond,
device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue,
device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse,
device_ram_address_MUX_uxn_c_l322_c2_0406_return_output);

-- vram_address_MUX_uxn_c_l322_c2_0406
vram_address_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l322_c2_0406_cond,
vram_address_MUX_uxn_c_l322_c2_0406_iftrue,
vram_address_MUX_uxn_c_l322_c2_0406_iffalse,
vram_address_MUX_uxn_c_l322_c2_0406_return_output);

-- is_vram_write_MUX_uxn_c_l322_c2_0406
is_vram_write_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l322_c2_0406_cond,
is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue,
is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse,
is_vram_write_MUX_uxn_c_l322_c2_0406_return_output);

-- ram_address_MUX_uxn_c_l322_c2_0406
ram_address_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l322_c2_0406_cond,
ram_address_MUX_uxn_c_l322_c2_0406_iftrue,
ram_address_MUX_uxn_c_l322_c2_0406_iffalse,
ram_address_MUX_uxn_c_l322_c2_0406_return_output);

-- vram_write_layer_MUX_uxn_c_l322_c2_0406
vram_write_layer_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l322_c2_0406_cond,
vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue,
vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse,
vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output);

-- vram_value_MUX_uxn_c_l322_c2_0406
vram_value_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l322_c2_0406_cond,
vram_value_MUX_uxn_c_l322_c2_0406_iftrue,
vram_value_MUX_uxn_c_l322_c2_0406_iffalse,
vram_value_MUX_uxn_c_l322_c2_0406_return_output);

-- is_booted_MUX_uxn_c_l322_c2_0406
is_booted_MUX_uxn_c_l322_c2_0406 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l322_c2_0406_cond,
is_booted_MUX_uxn_c_l322_c2_0406_iftrue,
is_booted_MUX_uxn_c_l322_c2_0406_iffalse,
is_booted_MUX_uxn_c_l322_c2_0406_return_output);

-- MUX_uxn_c_l324_c18_5d2b
MUX_uxn_c_l324_c18_5d2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l324_c18_5d2b_cond,
MUX_uxn_c_l324_c18_5d2b_iftrue,
MUX_uxn_c_l324_c18_5d2b_iffalse,
MUX_uxn_c_l324_c18_5d2b_return_output);

-- BIN_OP_PLUS_uxn_c_l324_c3_1db0
BIN_OP_PLUS_uxn_c_l324_c3_1db0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l324_c3_1db0_left,
BIN_OP_PLUS_uxn_c_l324_c3_1db0_right,
BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output);

-- BIN_OP_GT_uxn_c_l325_c44_e4b2
BIN_OP_GT_uxn_c_l325_c44_e4b2 : entity work.BIN_OP_GT_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l325_c44_e4b2_left,
BIN_OP_GT_uxn_c_l325_c44_e4b2_right,
BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output);

-- BIN_OP_PLUS_uxn_c_l325_c68_f968
BIN_OP_PLUS_uxn_c_l325_c68_f968 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l325_c68_f968_left,
BIN_OP_PLUS_uxn_c_l325_c68_f968_right,
BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output);

-- MUX_uxn_c_l325_c44_d786
MUX_uxn_c_l325_c44_d786 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l325_c44_d786_cond,
MUX_uxn_c_l325_c44_d786_iftrue,
MUX_uxn_c_l325_c44_d786_iffalse,
MUX_uxn_c_l325_c44_d786_return_output);

-- MUX_uxn_c_l325_c16_3dbd
MUX_uxn_c_l325_c16_3dbd : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l325_c16_3dbd_cond,
MUX_uxn_c_l325_c16_3dbd_iftrue,
MUX_uxn_c_l325_c16_3dbd_iffalse,
MUX_uxn_c_l325_c16_3dbd_return_output);

-- BIN_OP_EQ_uxn_c_l327_c16_2dd7
BIN_OP_EQ_uxn_c_l327_c16_2dd7 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l327_c16_2dd7_left,
BIN_OP_EQ_uxn_c_l327_c16_2dd7_right,
BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output);

-- MUX_uxn_c_l327_c16_02a8
MUX_uxn_c_l327_c16_02a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l327_c16_02a8_cond,
MUX_uxn_c_l327_c16_02a8_iftrue,
MUX_uxn_c_l327_c16_02a8_iffalse,
MUX_uxn_c_l327_c16_02a8_return_output);

-- UNARY_OP_NOT_uxn_c_l334_c14_0f88
UNARY_OP_NOT_uxn_c_l334_c14_0f88 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr,
UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14
TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output);

-- is_device_ram_write_MUX_uxn_c_l334_c9_8ba4
is_device_ram_write_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond,
is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue,
is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse,
is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output);

-- ram_write_value_MUX_uxn_c_l334_c9_8ba4
ram_write_value_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond,
ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue,
ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse,
ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output);

-- is_ram_write_MUX_uxn_c_l334_c9_8ba4
is_ram_write_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond,
is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue,
is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse,
is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output);

-- device_ram_address_MUX_uxn_c_l334_c9_8ba4
device_ram_address_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond,
device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue,
device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse,
device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output);

-- vram_address_MUX_uxn_c_l334_c9_8ba4
vram_address_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l334_c9_8ba4_cond,
vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue,
vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse,
vram_address_MUX_uxn_c_l334_c9_8ba4_return_output);

-- is_vram_write_MUX_uxn_c_l334_c9_8ba4
is_vram_write_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond,
is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue,
is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse,
is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output);

-- ram_address_MUX_uxn_c_l334_c9_8ba4
ram_address_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l334_c9_8ba4_cond,
ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue,
ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse,
ram_address_MUX_uxn_c_l334_c9_8ba4_return_output);

-- vram_write_layer_MUX_uxn_c_l334_c9_8ba4
vram_write_layer_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond,
vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue,
vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse,
vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output);

-- vram_value_MUX_uxn_c_l334_c9_8ba4
vram_value_MUX_uxn_c_l334_c9_8ba4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l334_c9_8ba4_cond,
vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue,
vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse,
vram_value_MUX_uxn_c_l334_c9_8ba4_return_output);

-- step_cpu_uxn_c_l335_c39_c496
step_cpu_uxn_c_l335_c39_c496 : entity work.step_cpu_0CLK_d7034f8b port map (
clk,
step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE,
step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value,
step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read,
step_cpu_uxn_c_l335_c39_c496_use_vector,
step_cpu_uxn_c_l335_c39_c496_vector,
step_cpu_uxn_c_l335_c39_c496_return_output);

-- main_ram_update_uxn_c_l347_c19_5a9c
main_ram_update_uxn_c_l347_c19_5a9c : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE,
main_ram_update_uxn_c_l347_c19_5a9c_ram_address,
main_ram_update_uxn_c_l347_c19_5a9c_value,
main_ram_update_uxn_c_l347_c19_5a9c_write_enable,
main_ram_update_uxn_c_l347_c19_5a9c_return_output);

-- device_ram_update_uxn_c_l353_c26_52c6
device_ram_update_uxn_c_l353_c26_52c6 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE,
device_ram_update_uxn_c_l353_c26_52c6_device_address,
device_ram_update_uxn_c_l353_c26_52c6_value,
device_ram_update_uxn_c_l353_c26_52c6_write_enable,
device_ram_update_uxn_c_l353_c26_52c6_return_output);

-- step_gpu_uxn_c_l359_c20_9681
step_gpu_uxn_c_l359_c20_9681 : entity work.step_gpu_0CLK_1bb9c0ed port map (
clk,
step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE,
step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area,
step_gpu_uxn_c_l359_c20_9681_is_vram_write,
step_gpu_uxn_c_l359_c20_9681_vram_write_layer,
step_gpu_uxn_c_l359_c20_9681_vram_address,
step_gpu_uxn_c_l359_c20_9681_vram_value,
step_gpu_uxn_c_l359_c20_9681_return_output);

-- palette_snoop_uxn_c_l361_c20_a88a
palette_snoop_uxn_c_l361_c20_a88a : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE,
palette_snoop_uxn_c_l361_c20_a88a_device_ram_address,
palette_snoop_uxn_c_l361_c20_a88a_device_ram_value,
palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write,
palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color,
palette_snoop_uxn_c_l361_c20_a88a_return_output);

-- vector_snoop_uxn_c_l362_c18_5212
vector_snoop_uxn_c_l362_c18_5212 : entity work.vector_snoop_0CLK_9d359dd9 port map (
clk,
vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE,
vector_snoop_uxn_c_l362_c18_5212_device_ram_address,
vector_snoop_uxn_c_l362_c18_5212_device_ram_value,
vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write,
vector_snoop_uxn_c_l362_c18_5212_return_output);

-- BIN_OP_PLUS_uxn_c_l364_c2_99d5
BIN_OP_PLUS_uxn_c_l364_c2_99d5 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l364_c2_99d5_left,
BIN_OP_PLUS_uxn_c_l364_c2_99d5_right,
BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 code,
 is_visible_pixel,
 rom_load_valid_byte,
 rom_load_address,
 rom_load_value,
 -- Registers
 main_clock_cycle,
 boot_check,
 uxn_eval_result,
 is_booted,
 gpu_step_result,
 is_active_fill,
 is_ram_write,
 ram_address,
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
 UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output,
 is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output,
 ram_write_value_MUX_uxn_c_l322_c2_0406_return_output,
 boot_check_MUX_uxn_c_l322_c2_0406_return_output,
 is_ram_write_MUX_uxn_c_l322_c2_0406_return_output,
 device_ram_address_MUX_uxn_c_l322_c2_0406_return_output,
 vram_address_MUX_uxn_c_l322_c2_0406_return_output,
 is_vram_write_MUX_uxn_c_l322_c2_0406_return_output,
 ram_address_MUX_uxn_c_l322_c2_0406_return_output,
 vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output,
 vram_value_MUX_uxn_c_l322_c2_0406_return_output,
 is_booted_MUX_uxn_c_l322_c2_0406_return_output,
 MUX_uxn_c_l324_c18_5d2b_return_output,
 BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output,
 BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output,
 BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output,
 MUX_uxn_c_l325_c44_d786_return_output,
 MUX_uxn_c_l325_c16_3dbd_return_output,
 BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output,
 MUX_uxn_c_l327_c16_02a8_return_output,
 UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output,
 is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output,
 ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output,
 is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output,
 device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output,
 vram_address_MUX_uxn_c_l334_c9_8ba4_return_output,
 is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output,
 ram_address_MUX_uxn_c_l334_c9_8ba4_return_output,
 vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output,
 vram_value_MUX_uxn_c_l334_c9_8ba4_return_output,
 step_cpu_uxn_c_l335_c39_c496_return_output,
 main_ram_update_uxn_c_l347_c19_5a9c_return_output,
 device_ram_update_uxn_c_l353_c26_52c6_return_output,
 step_gpu_uxn_c_l359_c20_9681_return_output,
 palette_snoop_uxn_c_l361_c20_a88a_return_output,
 vector_snoop_uxn_c_l362_c18_5212_return_output,
 BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_code : unsigned(3 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l322_c2_0406_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l324_c3_1b92 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l322_c2_0406_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l322_c2_0406_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l322_c2_0406_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l322_c2_0406_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l322_c2_0406_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l322_c2_0406_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l324_c18_5d2b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c18_5d2b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c18_5d2b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c18_5d2b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l325_c16_3dbd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l325_c16_3dbd_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l325_c16_3dbd_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l325_c44_d786_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l325_c44_d786_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l325_c44_d786_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l325_c44_d786_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l325_c16_3dbd_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_02a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_02a8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_02a8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l327_c16_02a8_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l335_c39_c496_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l335_c39_c496_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l335_c87_aa4c_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l335_c39_c496_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l336_c18_ba64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l337_c17_297b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l338_c24_06eb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l339_c25_79b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l341_c19_3de3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l342_c22_dd1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l343_c18_2bcd_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l344_c16_ed17_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_5a9c_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_5a9c_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_5a9c_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l347_c19_5a9c_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_52c6_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_52c6_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_52c6_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l353_c26_52c6_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l359_c20_9681_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_5f15_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_e3eb_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l361_c20_a88a_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l362_c18_5212_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l364_c2_1f3b : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l340_l344_DUPLICATE_4770_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_screen_vector : unsigned(15 downto 0);
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
  REG_VAR_boot_check := boot_check;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_booted := is_booted;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_ram_address := ram_address;
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
     VAR_MUX_uxn_c_l325_c44_d786_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l324_c18_5d2b_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l325_c16_3dbd_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_right := to_unsigned(16777215, 24);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l324_c18_5d2b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l327_c16_02a8_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l327_c16_02a8_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_code := code;
     VAR_is_visible_pixel := is_visible_pixel;
     VAR_rom_load_valid_byte := rom_load_valid_byte;
     VAR_rom_load_address := rom_load_address;
     VAR_rom_load_value := rom_load_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l322_c2_0406_iffalse := boot_check;
     VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l322_c2_0406_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_left := main_clock_cycle;
     VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse := ram_write_value;
     VAR_MUX_uxn_c_l324_c18_5d2b_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l325_c16_3dbd_cond := VAR_rom_load_valid_byte;
     VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue := VAR_rom_load_valid_byte;
     VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l335_c39_c496_vector := screen_vector;
     VAR_vram_address_MUX_uxn_c_l322_c2_0406_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l322_c2_0406_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l334_c14_0f88] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr <= VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output := UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;

     -- BIN_OP_PLUS[uxn_c_l325_c68_f968] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l325_c68_f968_left <= VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_left;
     BIN_OP_PLUS_uxn_c_l325_c68_f968_right <= VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output := BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output;

     -- BIN_OP_PLUS[uxn_c_l364_c2_99d5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l364_c2_99d5_left <= VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_left;
     BIN_OP_PLUS_uxn_c_l364_c2_99d5_right <= VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output := BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l335_c87_aa4c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l335_c87_aa4c_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l322_c7_4b30] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr <= VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output := UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;

     -- MUX[uxn_c_l324_c18_5d2b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l324_c18_5d2b_cond <= VAR_MUX_uxn_c_l324_c18_5d2b_cond;
     MUX_uxn_c_l324_c18_5d2b_iftrue <= VAR_MUX_uxn_c_l324_c18_5d2b_iftrue;
     MUX_uxn_c_l324_c18_5d2b_iffalse <= VAR_MUX_uxn_c_l324_c18_5d2b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l324_c18_5d2b_return_output := MUX_uxn_c_l324_c18_5d2b_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l325_c44_d786_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l325_c68_f968_return_output, 24);
     VAR_main_clock_cycle_uxn_c_l364_c2_1f3b := resize(VAR_BIN_OP_PLUS_uxn_c_l364_c2_99d5_return_output, 32);
     VAR_step_cpu_uxn_c_l335_c39_c496_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l335_c87_aa4c_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_right := VAR_MUX_uxn_c_l324_c18_5d2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_boot_check_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_is_booted_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_ram_address_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_vram_address_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_vram_value_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_cond := VAR_UNARY_OP_NOT_uxn_c_l322_c7_4b30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond := VAR_UNARY_OP_NOT_uxn_c_l334_c14_0f88_return_output;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l364_c2_1f3b;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- BIN_OP_PLUS[uxn_c_l324_c3_1db0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l324_c3_1db0_left <= VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_left;
     BIN_OP_PLUS_uxn_c_l324_c3_1db0_right <= VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output := BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output;

     -- Submodule level 2
     VAR_ram_address_uxn_c_l324_c3_1b92 := resize(VAR_BIN_OP_PLUS_uxn_c_l324_c3_1db0_return_output, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_left := VAR_ram_address_uxn_c_l324_c3_1b92;
     VAR_ram_address_MUX_uxn_c_l322_c2_0406_iftrue := VAR_ram_address_uxn_c_l324_c3_1b92;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l334_c1_1b14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output;

     -- BIN_OP_GT[uxn_c_l325_c44_e4b2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l325_c44_e4b2_left <= VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_left;
     BIN_OP_GT_uxn_c_l325_c44_e4b2_right <= VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output := BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l325_c44_d786_cond := VAR_BIN_OP_GT_uxn_c_l325_c44_e4b2_return_output;
     VAR_step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l334_c1_1b14_return_output;
     -- step_cpu[uxn_c_l335_c39_c496] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l335_c39_c496_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value <= VAR_step_cpu_uxn_c_l335_c39_c496_previous_ram_read_value;
     step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read <= VAR_step_cpu_uxn_c_l335_c39_c496_previous_device_ram_read;
     step_cpu_uxn_c_l335_c39_c496_use_vector <= VAR_step_cpu_uxn_c_l335_c39_c496_use_vector;
     step_cpu_uxn_c_l335_c39_c496_vector <= VAR_step_cpu_uxn_c_l335_c39_c496_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l335_c39_c496_return_output := step_cpu_uxn_c_l335_c39_c496_return_output;

     -- MUX[uxn_c_l325_c44_d786] LATENCY=0
     -- Inputs
     MUX_uxn_c_l325_c44_d786_cond <= VAR_MUX_uxn_c_l325_c44_d786_cond;
     MUX_uxn_c_l325_c44_d786_iftrue <= VAR_MUX_uxn_c_l325_c44_d786_iftrue;
     MUX_uxn_c_l325_c44_d786_iffalse <= VAR_MUX_uxn_c_l325_c44_d786_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l325_c44_d786_return_output := MUX_uxn_c_l325_c44_d786_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l325_c16_3dbd_iffalse := VAR_MUX_uxn_c_l325_c44_d786_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l342_c22_dd1b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l342_c22_dd1b_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l341_c19_3de3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l341_c19_3de3_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.is_vram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l340_l344_DUPLICATE_4770 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l340_l344_DUPLICATE_4770_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l337_c17_297b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l337_c17_297b_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.ram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l338_c24_06eb] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l338_c24_06eb_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l339_c25_79b5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l339_c25_79b5_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l343_c18_2bcd] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l343_c18_2bcd_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.vram_address;

     -- MUX[uxn_c_l325_c16_3dbd] LATENCY=0
     -- Inputs
     MUX_uxn_c_l325_c16_3dbd_cond <= VAR_MUX_uxn_c_l325_c16_3dbd_cond;
     MUX_uxn_c_l325_c16_3dbd_iftrue <= VAR_MUX_uxn_c_l325_c16_3dbd_iftrue;
     MUX_uxn_c_l325_c16_3dbd_iffalse <= VAR_MUX_uxn_c_l325_c16_3dbd_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l325_c16_3dbd_return_output := MUX_uxn_c_l325_c16_3dbd_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l336_c18_ba64] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l336_c18_ba64_return_output := VAR_step_cpu_uxn_c_l335_c39_c496_return_output.is_ram_write;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l337_c17_297b_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l339_c25_79b5_return_output;
     VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l336_c18_ba64_return_output;
     VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l341_c19_3de3_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l342_c22_dd1b_return_output;
     VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l343_c18_2bcd_return_output;
     VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l338_c24_06eb_return_output;
     VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l340_l344_DUPLICATE_4770_return_output;
     VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_left := VAR_MUX_uxn_c_l325_c16_3dbd_return_output;
     VAR_boot_check_MUX_uxn_c_l322_c2_0406_iftrue := VAR_MUX_uxn_c_l325_c16_3dbd_return_output;
     -- vram_address_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_cond;
     vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iftrue;
     vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_return_output := vram_address_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- is_device_ram_write_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_cond;
     is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue;
     is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output := is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- is_ram_write_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_cond;
     is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iftrue;
     is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output := is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- device_ram_address_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_cond;
     device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue;
     device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output := device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- BIN_OP_EQ[uxn_c_l327_c16_2dd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l327_c16_2dd7_left <= VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_left;
     BIN_OP_EQ_uxn_c_l327_c16_2dd7_right <= VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output := BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output;

     -- vram_write_layer_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_cond;
     vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iftrue;
     vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output := vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- CAST_TO_uint2_t[uxn_c_l344_c16_ed17] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l344_c16_ed17_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l340_l344_DUPLICATE_4770_return_output);

     -- ram_address_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_cond;
     ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iftrue;
     ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output := ram_address_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- boot_check_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l322_c2_0406_cond <= VAR_boot_check_MUX_uxn_c_l322_c2_0406_cond;
     boot_check_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_boot_check_MUX_uxn_c_l322_c2_0406_iftrue;
     boot_check_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_boot_check_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l322_c2_0406_return_output := boot_check_MUX_uxn_c_l322_c2_0406_return_output;

     -- is_vram_write_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_cond;
     is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iftrue;
     is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output := is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- ram_write_value_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_cond;
     ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iftrue;
     ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output := ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l327_c16_02a8_cond := VAR_BIN_OP_EQ_uxn_c_l327_c16_2dd7_return_output;
     VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l344_c16_ed17_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse := VAR_device_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse := VAR_is_ram_write_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse := VAR_is_vram_write_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_ram_address_MUX_uxn_c_l322_c2_0406_iffalse := VAR_ram_address_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse := VAR_ram_write_value_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_vram_address_MUX_uxn_c_l322_c2_0406_iffalse := VAR_vram_address_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse := VAR_vram_write_layer_MUX_uxn_c_l334_c9_8ba4_return_output;
     -- is_vram_write_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l322_c2_0406_cond <= VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_cond;
     is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iftrue;
     is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_return_output := is_vram_write_MUX_uxn_c_l322_c2_0406_return_output;

     -- is_device_ram_write_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond <= VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_cond;
     is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iftrue;
     is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output := is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output;

     -- MUX[uxn_c_l327_c16_02a8] LATENCY=0
     -- Inputs
     MUX_uxn_c_l327_c16_02a8_cond <= VAR_MUX_uxn_c_l327_c16_02a8_cond;
     MUX_uxn_c_l327_c16_02a8_iftrue <= VAR_MUX_uxn_c_l327_c16_02a8_iftrue;
     MUX_uxn_c_l327_c16_02a8_iffalse <= VAR_MUX_uxn_c_l327_c16_02a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l327_c16_02a8_return_output := MUX_uxn_c_l327_c16_02a8_return_output;

     -- vram_value_MUX[uxn_c_l334_c9_8ba4] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l334_c9_8ba4_cond <= VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_cond;
     vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue <= VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iftrue;
     vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse <= VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_return_output := vram_value_MUX_uxn_c_l334_c9_8ba4_return_output;

     -- is_ram_write_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l322_c2_0406_cond <= VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_cond;
     is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iftrue;
     is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_return_output := is_ram_write_MUX_uxn_c_l322_c2_0406_return_output;

     -- device_ram_address_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l322_c2_0406_cond <= VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_cond;
     device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iftrue;
     device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output := device_ram_address_MUX_uxn_c_l322_c2_0406_return_output;

     -- ram_address_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l322_c2_0406_cond <= VAR_ram_address_MUX_uxn_c_l322_c2_0406_cond;
     ram_address_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_ram_address_MUX_uxn_c_l322_c2_0406_iftrue;
     ram_address_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_ram_address_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l322_c2_0406_return_output := ram_address_MUX_uxn_c_l322_c2_0406_return_output;

     -- ram_write_value_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l322_c2_0406_cond <= VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_cond;
     ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iftrue;
     ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output := ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;

     -- vram_write_layer_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l322_c2_0406_cond <= VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_cond;
     vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iftrue;
     vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output := vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output;

     -- vram_address_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l322_c2_0406_cond <= VAR_vram_address_MUX_uxn_c_l322_c2_0406_cond;
     vram_address_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_vram_address_MUX_uxn_c_l322_c2_0406_iftrue;
     vram_address_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_vram_address_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l322_c2_0406_return_output := vram_address_MUX_uxn_c_l322_c2_0406_return_output;

     -- Submodule level 7
     VAR_is_booted_MUX_uxn_c_l322_c2_0406_iftrue := VAR_MUX_uxn_c_l327_c16_02a8_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_52c6_device_address := VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_52c6_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_5a9c_write_enable := VAR_is_ram_write_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_step_gpu_uxn_c_l359_c20_9681_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_5a9c_ram_address := VAR_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_device_ram_update_uxn_c_l353_c26_52c6_value := VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_main_ram_update_uxn_c_l347_c19_5a9c_value := VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_step_gpu_uxn_c_l359_c20_9681_vram_address := VAR_vram_address_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l322_c2_0406_return_output;
     VAR_vram_value_MUX_uxn_c_l322_c2_0406_iffalse := VAR_vram_value_MUX_uxn_c_l334_c9_8ba4_return_output;
     VAR_step_gpu_uxn_c_l359_c20_9681_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l322_c2_0406_return_output;
     -- vram_value_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l322_c2_0406_cond <= VAR_vram_value_MUX_uxn_c_l322_c2_0406_cond;
     vram_value_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_vram_value_MUX_uxn_c_l322_c2_0406_iftrue;
     vram_value_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_vram_value_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l322_c2_0406_return_output := vram_value_MUX_uxn_c_l322_c2_0406_return_output;

     -- device_ram_update[uxn_c_l353_c26_52c6] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l353_c26_52c6_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l353_c26_52c6_device_address <= VAR_device_ram_update_uxn_c_l353_c26_52c6_device_address;
     device_ram_update_uxn_c_l353_c26_52c6_value <= VAR_device_ram_update_uxn_c_l353_c26_52c6_value;
     device_ram_update_uxn_c_l353_c26_52c6_write_enable <= VAR_device_ram_update_uxn_c_l353_c26_52c6_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l353_c26_52c6_return_output := device_ram_update_uxn_c_l353_c26_52c6_return_output;

     -- is_booted_MUX[uxn_c_l322_c2_0406] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l322_c2_0406_cond <= VAR_is_booted_MUX_uxn_c_l322_c2_0406_cond;
     is_booted_MUX_uxn_c_l322_c2_0406_iftrue <= VAR_is_booted_MUX_uxn_c_l322_c2_0406_iftrue;
     is_booted_MUX_uxn_c_l322_c2_0406_iffalse <= VAR_is_booted_MUX_uxn_c_l322_c2_0406_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l322_c2_0406_return_output := is_booted_MUX_uxn_c_l322_c2_0406_return_output;

     -- vector_snoop[uxn_c_l362_c18_5212] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l362_c18_5212_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l362_c18_5212_device_ram_address <= VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_address;
     vector_snoop_uxn_c_l362_c18_5212_device_ram_value <= VAR_vector_snoop_uxn_c_l362_c18_5212_device_ram_value;
     vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write <= VAR_vector_snoop_uxn_c_l362_c18_5212_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l362_c18_5212_return_output := vector_snoop_uxn_c_l362_c18_5212_return_output;

     -- main_ram_update[uxn_c_l347_c19_5a9c] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l347_c19_5a9c_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l347_c19_5a9c_ram_address <= VAR_main_ram_update_uxn_c_l347_c19_5a9c_ram_address;
     main_ram_update_uxn_c_l347_c19_5a9c_value <= VAR_main_ram_update_uxn_c_l347_c19_5a9c_value;
     main_ram_update_uxn_c_l347_c19_5a9c_write_enable <= VAR_main_ram_update_uxn_c_l347_c19_5a9c_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l347_c19_5a9c_return_output := main_ram_update_uxn_c_l347_c19_5a9c_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l353_c26_52c6_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l347_c19_5a9c_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l362_c18_5212_return_output;
     VAR_step_gpu_uxn_c_l359_c20_9681_vram_value := VAR_vram_value_MUX_uxn_c_l322_c2_0406_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l322_c2_0406_return_output;
     -- step_gpu[uxn_c_l359_c20_9681] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l359_c20_9681_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area <= VAR_step_gpu_uxn_c_l359_c20_9681_is_active_drawing_area;
     step_gpu_uxn_c_l359_c20_9681_is_vram_write <= VAR_step_gpu_uxn_c_l359_c20_9681_is_vram_write;
     step_gpu_uxn_c_l359_c20_9681_vram_write_layer <= VAR_step_gpu_uxn_c_l359_c20_9681_vram_write_layer;
     step_gpu_uxn_c_l359_c20_9681_vram_address <= VAR_step_gpu_uxn_c_l359_c20_9681_vram_address;
     step_gpu_uxn_c_l359_c20_9681_vram_value <= VAR_step_gpu_uxn_c_l359_c20_9681_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l359_c20_9681_return_output := step_gpu_uxn_c_l359_c20_9681_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l359_c20_9681_return_output;
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l360_c19_5f15] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_5f15_return_output := VAR_step_gpu_uxn_c_l359_c20_9681_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l361_c92_e3eb] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_e3eb_return_output := VAR_step_gpu_uxn_c_l359_c20_9681_return_output.color;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l360_c19_5f15_return_output;
     VAR_palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l361_c92_e3eb_return_output;
     -- palette_snoop[uxn_c_l361_c20_a88a] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l361_c20_a88a_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l361_c20_a88a_device_ram_address <= VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_address;
     palette_snoop_uxn_c_l361_c20_a88a_device_ram_value <= VAR_palette_snoop_uxn_c_l361_c20_a88a_device_ram_value;
     palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write <= VAR_palette_snoop_uxn_c_l361_c20_a88a_is_device_ram_write;
     palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color <= VAR_palette_snoop_uxn_c_l361_c20_a88a_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l361_c20_a88a_return_output := palette_snoop_uxn_c_l361_c20_a88a_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l361_c20_a88a_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l361_c20_a88a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_main_clock_cycle <= REG_VAR_main_clock_cycle;
REG_COMB_boot_check <= REG_VAR_boot_check;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_gpu_step_result <= REG_VAR_gpu_step_result;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_ram_address <= REG_VAR_ram_address;
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
     main_clock_cycle <= REG_COMB_main_clock_cycle;
     boot_check <= REG_COMB_boot_check;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     is_booted <= REG_COMB_is_booted;
     gpu_step_result <= REG_COMB_gpu_step_result;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     ram_address <= REG_COMB_ram_address;
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
