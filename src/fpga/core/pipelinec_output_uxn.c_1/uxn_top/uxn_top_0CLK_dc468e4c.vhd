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
entity uxn_top_0CLK_dc468e4c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_dc468e4c;
architecture arch of uxn_top_0CLK_dc468e4c is
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
-- UNARY_OP_NOT[uxn_c_l304_c7_ce65]
signal UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l319_c9_1fe2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l304_c2_e8dd]
signal vram_value_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);

-- boot_check_MUX[uxn_c_l304_c2_e8dd]
signal boot_check_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(23 downto 0);

-- vram_write_layer_MUX[uxn_c_l304_c2_e8dd]
signal vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l304_c2_e8dd]
signal ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);

-- is_booted_MUX[uxn_c_l304_c2_e8dd]
signal is_booted_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l304_c2_e8dd]
signal device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l304_c2_e8dd]
signal is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l304_c2_e8dd]
signal cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l304_c2_e8dd]
signal u16_addr_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(15 downto 0);

-- is_device_ram_write_MUX[uxn_c_l304_c2_e8dd]
signal is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l304_c2_e8dd]
signal is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_c_l313_c44_c830]
signal BIN_OP_GT_uxn_c_l313_c44_c830_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l313_c44_c830_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l313_c44_c830_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l313_c65_415f]
signal BIN_OP_PLUS_uxn_c_l313_c65_415f_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l313_c65_415f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l313_c44_6896]
signal MUX_uxn_c_l313_c44_6896_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l313_c44_6896_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l313_c44_6896_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l313_c44_6896_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l313_c16_46ef]
signal MUX_uxn_c_l313_c16_46ef_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l313_c16_46ef_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l313_c16_46ef_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l313_c16_46ef_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l314_c16_5a31]
signal BIN_OP_EQ_uxn_c_l314_c16_5a31_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l314_c16_5a31_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l314_c16_bdad]
signal MUX_uxn_c_l314_c16_bdad_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_bdad_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_bdad_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l314_c16_bdad_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l316_c16_9920]
signal MUX_uxn_c_l316_c16_9920_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l316_c16_9920_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l316_c16_9920_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l316_c16_9920_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l316_c3_c6e0]
signal BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l317_c21_7ae9]
signal MUX_uxn_c_l317_c21_7ae9_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l317_c21_7ae9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l317_c21_7ae9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l317_c21_7ae9_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_c_l319_c14_3b8f]
signal UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l319_c1_cef7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l319_c9_1fe2]
signal vram_value_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l319_c9_1fe2]
signal vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l319_c9_1fe2]
signal ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);

-- device_ram_address_MUX[uxn_c_l319_c9_1fe2]
signal device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l319_c9_1fe2]
signal is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l319_c9_1fe2]
signal cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output : cpu_step_result_t;

-- u16_addr_MUX[uxn_c_l319_c9_1fe2]
signal u16_addr_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(15 downto 0);

-- is_device_ram_write_MUX[uxn_c_l319_c9_1fe2]
signal is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l319_c9_1fe2]
signal is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l320_c21_c1a5]
signal step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l320_c21_c1a5_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l320_c21_c1a5_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l320_c21_c1a5_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l331_c19_e2b9]
signal main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l331_c19_e2b9_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l331_c19_e2b9_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l331_c19_e2b9_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l331_c19_e2b9_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l337_c26_6192]
signal device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l337_c26_6192_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l337_c26_6192_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l337_c26_6192_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l337_c26_6192_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l343_c20_9a53]
signal step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l343_c20_9a53_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l345_c20_d2a4]
signal palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l345_c20_d2a4_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l346_c18_5311]
signal vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l346_c18_5311_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l346_c18_5311_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l346_c18_5311_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l304_c7_ce65
UNARY_OP_NOT_uxn_c_l304_c7_ce65 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr,
UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2
FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output);

-- vram_value_MUX_uxn_c_l304_c2_e8dd
vram_value_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l304_c2_e8dd_cond,
vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue,
vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse,
vram_value_MUX_uxn_c_l304_c2_e8dd_return_output);

-- boot_check_MUX_uxn_c_l304_c2_e8dd
boot_check_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l304_c2_e8dd_cond,
boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue,
boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse,
boot_check_MUX_uxn_c_l304_c2_e8dd_return_output);

-- vram_write_layer_MUX_uxn_c_l304_c2_e8dd
vram_write_layer_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond,
vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue,
vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse,
vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output);

-- ram_write_value_MUX_uxn_c_l304_c2_e8dd
ram_write_value_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond,
ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue,
ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse,
ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output);

-- is_booted_MUX_uxn_c_l304_c2_e8dd
is_booted_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l304_c2_e8dd_cond,
is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue,
is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse,
is_booted_MUX_uxn_c_l304_c2_e8dd_return_output);

-- device_ram_address_MUX_uxn_c_l304_c2_e8dd
device_ram_address_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond,
device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue,
device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse,
device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output);

-- is_ram_write_MUX_uxn_c_l304_c2_e8dd
is_ram_write_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond,
is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue,
is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse,
is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output);

-- cpu_step_result_MUX_uxn_c_l304_c2_e8dd
cpu_step_result_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond,
cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue,
cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse,
cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output);

-- u16_addr_MUX_uxn_c_l304_c2_e8dd
u16_addr_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l304_c2_e8dd_cond,
u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue,
u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse,
u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output);

-- is_device_ram_write_MUX_uxn_c_l304_c2_e8dd
is_device_ram_write_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond,
is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue,
is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse,
is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output);

-- is_vram_write_MUX_uxn_c_l304_c2_e8dd
is_vram_write_MUX_uxn_c_l304_c2_e8dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond,
is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue,
is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse,
is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output);

-- BIN_OP_GT_uxn_c_l313_c44_c830
BIN_OP_GT_uxn_c_l313_c44_c830 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l313_c44_c830_left,
BIN_OP_GT_uxn_c_l313_c44_c830_right,
BIN_OP_GT_uxn_c_l313_c44_c830_return_output);

-- BIN_OP_PLUS_uxn_c_l313_c65_415f
BIN_OP_PLUS_uxn_c_l313_c65_415f : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l313_c65_415f_left,
BIN_OP_PLUS_uxn_c_l313_c65_415f_right,
BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output);

-- MUX_uxn_c_l313_c44_6896
MUX_uxn_c_l313_c44_6896 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l313_c44_6896_cond,
MUX_uxn_c_l313_c44_6896_iftrue,
MUX_uxn_c_l313_c44_6896_iffalse,
MUX_uxn_c_l313_c44_6896_return_output);

-- MUX_uxn_c_l313_c16_46ef
MUX_uxn_c_l313_c16_46ef : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l313_c16_46ef_cond,
MUX_uxn_c_l313_c16_46ef_iftrue,
MUX_uxn_c_l313_c16_46ef_iffalse,
MUX_uxn_c_l313_c16_46ef_return_output);

-- BIN_OP_EQ_uxn_c_l314_c16_5a31
BIN_OP_EQ_uxn_c_l314_c16_5a31 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l314_c16_5a31_left,
BIN_OP_EQ_uxn_c_l314_c16_5a31_right,
BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output);

-- MUX_uxn_c_l314_c16_bdad
MUX_uxn_c_l314_c16_bdad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l314_c16_bdad_cond,
MUX_uxn_c_l314_c16_bdad_iftrue,
MUX_uxn_c_l314_c16_bdad_iffalse,
MUX_uxn_c_l314_c16_bdad_return_output);

-- MUX_uxn_c_l316_c16_9920
MUX_uxn_c_l316_c16_9920 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l316_c16_9920_cond,
MUX_uxn_c_l316_c16_9920_iftrue,
MUX_uxn_c_l316_c16_9920_iffalse,
MUX_uxn_c_l316_c16_9920_return_output);

-- BIN_OP_PLUS_uxn_c_l316_c3_c6e0
BIN_OP_PLUS_uxn_c_l316_c3_c6e0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left,
BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right,
BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output);

-- MUX_uxn_c_l317_c21_7ae9
MUX_uxn_c_l317_c21_7ae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l317_c21_7ae9_cond,
MUX_uxn_c_l317_c21_7ae9_iftrue,
MUX_uxn_c_l317_c21_7ae9_iffalse,
MUX_uxn_c_l317_c21_7ae9_return_output);

-- UNARY_OP_NOT_uxn_c_l319_c14_3b8f
UNARY_OP_NOT_uxn_c_l319_c14_3b8f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr,
UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7
TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output);

-- vram_value_MUX_uxn_c_l319_c9_1fe2
vram_value_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l319_c9_1fe2_cond,
vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue,
vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse,
vram_value_MUX_uxn_c_l319_c9_1fe2_return_output);

-- vram_write_layer_MUX_uxn_c_l319_c9_1fe2
vram_write_layer_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond,
vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue,
vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse,
vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output);

-- ram_write_value_MUX_uxn_c_l319_c9_1fe2
ram_write_value_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond,
ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue,
ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse,
ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output);

-- device_ram_address_MUX_uxn_c_l319_c9_1fe2
device_ram_address_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond,
device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue,
device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse,
device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output);

-- is_ram_write_MUX_uxn_c_l319_c9_1fe2
is_ram_write_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond,
is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue,
is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse,
is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output);

-- cpu_step_result_MUX_uxn_c_l319_c9_1fe2
cpu_step_result_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond,
cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue,
cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse,
cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output);

-- u16_addr_MUX_uxn_c_l319_c9_1fe2
u16_addr_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l319_c9_1fe2_cond,
u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue,
u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse,
u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output);

-- is_device_ram_write_MUX_uxn_c_l319_c9_1fe2
is_device_ram_write_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond,
is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue,
is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse,
is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output);

-- is_vram_write_MUX_uxn_c_l319_c9_1fe2
is_vram_write_MUX_uxn_c_l319_c9_1fe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond,
is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue,
is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse,
is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output);

-- step_cpu_uxn_c_l320_c21_c1a5
step_cpu_uxn_c_l320_c21_c1a5 : entity work.step_cpu_0CLK_d875878c port map (
clk,
step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE,
step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value,
step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read,
step_cpu_uxn_c_l320_c21_c1a5_use_vector,
step_cpu_uxn_c_l320_c21_c1a5_vector,
step_cpu_uxn_c_l320_c21_c1a5_return_output);

-- main_ram_update_uxn_c_l331_c19_e2b9
main_ram_update_uxn_c_l331_c19_e2b9 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE,
main_ram_update_uxn_c_l331_c19_e2b9_ram_address,
main_ram_update_uxn_c_l331_c19_e2b9_value,
main_ram_update_uxn_c_l331_c19_e2b9_write_enable,
main_ram_update_uxn_c_l331_c19_e2b9_return_output);

-- device_ram_update_uxn_c_l337_c26_6192
device_ram_update_uxn_c_l337_c26_6192 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE,
device_ram_update_uxn_c_l337_c26_6192_device_address,
device_ram_update_uxn_c_l337_c26_6192_value,
device_ram_update_uxn_c_l337_c26_6192_write_enable,
device_ram_update_uxn_c_l337_c26_6192_return_output);

-- step_gpu_uxn_c_l343_c20_9a53
step_gpu_uxn_c_l343_c20_9a53 : entity work.step_gpu_0CLK_b75124c5 port map (
clk,
step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE,
step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area,
step_gpu_uxn_c_l343_c20_9a53_is_vram_write,
step_gpu_uxn_c_l343_c20_9a53_vram_write_layer,
step_gpu_uxn_c_l343_c20_9a53_vram_address,
step_gpu_uxn_c_l343_c20_9a53_vram_value,
step_gpu_uxn_c_l343_c20_9a53_return_output);

-- palette_snoop_uxn_c_l345_c20_d2a4
palette_snoop_uxn_c_l345_c20_d2a4 : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE,
palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address,
palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value,
palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write,
palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color,
palette_snoop_uxn_c_l345_c20_d2a4_return_output);

-- vector_snoop_uxn_c_l346_c18_5311
vector_snoop_uxn_c_l346_c18_5311 : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE,
vector_snoop_uxn_c_l346_c18_5311_device_ram_address,
vector_snoop_uxn_c_l346_c18_5311_device_ram_value,
vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write,
vector_snoop_uxn_c_l346_c18_5311_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output);



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
 UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output,
 vram_value_MUX_uxn_c_l304_c2_e8dd_return_output,
 boot_check_MUX_uxn_c_l304_c2_e8dd_return_output,
 vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output,
 ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output,
 is_booted_MUX_uxn_c_l304_c2_e8dd_return_output,
 device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output,
 is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output,
 cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output,
 u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output,
 is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output,
 is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output,
 BIN_OP_GT_uxn_c_l313_c44_c830_return_output,
 BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output,
 MUX_uxn_c_l313_c44_6896_return_output,
 MUX_uxn_c_l313_c16_46ef_return_output,
 BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output,
 MUX_uxn_c_l314_c16_bdad_return_output,
 MUX_uxn_c_l316_c16_9920_return_output,
 BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output,
 MUX_uxn_c_l317_c21_7ae9_return_output,
 UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output,
 vram_value_MUX_uxn_c_l319_c9_1fe2_return_output,
 vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output,
 ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output,
 device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output,
 is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output,
 cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output,
 u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output,
 is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output,
 is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output,
 step_cpu_uxn_c_l320_c21_c1a5_return_output,
 main_ram_update_uxn_c_l331_c19_e2b9_return_output,
 device_ram_update_uxn_c_l337_c26_6192_return_output,
 step_gpu_uxn_c_l343_c20_9a53_return_output,
 palette_snoop_uxn_c_l345_c20_d2a4_return_output,
 vector_snoop_uxn_c_l346_c18_5311_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l316_c3_5210 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l313_c16_46ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l313_c16_46ef_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l313_c16_46ef_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l313_c44_6896_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l313_c44_c830_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l313_c44_c830_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l313_c44_c830_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l313_c44_6896_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l313_c44_6896_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l313_c44_6896_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l313_c16_46ef_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_bdad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_bdad_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_bdad_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l314_c16_bdad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l316_c16_9920_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l316_c16_9920_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l316_c16_9920_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l316_c16_9920_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l317_c21_7ae9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l317_c21_7ae9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l317_c21_7ae9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l317_c21_7ae9_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l320_c69_1fc3_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l321_c18_8684_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l322_c14_157f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l323_c24_dab8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l324_c25_352c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l326_c19_548a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l327_c22_a791_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l331_c19_e2b9_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l331_c19_e2b9_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l331_c19_e2b9_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l331_c19_e2b9_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l337_c26_6192_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l337_c26_6192_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l337_c26_6192_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l337_c26_6192_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l343_c20_9a53_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l344_c19_161f_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l345_c92_17fd_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l345_c20_d2a4_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l346_c18_5311_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l325_l328_DUPLICATE_d28d_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l314_c16_bdad_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l316_c16_9920_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l313_c16_46ef_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_right := to_unsigned(16777215, 24);
     VAR_BIN_OP_GT_uxn_c_l313_c44_c830_right := to_unsigned(255, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l314_c16_bdad_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l313_c44_6896_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l316_c16_9920_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l317_c21_7ae9_iftrue := resize(to_unsigned(0, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse := is_vram_write;
     VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse := ram_write_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l313_c16_46ef_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l317_c21_7ae9_iffalse := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l320_c21_c1a5_vector := screen_vector;
     VAR_BIN_OP_GT_uxn_c_l313_c44_c830_left := u16_addr;
     VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left := u16_addr;
     VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse := u16_addr;
     VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse := vram_write_layer;
     -- UNARY_OP_NOT[uxn_c_l304_c7_ce65] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr <= VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output := UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;

     -- BIN_OP_PLUS[uxn_c_l313_c65_415f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l313_c65_415f_left <= VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_left;
     BIN_OP_PLUS_uxn_c_l313_c65_415f_right <= VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output := BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output;

     -- UNARY_OP_NOT[uxn_c_l319_c14_3b8f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr <= VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output := UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l320_c69_1fc3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l320_c69_1fc3_return_output := gpu_step_result.is_new_frame;

     -- BIN_OP_GT[uxn_c_l313_c44_c830] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l313_c44_c830_left <= VAR_BIN_OP_GT_uxn_c_l313_c44_c830_left;
     BIN_OP_GT_uxn_c_l313_c44_c830_right <= VAR_BIN_OP_GT_uxn_c_l313_c44_c830_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l313_c44_c830_return_output := BIN_OP_GT_uxn_c_l313_c44_c830_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l313_c44_6896_cond := VAR_BIN_OP_GT_uxn_c_l313_c44_c830_return_output;
     VAR_MUX_uxn_c_l313_c44_6896_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l313_c65_415f_return_output, 24);
     VAR_step_cpu_uxn_c_l320_c21_c1a5_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l320_c69_1fc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond := VAR_UNARY_OP_NOT_uxn_c_l304_c7_ce65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c14_3b8f_return_output;
     -- MUX[uxn_c_l313_c44_6896] LATENCY=0
     -- Inputs
     MUX_uxn_c_l313_c44_6896_cond <= VAR_MUX_uxn_c_l313_c44_6896_cond;
     MUX_uxn_c_l313_c44_6896_iftrue <= VAR_MUX_uxn_c_l313_c44_6896_iftrue;
     MUX_uxn_c_l313_c44_6896_iffalse <= VAR_MUX_uxn_c_l313_c44_6896_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l313_c44_6896_return_output := MUX_uxn_c_l313_c44_6896_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_MUX_uxn_c_l313_c16_46ef_iffalse := VAR_MUX_uxn_c_l313_c44_6896_return_output;
     -- MUX[uxn_c_l313_c16_46ef] LATENCY=0
     -- Inputs
     MUX_uxn_c_l313_c16_46ef_cond <= VAR_MUX_uxn_c_l313_c16_46ef_cond;
     MUX_uxn_c_l313_c16_46ef_iftrue <= VAR_MUX_uxn_c_l313_c16_46ef_iftrue;
     MUX_uxn_c_l313_c16_46ef_iffalse <= VAR_MUX_uxn_c_l313_c16_46ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l313_c16_46ef_return_output := MUX_uxn_c_l313_c16_46ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l319_c1_cef7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output;

     -- Submodule level 3
     VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_left := VAR_MUX_uxn_c_l313_c16_46ef_return_output;
     VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue := VAR_MUX_uxn_c_l313_c16_46ef_return_output;
     VAR_step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l319_c1_cef7_return_output;
     -- BIN_OP_EQ[uxn_c_l314_c16_5a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l314_c16_5a31_left <= VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_left;
     BIN_OP_EQ_uxn_c_l314_c16_5a31_right <= VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output := BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output;

     -- step_cpu[uxn_c_l320_c21_c1a5] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l320_c21_c1a5_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value <= VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_ram_read_value;
     step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read <= VAR_step_cpu_uxn_c_l320_c21_c1a5_previous_device_ram_read;
     step_cpu_uxn_c_l320_c21_c1a5_use_vector <= VAR_step_cpu_uxn_c_l320_c21_c1a5_use_vector;
     step_cpu_uxn_c_l320_c21_c1a5_vector <= VAR_step_cpu_uxn_c_l320_c21_c1a5_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output := step_cpu_uxn_c_l320_c21_c1a5_return_output;

     -- boot_check_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_cond;
     boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iftrue;
     boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_return_output := boot_check_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l314_c16_bdad_cond := VAR_BIN_OP_EQ_uxn_c_l314_c16_5a31_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output;
     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l325_l328_DUPLICATE_d28d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l325_l328_DUPLICATE_d28d_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.u8_value;

     -- cpu_step_result_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_cond;
     cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iftrue;
     cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output := cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l327_c22_a791] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l327_c22_a791_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l326_c19_548a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l326_c19_548a_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.is_vram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l322_c14_157f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l322_c14_157f_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.u16_addr;

     -- MUX[uxn_c_l314_c16_bdad] LATENCY=0
     -- Inputs
     MUX_uxn_c_l314_c16_bdad_cond <= VAR_MUX_uxn_c_l314_c16_bdad_cond;
     MUX_uxn_c_l314_c16_bdad_iftrue <= VAR_MUX_uxn_c_l314_c16_bdad_iftrue;
     MUX_uxn_c_l314_c16_bdad_iffalse <= VAR_MUX_uxn_c_l314_c16_bdad_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l314_c16_bdad_return_output := MUX_uxn_c_l314_c16_bdad_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l324_c25_352c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l324_c25_352c_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l321_c18_8684] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l321_c18_8684_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l323_c24_dab8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l323_c24_dab8_return_output := VAR_step_cpu_uxn_c_l320_c21_c1a5_return_output.device_ram_address;

     -- Submodule level 5
     VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l322_c14_157f_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l324_c25_352c_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l321_c18_8684_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l326_c19_548a_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l327_c22_a791_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l323_c24_dab8_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l325_l328_DUPLICATE_d28d_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l325_l328_DUPLICATE_d28d_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right := VAR_MUX_uxn_c_l314_c16_bdad_return_output;
     VAR_MUX_uxn_c_l317_c21_7ae9_cond := VAR_MUX_uxn_c_l314_c16_bdad_return_output;
     VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue := VAR_MUX_uxn_c_l314_c16_bdad_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_cpu_step_result_MUX_uxn_c_l319_c9_1fe2_return_output;
     -- u16_addr_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_cond;
     u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iftrue;
     u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output := u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- cpu_step_result_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_cond;
     cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iftrue;
     cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output := cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- vram_write_layer_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_cond;
     vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iftrue;
     vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output := vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output;

     -- MUX[uxn_c_l317_c21_7ae9] LATENCY=0
     -- Inputs
     MUX_uxn_c_l317_c21_7ae9_cond <= VAR_MUX_uxn_c_l317_c21_7ae9_cond;
     MUX_uxn_c_l317_c21_7ae9_iftrue <= VAR_MUX_uxn_c_l317_c21_7ae9_iftrue;
     MUX_uxn_c_l317_c21_7ae9_iffalse <= VAR_MUX_uxn_c_l317_c21_7ae9_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l317_c21_7ae9_return_output := MUX_uxn_c_l317_c21_7ae9_return_output;

     -- is_ram_write_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_cond;
     is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue;
     is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output := is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- vram_value_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_cond;
     vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iftrue;
     vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_return_output := vram_value_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- is_device_ram_write_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_cond;
     is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iftrue;
     is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output := is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- is_booted_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_cond;
     is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iftrue;
     is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_return_output := is_booted_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- ram_write_value_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_cond;
     ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iftrue;
     ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output := ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- device_ram_address_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_cond;
     device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iftrue;
     device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output := device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- is_vram_write_MUX[uxn_c_l319_c9_1fe2] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond <= VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_cond;
     is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue <= VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iftrue;
     is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse <= VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output := is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l316_c16_9920_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output;
     VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l316_l315_DUPLICATE_eb78_return_output;
     VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue := VAR_MUX_uxn_c_l317_c21_7ae9_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_device_ram_address_MUX_uxn_c_l319_c9_1fe2_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_is_ram_write_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_is_vram_write_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_ram_write_value_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_u16_addr_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_vram_value_MUX_uxn_c_l319_c9_1fe2_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse := VAR_vram_write_layer_MUX_uxn_c_l319_c9_1fe2_return_output;
     -- is_ram_write_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_cond;
     is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue;
     is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output := is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- MUX[uxn_c_l316_c16_9920] LATENCY=0
     -- Inputs
     MUX_uxn_c_l316_c16_9920_cond <= VAR_MUX_uxn_c_l316_c16_9920_cond;
     MUX_uxn_c_l316_c16_9920_iftrue <= VAR_MUX_uxn_c_l316_c16_9920_iftrue;
     MUX_uxn_c_l316_c16_9920_iffalse <= VAR_MUX_uxn_c_l316_c16_9920_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l316_c16_9920_return_output := MUX_uxn_c_l316_c16_9920_return_output;

     -- is_device_ram_write_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_cond;
     is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iftrue;
     is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output := is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- vram_write_layer_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_cond;
     vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iftrue;
     vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output := vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- vram_value_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_cond;
     vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iftrue;
     vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_return_output := vram_value_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- device_ram_address_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_cond;
     device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iftrue;
     device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output := device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- ram_write_value_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_cond;
     ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iftrue;
     ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output := ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- is_vram_write_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_cond;
     is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iftrue;
     is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output := is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- Submodule level 7
     VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right := VAR_MUX_uxn_c_l316_c16_9920_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_device_ram_update_uxn_c_l337_c26_6192_device_address := VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_device_ram_update_uxn_c_l337_c26_6192_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_main_ram_update_uxn_c_l331_c19_e2b9_write_enable := VAR_is_ram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_step_gpu_uxn_c_l343_c20_9a53_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_device_ram_update_uxn_c_l337_c26_6192_value := VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_main_ram_update_uxn_c_l331_c19_e2b9_value := VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_step_gpu_uxn_c_l343_c20_9a53_vram_value := VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_step_gpu_uxn_c_l343_c20_9a53_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l304_c2_e8dd_return_output;
     -- vector_snoop[uxn_c_l346_c18_5311] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l346_c18_5311_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l346_c18_5311_device_ram_address <= VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_address;
     vector_snoop_uxn_c_l346_c18_5311_device_ram_value <= VAR_vector_snoop_uxn_c_l346_c18_5311_device_ram_value;
     vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write <= VAR_vector_snoop_uxn_c_l346_c18_5311_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l346_c18_5311_return_output := vector_snoop_uxn_c_l346_c18_5311_return_output;

     -- BIN_OP_PLUS[uxn_c_l316_c3_c6e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left <= VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_left;
     BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right <= VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output := BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output;

     -- device_ram_update[uxn_c_l337_c26_6192] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l337_c26_6192_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l337_c26_6192_device_address <= VAR_device_ram_update_uxn_c_l337_c26_6192_device_address;
     device_ram_update_uxn_c_l337_c26_6192_value <= VAR_device_ram_update_uxn_c_l337_c26_6192_value;
     device_ram_update_uxn_c_l337_c26_6192_write_enable <= VAR_device_ram_update_uxn_c_l337_c26_6192_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l337_c26_6192_return_output := device_ram_update_uxn_c_l337_c26_6192_return_output;

     -- Submodule level 8
     VAR_u16_addr_uxn_c_l316_c3_5210 := resize(VAR_BIN_OP_PLUS_uxn_c_l316_c3_c6e0_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l337_c26_6192_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l346_c18_5311_return_output;
     VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue := VAR_u16_addr_uxn_c_l316_c3_5210;
     -- u16_addr_MUX[uxn_c_l304_c2_e8dd] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l304_c2_e8dd_cond <= VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_cond;
     u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue <= VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iftrue;
     u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse <= VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output := u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output;

     -- Submodule level 9
     VAR_main_ram_update_uxn_c_l331_c19_e2b9_ram_address := VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output;
     VAR_step_gpu_uxn_c_l343_c20_9a53_vram_address := VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l304_c2_e8dd_return_output;
     -- main_ram_update[uxn_c_l331_c19_e2b9] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l331_c19_e2b9_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l331_c19_e2b9_ram_address <= VAR_main_ram_update_uxn_c_l331_c19_e2b9_ram_address;
     main_ram_update_uxn_c_l331_c19_e2b9_value <= VAR_main_ram_update_uxn_c_l331_c19_e2b9_value;
     main_ram_update_uxn_c_l331_c19_e2b9_write_enable <= VAR_main_ram_update_uxn_c_l331_c19_e2b9_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l331_c19_e2b9_return_output := main_ram_update_uxn_c_l331_c19_e2b9_return_output;

     -- step_gpu[uxn_c_l343_c20_9a53] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l343_c20_9a53_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area <= VAR_step_gpu_uxn_c_l343_c20_9a53_is_active_drawing_area;
     step_gpu_uxn_c_l343_c20_9a53_is_vram_write <= VAR_step_gpu_uxn_c_l343_c20_9a53_is_vram_write;
     step_gpu_uxn_c_l343_c20_9a53_vram_write_layer <= VAR_step_gpu_uxn_c_l343_c20_9a53_vram_write_layer;
     step_gpu_uxn_c_l343_c20_9a53_vram_address <= VAR_step_gpu_uxn_c_l343_c20_9a53_vram_address;
     step_gpu_uxn_c_l343_c20_9a53_vram_value <= VAR_step_gpu_uxn_c_l343_c20_9a53_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l343_c20_9a53_return_output := step_gpu_uxn_c_l343_c20_9a53_return_output;

     -- Submodule level 10
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l331_c19_e2b9_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l343_c20_9a53_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l345_c92_17fd] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l345_c92_17fd_return_output := VAR_step_gpu_uxn_c_l343_c20_9a53_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l344_c19_161f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l344_c19_161f_return_output := VAR_step_gpu_uxn_c_l343_c20_9a53_return_output.is_active_fill;

     -- Submodule level 11
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l344_c19_161f_return_output;
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l345_c92_17fd_return_output;
     -- palette_snoop[uxn_c_l345_c20_d2a4] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l345_c20_d2a4_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address <= VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_address;
     palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value <= VAR_palette_snoop_uxn_c_l345_c20_d2a4_device_ram_value;
     palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write <= VAR_palette_snoop_uxn_c_l345_c20_d2a4_is_device_ram_write;
     palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color <= VAR_palette_snoop_uxn_c_l345_c20_d2a4_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l345_c20_d2a4_return_output := palette_snoop_uxn_c_l345_c20_d2a4_return_output;

     -- Submodule level 12
     VAR_return_output := VAR_palette_snoop_uxn_c_l345_c20_d2a4_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l345_c20_d2a4_return_output;
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
