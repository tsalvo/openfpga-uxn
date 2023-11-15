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
entity uxn_top_0CLK_d322b92f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_d322b92f;
architecture arch of uxn_top_0CLK_d322b92f is
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
signal cpu_step_result : cpu_step_result_t := cpu_step_result_t_NULL;
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
signal vram_address : unsigned(23 downto 0) := to_unsigned(0, 24);
signal vram_value : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_main_clock_cycle : unsigned(31 downto 0);
signal REG_COMB_boot_check : unsigned(23 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;
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
signal REG_COMB_vram_address : unsigned(23 downto 0);
signal REG_COMB_vram_value : unsigned(1 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l319_c7_dbca]
signal UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l331_c9_7302]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l319_c2_9e41]
signal vram_value_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(1 downto 0);

-- ram_address_MUX[uxn_c_l319_c2_9e41]
signal ram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(15 downto 0);

-- is_ram_write_MUX[uxn_c_l319_c2_9e41]
signal is_ram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l319_c2_9e41]
signal is_vram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l319_c2_9e41]
signal is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l319_c2_9e41]
signal cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output : cpu_step_result_t;

-- is_booted_MUX[uxn_c_l319_c2_9e41]
signal is_booted_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l319_c2_9e41]
signal device_ram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l319_c2_9e41]
signal vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);

-- boot_check_MUX[uxn_c_l319_c2_9e41]
signal boot_check_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(23 downto 0);

-- vram_address_MUX[uxn_c_l319_c2_9e41]
signal vram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(23 downto 0);

-- ram_write_value_MUX[uxn_c_l319_c2_9e41]
signal ram_write_value_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(7 downto 0);

-- MUX[uxn_c_l321_c18_e3b3]
signal MUX_uxn_c_l321_c18_e3b3_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l321_c18_e3b3_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l321_c18_e3b3_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l321_c18_e3b3_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l321_c3_cd8f]
signal BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l322_c44_882a]
signal BIN_OP_GT_uxn_c_l322_c44_882a_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l322_c44_882a_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_c_l322_c44_882a_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l322_c68_82be]
signal BIN_OP_PLUS_uxn_c_l322_c68_82be_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l322_c68_82be_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l322_c44_9e5d]
signal MUX_uxn_c_l322_c44_9e5d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l322_c44_9e5d_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l322_c44_9e5d_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l322_c44_9e5d_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l322_c16_c215]
signal MUX_uxn_c_l322_c16_c215_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l322_c16_c215_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l322_c16_c215_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l322_c16_c215_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l324_c16_f7e9]
signal BIN_OP_EQ_uxn_c_l324_c16_f7e9_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l324_c16_f7e9_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l324_c16_094b]
signal MUX_uxn_c_l324_c16_094b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c16_094b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c16_094b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l324_c16_094b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_c_l331_c14_7d82]
signal UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_1ac3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l331_c9_7302]
signal vram_value_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c9_7302_return_output : unsigned(1 downto 0);

-- ram_address_MUX[uxn_c_l331_c9_7302]
signal ram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(15 downto 0);

-- is_ram_write_MUX[uxn_c_l331_c9_7302]
signal is_ram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l331_c9_7302]
signal is_vram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l331_c9_7302]
signal is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l331_c9_7302]
signal cpu_step_result_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output : cpu_step_result_t;

-- device_ram_address_MUX[uxn_c_l331_c9_7302]
signal device_ram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l331_c9_7302]
signal vram_write_layer_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l331_c9_7302]
signal vram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(23 downto 0);
signal vram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(23 downto 0);

-- ram_write_value_MUX[uxn_c_l331_c9_7302]
signal ram_write_value_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c9_7302_return_output : unsigned(7 downto 0);

-- step_cpu[uxn_c_l332_c21_0a01]
signal step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l332_c21_0a01_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l332_c21_0a01_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l332_c21_0a01_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l344_c19_b8ed]
signal main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l344_c19_b8ed_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l344_c19_b8ed_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l344_c19_b8ed_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l344_c19_b8ed_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l350_c26_94a9]
signal device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l350_c26_94a9_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l350_c26_94a9_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l350_c26_94a9_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l350_c26_94a9_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l356_c20_21f6]
signal step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_vram_address : unsigned(23 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l356_c20_21f6_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l358_c20_e26f]
signal palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l358_c20_e26f_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l358_c20_e26f_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l358_c20_e26f_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l359_c18_2a6e]
signal vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l359_c18_2a6e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l361_c2_81f3]
signal BIN_OP_PLUS_uxn_c_l361_c2_81f3_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c2_81f3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l319_c7_dbca
UNARY_OP_NOT_uxn_c_l319_c7_dbca : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr,
UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302
FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output);

-- vram_value_MUX_uxn_c_l319_c2_9e41
vram_value_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l319_c2_9e41_cond,
vram_value_MUX_uxn_c_l319_c2_9e41_iftrue,
vram_value_MUX_uxn_c_l319_c2_9e41_iffalse,
vram_value_MUX_uxn_c_l319_c2_9e41_return_output);

-- ram_address_MUX_uxn_c_l319_c2_9e41
ram_address_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l319_c2_9e41_cond,
ram_address_MUX_uxn_c_l319_c2_9e41_iftrue,
ram_address_MUX_uxn_c_l319_c2_9e41_iffalse,
ram_address_MUX_uxn_c_l319_c2_9e41_return_output);

-- is_ram_write_MUX_uxn_c_l319_c2_9e41
is_ram_write_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l319_c2_9e41_cond,
is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue,
is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse,
is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output);

-- is_vram_write_MUX_uxn_c_l319_c2_9e41
is_vram_write_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l319_c2_9e41_cond,
is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue,
is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse,
is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output);

-- is_device_ram_write_MUX_uxn_c_l319_c2_9e41
is_device_ram_write_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond,
is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue,
is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse,
is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output);

-- cpu_step_result_MUX_uxn_c_l319_c2_9e41
cpu_step_result_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond,
cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue,
cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse,
cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output);

-- is_booted_MUX_uxn_c_l319_c2_9e41
is_booted_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l319_c2_9e41_cond,
is_booted_MUX_uxn_c_l319_c2_9e41_iftrue,
is_booted_MUX_uxn_c_l319_c2_9e41_iffalse,
is_booted_MUX_uxn_c_l319_c2_9e41_return_output);

-- device_ram_address_MUX_uxn_c_l319_c2_9e41
device_ram_address_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l319_c2_9e41_cond,
device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue,
device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse,
device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output);

-- vram_write_layer_MUX_uxn_c_l319_c2_9e41
vram_write_layer_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond,
vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue,
vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse,
vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output);

-- boot_check_MUX_uxn_c_l319_c2_9e41
boot_check_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l319_c2_9e41_cond,
boot_check_MUX_uxn_c_l319_c2_9e41_iftrue,
boot_check_MUX_uxn_c_l319_c2_9e41_iffalse,
boot_check_MUX_uxn_c_l319_c2_9e41_return_output);

-- vram_address_MUX_uxn_c_l319_c2_9e41
vram_address_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l319_c2_9e41_cond,
vram_address_MUX_uxn_c_l319_c2_9e41_iftrue,
vram_address_MUX_uxn_c_l319_c2_9e41_iffalse,
vram_address_MUX_uxn_c_l319_c2_9e41_return_output);

-- ram_write_value_MUX_uxn_c_l319_c2_9e41
ram_write_value_MUX_uxn_c_l319_c2_9e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l319_c2_9e41_cond,
ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue,
ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse,
ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output);

-- MUX_uxn_c_l321_c18_e3b3
MUX_uxn_c_l321_c18_e3b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l321_c18_e3b3_cond,
MUX_uxn_c_l321_c18_e3b3_iftrue,
MUX_uxn_c_l321_c18_e3b3_iffalse,
MUX_uxn_c_l321_c18_e3b3_return_output);

-- BIN_OP_PLUS_uxn_c_l321_c3_cd8f
BIN_OP_PLUS_uxn_c_l321_c3_cd8f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left,
BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right,
BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output);

-- BIN_OP_GT_uxn_c_l322_c44_882a
BIN_OP_GT_uxn_c_l322_c44_882a : entity work.BIN_OP_GT_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l322_c44_882a_left,
BIN_OP_GT_uxn_c_l322_c44_882a_right,
BIN_OP_GT_uxn_c_l322_c44_882a_return_output);

-- BIN_OP_PLUS_uxn_c_l322_c68_82be
BIN_OP_PLUS_uxn_c_l322_c68_82be : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l322_c68_82be_left,
BIN_OP_PLUS_uxn_c_l322_c68_82be_right,
BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output);

-- MUX_uxn_c_l322_c44_9e5d
MUX_uxn_c_l322_c44_9e5d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l322_c44_9e5d_cond,
MUX_uxn_c_l322_c44_9e5d_iftrue,
MUX_uxn_c_l322_c44_9e5d_iffalse,
MUX_uxn_c_l322_c44_9e5d_return_output);

-- MUX_uxn_c_l322_c16_c215
MUX_uxn_c_l322_c16_c215 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l322_c16_c215_cond,
MUX_uxn_c_l322_c16_c215_iftrue,
MUX_uxn_c_l322_c16_c215_iffalse,
MUX_uxn_c_l322_c16_c215_return_output);

-- BIN_OP_EQ_uxn_c_l324_c16_f7e9
BIN_OP_EQ_uxn_c_l324_c16_f7e9 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l324_c16_f7e9_left,
BIN_OP_EQ_uxn_c_l324_c16_f7e9_right,
BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output);

-- MUX_uxn_c_l324_c16_094b
MUX_uxn_c_l324_c16_094b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l324_c16_094b_cond,
MUX_uxn_c_l324_c16_094b_iftrue,
MUX_uxn_c_l324_c16_094b_iffalse,
MUX_uxn_c_l324_c16_094b_return_output);

-- UNARY_OP_NOT_uxn_c_l331_c14_7d82
UNARY_OP_NOT_uxn_c_l331_c14_7d82 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr,
UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output);

-- vram_value_MUX_uxn_c_l331_c9_7302
vram_value_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l331_c9_7302_cond,
vram_value_MUX_uxn_c_l331_c9_7302_iftrue,
vram_value_MUX_uxn_c_l331_c9_7302_iffalse,
vram_value_MUX_uxn_c_l331_c9_7302_return_output);

-- ram_address_MUX_uxn_c_l331_c9_7302
ram_address_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l331_c9_7302_cond,
ram_address_MUX_uxn_c_l331_c9_7302_iftrue,
ram_address_MUX_uxn_c_l331_c9_7302_iffalse,
ram_address_MUX_uxn_c_l331_c9_7302_return_output);

-- is_ram_write_MUX_uxn_c_l331_c9_7302
is_ram_write_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l331_c9_7302_cond,
is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue,
is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse,
is_ram_write_MUX_uxn_c_l331_c9_7302_return_output);

-- is_vram_write_MUX_uxn_c_l331_c9_7302
is_vram_write_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l331_c9_7302_cond,
is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue,
is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse,
is_vram_write_MUX_uxn_c_l331_c9_7302_return_output);

-- is_device_ram_write_MUX_uxn_c_l331_c9_7302
is_device_ram_write_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond,
is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue,
is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse,
is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output);

-- cpu_step_result_MUX_uxn_c_l331_c9_7302
cpu_step_result_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l331_c9_7302_cond,
cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue,
cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse,
cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output);

-- device_ram_address_MUX_uxn_c_l331_c9_7302
device_ram_address_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l331_c9_7302_cond,
device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue,
device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse,
device_ram_address_MUX_uxn_c_l331_c9_7302_return_output);

-- vram_write_layer_MUX_uxn_c_l331_c9_7302
vram_write_layer_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l331_c9_7302_cond,
vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue,
vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse,
vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output);

-- vram_address_MUX_uxn_c_l331_c9_7302
vram_address_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l331_c9_7302_cond,
vram_address_MUX_uxn_c_l331_c9_7302_iftrue,
vram_address_MUX_uxn_c_l331_c9_7302_iffalse,
vram_address_MUX_uxn_c_l331_c9_7302_return_output);

-- ram_write_value_MUX_uxn_c_l331_c9_7302
ram_write_value_MUX_uxn_c_l331_c9_7302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l331_c9_7302_cond,
ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue,
ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse,
ram_write_value_MUX_uxn_c_l331_c9_7302_return_output);

-- step_cpu_uxn_c_l332_c21_0a01
step_cpu_uxn_c_l332_c21_0a01 : entity work.step_cpu_0CLK_ddde2ec8 port map (
clk,
step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE,
step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value,
step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read,
step_cpu_uxn_c_l332_c21_0a01_use_vector,
step_cpu_uxn_c_l332_c21_0a01_vector,
step_cpu_uxn_c_l332_c21_0a01_return_output);

-- main_ram_update_uxn_c_l344_c19_b8ed
main_ram_update_uxn_c_l344_c19_b8ed : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE,
main_ram_update_uxn_c_l344_c19_b8ed_ram_address,
main_ram_update_uxn_c_l344_c19_b8ed_value,
main_ram_update_uxn_c_l344_c19_b8ed_write_enable,
main_ram_update_uxn_c_l344_c19_b8ed_return_output);

-- device_ram_update_uxn_c_l350_c26_94a9
device_ram_update_uxn_c_l350_c26_94a9 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE,
device_ram_update_uxn_c_l350_c26_94a9_device_address,
device_ram_update_uxn_c_l350_c26_94a9_value,
device_ram_update_uxn_c_l350_c26_94a9_write_enable,
device_ram_update_uxn_c_l350_c26_94a9_return_output);

-- step_gpu_uxn_c_l356_c20_21f6
step_gpu_uxn_c_l356_c20_21f6 : entity work.step_gpu_0CLK_6b96c5f3 port map (
clk,
step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE,
step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area,
step_gpu_uxn_c_l356_c20_21f6_is_vram_write,
step_gpu_uxn_c_l356_c20_21f6_vram_write_layer,
step_gpu_uxn_c_l356_c20_21f6_vram_address,
step_gpu_uxn_c_l356_c20_21f6_vram_value,
step_gpu_uxn_c_l356_c20_21f6_return_output);

-- palette_snoop_uxn_c_l358_c20_e26f
palette_snoop_uxn_c_l358_c20_e26f : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE,
palette_snoop_uxn_c_l358_c20_e26f_device_ram_address,
palette_snoop_uxn_c_l358_c20_e26f_device_ram_value,
palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write,
palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color,
palette_snoop_uxn_c_l358_c20_e26f_return_output);

-- vector_snoop_uxn_c_l359_c18_2a6e
vector_snoop_uxn_c_l359_c18_2a6e : entity work.vector_snoop_0CLK_9d359dd9 port map (
clk,
vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE,
vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address,
vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value,
vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write,
vector_snoop_uxn_c_l359_c18_2a6e_return_output);

-- BIN_OP_PLUS_uxn_c_l361_c2_81f3
BIN_OP_PLUS_uxn_c_l361_c2_81f3 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l361_c2_81f3_left,
BIN_OP_PLUS_uxn_c_l361_c2_81f3_right,
BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
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
 cpu_step_result,
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
 UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output,
 vram_value_MUX_uxn_c_l319_c2_9e41_return_output,
 ram_address_MUX_uxn_c_l319_c2_9e41_return_output,
 is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output,
 is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output,
 is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output,
 cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output,
 is_booted_MUX_uxn_c_l319_c2_9e41_return_output,
 device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output,
 vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output,
 boot_check_MUX_uxn_c_l319_c2_9e41_return_output,
 vram_address_MUX_uxn_c_l319_c2_9e41_return_output,
 ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output,
 MUX_uxn_c_l321_c18_e3b3_return_output,
 BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output,
 BIN_OP_GT_uxn_c_l322_c44_882a_return_output,
 BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output,
 MUX_uxn_c_l322_c44_9e5d_return_output,
 MUX_uxn_c_l322_c16_c215_return_output,
 BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output,
 MUX_uxn_c_l324_c16_094b_return_output,
 UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output,
 vram_value_MUX_uxn_c_l331_c9_7302_return_output,
 ram_address_MUX_uxn_c_l331_c9_7302_return_output,
 is_ram_write_MUX_uxn_c_l331_c9_7302_return_output,
 is_vram_write_MUX_uxn_c_l331_c9_7302_return_output,
 is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output,
 cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output,
 device_ram_address_MUX_uxn_c_l331_c9_7302_return_output,
 vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output,
 vram_address_MUX_uxn_c_l331_c9_7302_return_output,
 ram_write_value_MUX_uxn_c_l331_c9_7302_return_output,
 step_cpu_uxn_c_l332_c21_0a01_return_output,
 main_ram_update_uxn_c_l344_c19_b8ed_return_output,
 device_ram_update_uxn_c_l350_c26_94a9_return_output,
 step_gpu_uxn_c_l356_c20_21f6_return_output,
 palette_snoop_uxn_c_l358_c20_e26f_return_output,
 vector_snoop_uxn_c_l359_c18_2a6e_return_output,
 BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c9_7302_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l321_c3_3d70 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c9_7302_return_output : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l321_c18_e3b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l321_c18_e3b3_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l321_c18_e3b3_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l321_c18_e3b3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l322_c16_c215_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l322_c16_c215_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l322_c16_c215_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l322_c44_9e5d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l322_c44_9e5d_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l322_c44_9e5d_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l322_c44_882a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l322_c44_882a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l322_c44_882a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l322_c44_9e5d_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l322_c16_c215_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l324_c16_094b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c16_094b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c16_094b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l324_c16_094b_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(23 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_cond : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l332_c69_d350_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l332_c21_0a01_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l333_c18_0817_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l334_c17_3d4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l335_c24_90f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l336_c25_3840_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l338_c19_d69f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l339_c22_ed9b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l340_c18_e3b7_return_output : unsigned(23 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l341_c16_fb65_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l344_c19_b8ed_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l344_c19_b8ed_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l344_c19_b8ed_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l344_c19_b8ed_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l350_c26_94a9_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l350_c26_94a9_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l350_c26_94a9_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l350_c26_94a9_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_vram_address : unsigned(23 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l356_c20_21f6_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l357_c19_9a66_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l358_c92_201e_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l358_c20_e26f_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l359_c18_2a6e_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l361_c2_ba6e : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l337_DUPLICATE_ae56_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
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
variable REG_VAR_vram_address : unsigned(23 downto 0);
variable REG_VAR_vram_value : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_main_clock_cycle := main_clock_cycle;
  REG_VAR_boot_check := boot_check;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_booted := is_booted;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_cpu_step_result := cpu_step_result;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l322_c16_c215_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l322_c44_882a_right := to_unsigned(255, 8);
     VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l324_c16_094b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l321_c18_e3b3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l321_c18_e3b3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l322_c44_9e5d_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l324_c16_094b_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue := cpu_step_result;
     VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse := cpu_step_result;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse := is_ram_write;
     VAR_step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_left := main_clock_cycle;
     VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l331_c9_7302_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse := ram_write_value;
     VAR_MUX_uxn_c_l321_c18_e3b3_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l322_c16_c215_cond := VAR_rom_load_valid_byte;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue := VAR_rom_load_valid_byte;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue := VAR_rom_load_value;
     VAR_step_cpu_uxn_c_l332_c21_0a01_vector := screen_vector;
     VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l331_c9_7302_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l331_c9_7302_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse := vram_write_layer;
     -- MUX[uxn_c_l321_c18_e3b3] LATENCY=0
     -- Inputs
     MUX_uxn_c_l321_c18_e3b3_cond <= VAR_MUX_uxn_c_l321_c18_e3b3_cond;
     MUX_uxn_c_l321_c18_e3b3_iftrue <= VAR_MUX_uxn_c_l321_c18_e3b3_iftrue;
     MUX_uxn_c_l321_c18_e3b3_iffalse <= VAR_MUX_uxn_c_l321_c18_e3b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l321_c18_e3b3_return_output := MUX_uxn_c_l321_c18_e3b3_return_output;

     -- UNARY_OP_NOT[uxn_c_l331_c14_7d82] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr <= VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output := UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;

     -- BIN_OP_PLUS[uxn_c_l361_c2_81f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l361_c2_81f3_left <= VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_left;
     BIN_OP_PLUS_uxn_c_l361_c2_81f3_right <= VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output := BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l332_c69_d350] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l332_c69_d350_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l319_c7_dbca] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr <= VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output := UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;

     -- BIN_OP_PLUS[uxn_c_l322_c68_82be] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l322_c68_82be_left <= VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_left;
     BIN_OP_PLUS_uxn_c_l322_c68_82be_right <= VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output := BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l322_c44_9e5d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l322_c68_82be_return_output, 24);
     VAR_main_clock_cycle_uxn_c_l361_c2_ba6e := resize(VAR_BIN_OP_PLUS_uxn_c_l361_c2_81f3_return_output, 32);
     VAR_step_cpu_uxn_c_l332_c21_0a01_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l332_c69_d350_return_output;
     VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right := VAR_MUX_uxn_c_l321_c18_e3b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_is_booted_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_ram_address_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_vram_address_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond := VAR_UNARY_OP_NOT_uxn_c_l319_c7_dbca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_ram_address_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c14_7d82_return_output;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l361_c2_ba6e;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output;

     -- BIN_OP_PLUS[uxn_c_l321_c3_cd8f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left <= VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_left;
     BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right <= VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output := BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output;

     -- Submodule level 2
     VAR_ram_address_uxn_c_l321_c3_3d70 := resize(VAR_BIN_OP_PLUS_uxn_c_l321_c3_cd8f_return_output, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_BIN_OP_GT_uxn_c_l322_c44_882a_left := VAR_ram_address_uxn_c_l321_c3_3d70;
     VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue := VAR_ram_address_uxn_c_l321_c3_3d70;
     -- BIN_OP_GT[uxn_c_l322_c44_882a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l322_c44_882a_left <= VAR_BIN_OP_GT_uxn_c_l322_c44_882a_left;
     BIN_OP_GT_uxn_c_l322_c44_882a_right <= VAR_BIN_OP_GT_uxn_c_l322_c44_882a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l322_c44_882a_return_output := BIN_OP_GT_uxn_c_l322_c44_882a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_1ac3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l322_c44_9e5d_cond := VAR_BIN_OP_GT_uxn_c_l322_c44_882a_return_output;
     VAR_step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_1ac3_return_output;
     -- step_cpu[uxn_c_l332_c21_0a01] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l332_c21_0a01_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value <= VAR_step_cpu_uxn_c_l332_c21_0a01_previous_ram_read_value;
     step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read <= VAR_step_cpu_uxn_c_l332_c21_0a01_previous_device_ram_read;
     step_cpu_uxn_c_l332_c21_0a01_use_vector <= VAR_step_cpu_uxn_c_l332_c21_0a01_use_vector;
     step_cpu_uxn_c_l332_c21_0a01_vector <= VAR_step_cpu_uxn_c_l332_c21_0a01_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l332_c21_0a01_return_output := step_cpu_uxn_c_l332_c21_0a01_return_output;

     -- MUX[uxn_c_l322_c44_9e5d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l322_c44_9e5d_cond <= VAR_MUX_uxn_c_l322_c44_9e5d_cond;
     MUX_uxn_c_l322_c44_9e5d_iftrue <= VAR_MUX_uxn_c_l322_c44_9e5d_iftrue;
     MUX_uxn_c_l322_c44_9e5d_iffalse <= VAR_MUX_uxn_c_l322_c44_9e5d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l322_c44_9e5d_return_output := MUX_uxn_c_l322_c44_9e5d_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_c_l322_c16_c215_iffalse := VAR_MUX_uxn_c_l322_c44_9e5d_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output;
     -- MUX[uxn_c_l322_c16_c215] LATENCY=0
     -- Inputs
     MUX_uxn_c_l322_c16_c215_cond <= VAR_MUX_uxn_c_l322_c16_c215_cond;
     MUX_uxn_c_l322_c16_c215_iftrue <= VAR_MUX_uxn_c_l322_c16_c215_iftrue;
     MUX_uxn_c_l322_c16_c215_iffalse <= VAR_MUX_uxn_c_l322_c16_c215_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l322_c16_c215_return_output := MUX_uxn_c_l322_c16_c215_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l333_c18_0817] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l333_c18_0817_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l338_c19_d69f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l338_c19_d69f_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.is_vram_write;

     -- cpu_step_result_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l331_c9_7302_cond <= VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_cond;
     cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iftrue;
     cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output := cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l339_c22_ed9b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l339_c22_ed9b_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l336_c25_3840] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l336_c25_3840_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l337_DUPLICATE_ae56 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l337_DUPLICATE_ae56_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l334_c17_3d4c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l334_c17_3d4c_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.ram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l335_c24_90f6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l335_c24_90f6_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.device_ram_address;

     -- CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d[uxn_c_l340_c18_e3b7] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l340_c18_e3b7_return_output := VAR_step_cpu_uxn_c_l332_c21_0a01_return_output.vram_address;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l334_c17_3d4c_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l336_c25_3840_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l333_c18_0817_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l338_c19_d69f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l339_c22_ed9b_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint24_t_cpu_step_result_t_vram_address_d41d_uxn_c_l340_c18_e3b7_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l335_c24_90f6_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l337_DUPLICATE_ae56_return_output;
     VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_left := VAR_MUX_uxn_c_l322_c16_c215_return_output;
     VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iftrue := VAR_MUX_uxn_c_l322_c16_c215_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_cpu_step_result_MUX_uxn_c_l331_c9_7302_return_output;
     -- boot_check_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l319_c2_9e41_cond <= VAR_boot_check_MUX_uxn_c_l319_c2_9e41_cond;
     boot_check_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iftrue;
     boot_check_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_boot_check_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l319_c2_9e41_return_output := boot_check_MUX_uxn_c_l319_c2_9e41_return_output;

     -- ram_address_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l331_c9_7302_cond <= VAR_ram_address_MUX_uxn_c_l331_c9_7302_cond;
     ram_address_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_ram_address_MUX_uxn_c_l331_c9_7302_iftrue;
     ram_address_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_ram_address_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l331_c9_7302_return_output := ram_address_MUX_uxn_c_l331_c9_7302_return_output;

     -- vram_write_layer_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l331_c9_7302_cond <= VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_cond;
     vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iftrue;
     vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output := vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output;

     -- BIN_OP_EQ[uxn_c_l324_c16_f7e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l324_c16_f7e9_left <= VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_left;
     BIN_OP_EQ_uxn_c_l324_c16_f7e9_right <= VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output := BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output;

     -- is_vram_write_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l331_c9_7302_cond <= VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_cond;
     is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iftrue;
     is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_return_output := is_vram_write_MUX_uxn_c_l331_c9_7302_return_output;

     -- cpu_step_result_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_cond;
     cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iftrue;
     cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output := cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output;

     -- is_device_ram_write_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond <= VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_cond;
     is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iftrue;
     is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output := is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output;

     -- device_ram_address_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l331_c9_7302_cond <= VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_cond;
     device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iftrue;
     device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_return_output := device_ram_address_MUX_uxn_c_l331_c9_7302_return_output;

     -- vram_address_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l331_c9_7302_cond <= VAR_vram_address_MUX_uxn_c_l331_c9_7302_cond;
     vram_address_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_vram_address_MUX_uxn_c_l331_c9_7302_iftrue;
     vram_address_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_vram_address_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l331_c9_7302_return_output := vram_address_MUX_uxn_c_l331_c9_7302_return_output;

     -- is_ram_write_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l331_c9_7302_cond <= VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_cond;
     is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iftrue;
     is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_return_output := is_ram_write_MUX_uxn_c_l331_c9_7302_return_output;

     -- ram_write_value_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l331_c9_7302_cond <= VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_cond;
     ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iftrue;
     ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_return_output := ram_write_value_MUX_uxn_c_l331_c9_7302_return_output;

     -- CAST_TO_uint2_t[uxn_c_l341_c16_fb65] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l341_c16_fb65_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l341_l337_DUPLICATE_ae56_return_output);

     -- Submodule level 6
     VAR_MUX_uxn_c_l324_c16_094b_cond := VAR_BIN_OP_EQ_uxn_c_l324_c16_f7e9_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c9_7302_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l341_c16_fb65_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_device_ram_address_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_is_ram_write_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_is_vram_write_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_ram_address_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_ram_write_value_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_vram_address_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_vram_write_layer_MUX_uxn_c_l331_c9_7302_return_output;
     -- device_ram_address_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l319_c2_9e41_cond <= VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_cond;
     device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue;
     device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output := device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;

     -- vram_address_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l319_c2_9e41_cond <= VAR_vram_address_MUX_uxn_c_l319_c2_9e41_cond;
     vram_address_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iftrue;
     vram_address_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_vram_address_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l319_c2_9e41_return_output := vram_address_MUX_uxn_c_l319_c2_9e41_return_output;

     -- ram_address_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l319_c2_9e41_cond <= VAR_ram_address_MUX_uxn_c_l319_c2_9e41_cond;
     ram_address_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iftrue;
     ram_address_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_ram_address_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l319_c2_9e41_return_output := ram_address_MUX_uxn_c_l319_c2_9e41_return_output;

     -- vram_write_layer_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_cond;
     vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iftrue;
     vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output := vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output;

     -- vram_value_MUX[uxn_c_l331_c9_7302] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l331_c9_7302_cond <= VAR_vram_value_MUX_uxn_c_l331_c9_7302_cond;
     vram_value_MUX_uxn_c_l331_c9_7302_iftrue <= VAR_vram_value_MUX_uxn_c_l331_c9_7302_iftrue;
     vram_value_MUX_uxn_c_l331_c9_7302_iffalse <= VAR_vram_value_MUX_uxn_c_l331_c9_7302_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l331_c9_7302_return_output := vram_value_MUX_uxn_c_l331_c9_7302_return_output;

     -- is_device_ram_write_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_cond;
     is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue;
     is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output := is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;

     -- is_ram_write_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l319_c2_9e41_cond <= VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_cond;
     is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iftrue;
     is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output := is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;

     -- is_vram_write_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l319_c2_9e41_cond <= VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_cond;
     is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iftrue;
     is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output := is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output;

     -- ram_write_value_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l319_c2_9e41_cond <= VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_cond;
     ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iftrue;
     ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output := ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;

     -- MUX[uxn_c_l324_c16_094b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l324_c16_094b_cond <= VAR_MUX_uxn_c_l324_c16_094b_cond;
     MUX_uxn_c_l324_c16_094b_iftrue <= VAR_MUX_uxn_c_l324_c16_094b_iftrue;
     MUX_uxn_c_l324_c16_094b_iffalse <= VAR_MUX_uxn_c_l324_c16_094b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l324_c16_094b_return_output := MUX_uxn_c_l324_c16_094b_return_output;

     -- Submodule level 7
     VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iftrue := VAR_MUX_uxn_c_l324_c16_094b_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_device_ram_update_uxn_c_l350_c26_94a9_device_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_device_ram_update_uxn_c_l350_c26_94a9_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_main_ram_update_uxn_c_l344_c19_b8ed_write_enable := VAR_is_ram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_step_gpu_uxn_c_l356_c20_21f6_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_main_ram_update_uxn_c_l344_c19_b8ed_ram_address := VAR_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_device_ram_update_uxn_c_l350_c26_94a9_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_main_ram_update_uxn_c_l344_c19_b8ed_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_step_gpu_uxn_c_l356_c20_21f6_vram_address := VAR_vram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l319_c2_9e41_return_output;
     VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iffalse := VAR_vram_value_MUX_uxn_c_l331_c9_7302_return_output;
     VAR_step_gpu_uxn_c_l356_c20_21f6_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l319_c2_9e41_return_output;
     -- device_ram_update[uxn_c_l350_c26_94a9] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l350_c26_94a9_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l350_c26_94a9_device_address <= VAR_device_ram_update_uxn_c_l350_c26_94a9_device_address;
     device_ram_update_uxn_c_l350_c26_94a9_value <= VAR_device_ram_update_uxn_c_l350_c26_94a9_value;
     device_ram_update_uxn_c_l350_c26_94a9_write_enable <= VAR_device_ram_update_uxn_c_l350_c26_94a9_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l350_c26_94a9_return_output := device_ram_update_uxn_c_l350_c26_94a9_return_output;

     -- main_ram_update[uxn_c_l344_c19_b8ed] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l344_c19_b8ed_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l344_c19_b8ed_ram_address <= VAR_main_ram_update_uxn_c_l344_c19_b8ed_ram_address;
     main_ram_update_uxn_c_l344_c19_b8ed_value <= VAR_main_ram_update_uxn_c_l344_c19_b8ed_value;
     main_ram_update_uxn_c_l344_c19_b8ed_write_enable <= VAR_main_ram_update_uxn_c_l344_c19_b8ed_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l344_c19_b8ed_return_output := main_ram_update_uxn_c_l344_c19_b8ed_return_output;

     -- vector_snoop[uxn_c_l359_c18_2a6e] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l359_c18_2a6e_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address <= VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_address;
     vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value <= VAR_vector_snoop_uxn_c_l359_c18_2a6e_device_ram_value;
     vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write <= VAR_vector_snoop_uxn_c_l359_c18_2a6e_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l359_c18_2a6e_return_output := vector_snoop_uxn_c_l359_c18_2a6e_return_output;

     -- is_booted_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l319_c2_9e41_cond <= VAR_is_booted_MUX_uxn_c_l319_c2_9e41_cond;
     is_booted_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iftrue;
     is_booted_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_is_booted_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l319_c2_9e41_return_output := is_booted_MUX_uxn_c_l319_c2_9e41_return_output;

     -- vram_value_MUX[uxn_c_l319_c2_9e41] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l319_c2_9e41_cond <= VAR_vram_value_MUX_uxn_c_l319_c2_9e41_cond;
     vram_value_MUX_uxn_c_l319_c2_9e41_iftrue <= VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iftrue;
     vram_value_MUX_uxn_c_l319_c2_9e41_iffalse <= VAR_vram_value_MUX_uxn_c_l319_c2_9e41_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l319_c2_9e41_return_output := vram_value_MUX_uxn_c_l319_c2_9e41_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l350_c26_94a9_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l344_c19_b8ed_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l359_c18_2a6e_return_output;
     VAR_step_gpu_uxn_c_l356_c20_21f6_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_9e41_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l319_c2_9e41_return_output;
     -- step_gpu[uxn_c_l356_c20_21f6] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l356_c20_21f6_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area <= VAR_step_gpu_uxn_c_l356_c20_21f6_is_active_drawing_area;
     step_gpu_uxn_c_l356_c20_21f6_is_vram_write <= VAR_step_gpu_uxn_c_l356_c20_21f6_is_vram_write;
     step_gpu_uxn_c_l356_c20_21f6_vram_write_layer <= VAR_step_gpu_uxn_c_l356_c20_21f6_vram_write_layer;
     step_gpu_uxn_c_l356_c20_21f6_vram_address <= VAR_step_gpu_uxn_c_l356_c20_21f6_vram_address;
     step_gpu_uxn_c_l356_c20_21f6_vram_value <= VAR_step_gpu_uxn_c_l356_c20_21f6_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l356_c20_21f6_return_output := step_gpu_uxn_c_l356_c20_21f6_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l356_c20_21f6_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l358_c92_201e] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l358_c92_201e_return_output := VAR_step_gpu_uxn_c_l356_c20_21f6_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l357_c19_9a66] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l357_c19_9a66_return_output := VAR_step_gpu_uxn_c_l356_c20_21f6_return_output.is_active_fill;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l357_c19_9a66_return_output;
     VAR_palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l358_c92_201e_return_output;
     -- palette_snoop[uxn_c_l358_c20_e26f] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l358_c20_e26f_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l358_c20_e26f_device_ram_address <= VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_address;
     palette_snoop_uxn_c_l358_c20_e26f_device_ram_value <= VAR_palette_snoop_uxn_c_l358_c20_e26f_device_ram_value;
     palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write <= VAR_palette_snoop_uxn_c_l358_c20_e26f_is_device_ram_write;
     palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color <= VAR_palette_snoop_uxn_c_l358_c20_e26f_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l358_c20_e26f_return_output := palette_snoop_uxn_c_l358_c20_e26f_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l358_c20_e26f_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l358_c20_e26f_return_output;
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
REG_COMB_cpu_step_result <= REG_VAR_cpu_step_result;
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
     cpu_step_result <= REG_COMB_cpu_step_result;
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
