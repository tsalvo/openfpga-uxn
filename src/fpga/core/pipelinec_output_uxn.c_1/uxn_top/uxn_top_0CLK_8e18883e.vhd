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
-- Submodules: 27
entity uxn_top_0CLK_8e18883e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_8e18883e;
architecture arch of uxn_top_0CLK_8e18883e is
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
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal u16_addr : unsigned(15 downto 0) := to_unsigned(255, 16);
signal vectors : vector_snoop_result_t := (
screen => to_unsigned(0, 16),
controller => to_unsigned(0, 16))
;
signal ram_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_address : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_device_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_vram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_write_layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal vram_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal cycle_count : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_boot_check : unsigned(23 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_cpu_step_result : cpu_step_result_t;
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_u16_addr : unsigned(15 downto 0);
signal REG_COMB_vectors : vector_snoop_result_t;
signal REG_COMB_ram_write_value : unsigned(7 downto 0);
signal REG_COMB_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_address : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_is_device_ram_write : unsigned(0 downto 0);
signal REG_COMB_is_vram_write : unsigned(0 downto 0);
signal REG_COMB_vram_write_layer : unsigned(0 downto 0);
signal REG_COMB_vram_value : unsigned(7 downto 0);
signal REG_COMB_cycle_count : unsigned(31 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l375_c7_00a4]
signal UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l390_c1_fe03]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l375_c2_bc16]
signal vram_value_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);

-- device_ram_address_MUX[uxn_c_l375_c2_bc16]
signal device_ram_address_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l375_c2_bc16]
signal is_vram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);

-- boot_check_MUX[uxn_c_l375_c2_bc16]
signal boot_check_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(23 downto 0);

-- vram_write_layer_MUX[uxn_c_l375_c2_bc16]
signal vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l375_c2_bc16]
signal u16_addr_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(15 downto 0);

-- is_booted_MUX[uxn_c_l375_c2_bc16]
signal is_booted_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l375_c2_bc16]
signal cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output : cpu_step_result_t;

-- is_device_ram_write_MUX[uxn_c_l375_c2_bc16]
signal is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l375_c2_bc16]
signal ram_write_value_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l375_c2_bc16]
signal is_ram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l384_c42_3162]
signal BIN_OP_PLUS_uxn_c_l384_c42_3162_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l384_c42_3162_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l384_c16_1957]
signal MUX_uxn_c_l384_c16_1957_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l384_c16_1957_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l384_c16_1957_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l384_c16_1957_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l386_c14_d5b2]
signal BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l388_c15_ae91]
signal BIN_OP_EQ_uxn_c_l388_c15_ae91_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l388_c15_ae91_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l388_c15_4a1c]
signal MUX_uxn_c_l388_c15_4a1c_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_4a1c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_4a1c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_4a1c_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l391_c21_c936]
signal step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_controller0_buttons : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_is_new_frame : unsigned(0 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_screen_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_controller_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l391_c21_c936_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l402_c19_4c45]
signal main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l402_c19_4c45_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l402_c19_4c45_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l402_c19_4c45_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l402_c19_4c45_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l408_c26_3ee8]
signal device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l408_c26_3ee8_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l408_c26_3ee8_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l408_c26_3ee8_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l408_c26_3ee8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l414_c115_0a74]
signal BIN_OP_EQ_uxn_c_l414_c115_0a74_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l414_c115_0a74_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l414_c115_7b02]
signal MUX_uxn_c_l414_c115_7b02_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_7b02_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_7b02_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_7b02_return_output : unsigned(0 downto 0);

-- step_gpu[uxn_c_l414_c20_4395]
signal step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_cycle : unsigned(31 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_swap_buffers : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_4395_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l415_c20_75c3]
signal palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l415_c20_75c3_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l415_c20_75c3_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l415_c20_75c3_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l416_c12_cd92]
signal vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l416_c12_cd92_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l416_c12_cd92_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l416_c12_cd92_return_output : vector_snoop_result_t;

-- BIN_OP_PLUS[uxn_c_l418_c2_3dc7]
signal BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output : unsigned(32 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l375_c7_00a4
UNARY_OP_NOT_uxn_c_l375_c7_00a4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr,
UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output);

-- vram_value_MUX_uxn_c_l375_c2_bc16
vram_value_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l375_c2_bc16_cond,
vram_value_MUX_uxn_c_l375_c2_bc16_iftrue,
vram_value_MUX_uxn_c_l375_c2_bc16_iffalse,
vram_value_MUX_uxn_c_l375_c2_bc16_return_output);

-- device_ram_address_MUX_uxn_c_l375_c2_bc16
device_ram_address_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l375_c2_bc16_cond,
device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue,
device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse,
device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output);

-- is_vram_write_MUX_uxn_c_l375_c2_bc16
is_vram_write_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l375_c2_bc16_cond,
is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue,
is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse,
is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output);

-- boot_check_MUX_uxn_c_l375_c2_bc16
boot_check_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l375_c2_bc16_cond,
boot_check_MUX_uxn_c_l375_c2_bc16_iftrue,
boot_check_MUX_uxn_c_l375_c2_bc16_iffalse,
boot_check_MUX_uxn_c_l375_c2_bc16_return_output);

-- vram_write_layer_MUX_uxn_c_l375_c2_bc16
vram_write_layer_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond,
vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue,
vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse,
vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output);

-- u16_addr_MUX_uxn_c_l375_c2_bc16
u16_addr_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l375_c2_bc16_cond,
u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue,
u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse,
u16_addr_MUX_uxn_c_l375_c2_bc16_return_output);

-- is_booted_MUX_uxn_c_l375_c2_bc16
is_booted_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l375_c2_bc16_cond,
is_booted_MUX_uxn_c_l375_c2_bc16_iftrue,
is_booted_MUX_uxn_c_l375_c2_bc16_iffalse,
is_booted_MUX_uxn_c_l375_c2_bc16_return_output);

-- cpu_step_result_MUX_uxn_c_l375_c2_bc16
cpu_step_result_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond,
cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue,
cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse,
cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output);

-- is_device_ram_write_MUX_uxn_c_l375_c2_bc16
is_device_ram_write_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond,
is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue,
is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse,
is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output);

-- ram_write_value_MUX_uxn_c_l375_c2_bc16
ram_write_value_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l375_c2_bc16_cond,
ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue,
ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse,
ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output);

-- is_ram_write_MUX_uxn_c_l375_c2_bc16
is_ram_write_MUX_uxn_c_l375_c2_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l375_c2_bc16_cond,
is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue,
is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse,
is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output);

-- BIN_OP_PLUS_uxn_c_l384_c42_3162
BIN_OP_PLUS_uxn_c_l384_c42_3162 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l384_c42_3162_left,
BIN_OP_PLUS_uxn_c_l384_c42_3162_right,
BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output);

-- MUX_uxn_c_l384_c16_1957
MUX_uxn_c_l384_c16_1957 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l384_c16_1957_cond,
MUX_uxn_c_l384_c16_1957_iftrue,
MUX_uxn_c_l384_c16_1957_iffalse,
MUX_uxn_c_l384_c16_1957_return_output);

-- BIN_OP_PLUS_uxn_c_l386_c14_d5b2
BIN_OP_PLUS_uxn_c_l386_c14_d5b2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left,
BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right,
BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output);

-- BIN_OP_EQ_uxn_c_l388_c15_ae91
BIN_OP_EQ_uxn_c_l388_c15_ae91 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l388_c15_ae91_left,
BIN_OP_EQ_uxn_c_l388_c15_ae91_right,
BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output);

-- MUX_uxn_c_l388_c15_4a1c
MUX_uxn_c_l388_c15_4a1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l388_c15_4a1c_cond,
MUX_uxn_c_l388_c15_4a1c_iftrue,
MUX_uxn_c_l388_c15_4a1c_iffalse,
MUX_uxn_c_l388_c15_4a1c_return_output);

-- step_cpu_uxn_c_l391_c21_c936
step_cpu_uxn_c_l391_c21_c936 : entity work.step_cpu_0CLK_1d574cf7 port map (
clk,
step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE,
step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value,
step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read,
step_cpu_uxn_c_l391_c21_c936_controller0_buttons,
step_cpu_uxn_c_l391_c21_c936_is_new_frame,
step_cpu_uxn_c_l391_c21_c936_screen_vector,
step_cpu_uxn_c_l391_c21_c936_controller_vector,
step_cpu_uxn_c_l391_c21_c936_return_output);

-- main_ram_update_uxn_c_l402_c19_4c45
main_ram_update_uxn_c_l402_c19_4c45 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE,
main_ram_update_uxn_c_l402_c19_4c45_ram_address,
main_ram_update_uxn_c_l402_c19_4c45_value,
main_ram_update_uxn_c_l402_c19_4c45_write_enable,
main_ram_update_uxn_c_l402_c19_4c45_return_output);

-- device_ram_update_uxn_c_l408_c26_3ee8
device_ram_update_uxn_c_l408_c26_3ee8 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE,
device_ram_update_uxn_c_l408_c26_3ee8_device_address,
device_ram_update_uxn_c_l408_c26_3ee8_value,
device_ram_update_uxn_c_l408_c26_3ee8_write_enable,
device_ram_update_uxn_c_l408_c26_3ee8_return_output);

-- BIN_OP_EQ_uxn_c_l414_c115_0a74
BIN_OP_EQ_uxn_c_l414_c115_0a74 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l414_c115_0a74_left,
BIN_OP_EQ_uxn_c_l414_c115_0a74_right,
BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output);

-- MUX_uxn_c_l414_c115_7b02
MUX_uxn_c_l414_c115_7b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l414_c115_7b02_cond,
MUX_uxn_c_l414_c115_7b02_iftrue,
MUX_uxn_c_l414_c115_7b02_iffalse,
MUX_uxn_c_l414_c115_7b02_return_output);

-- step_gpu_uxn_c_l414_c20_4395
step_gpu_uxn_c_l414_c20_4395 : entity work.step_gpu_0CLK_a341b2ce port map (
clk,
step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE,
step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area,
step_gpu_uxn_c_l414_c20_4395_is_vram_write,
step_gpu_uxn_c_l414_c20_4395_vram_write_layer,
step_gpu_uxn_c_l414_c20_4395_vram_address,
step_gpu_uxn_c_l414_c20_4395_vram_value,
step_gpu_uxn_c_l414_c20_4395_cycle,
step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap,
step_gpu_uxn_c_l414_c20_4395_swap_buffers,
step_gpu_uxn_c_l414_c20_4395_return_output);

-- palette_snoop_uxn_c_l415_c20_75c3
palette_snoop_uxn_c_l415_c20_75c3 : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE,
palette_snoop_uxn_c_l415_c20_75c3_device_ram_address,
palette_snoop_uxn_c_l415_c20_75c3_device_ram_value,
palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write,
palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color,
palette_snoop_uxn_c_l415_c20_75c3_return_output);

-- vector_snoop_uxn_c_l416_c12_cd92
vector_snoop_uxn_c_l416_c12_cd92 : entity work.vector_snoop_0CLK_9d7e88d4 port map (
clk,
vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE,
vector_snoop_uxn_c_l416_c12_cd92_device_ram_address,
vector_snoop_uxn_c_l416_c12_cd92_device_ram_value,
vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write,
vector_snoop_uxn_c_l416_c12_cd92_return_output);

-- BIN_OP_PLUS_uxn_c_l418_c2_3dc7
BIN_OP_PLUS_uxn_c_l418_c2_3dc7 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left,
BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right,
BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 controller0_buttons,
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
 is_ram_write,
 u16_addr,
 vectors,
 ram_write_value,
 ram_read_value,
 device_ram_address,
 device_ram_read_value,
 is_device_ram_write,
 is_vram_write,
 vram_write_layer,
 vram_value,
 cycle_count,
 -- All submodule outputs
 UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output,
 vram_value_MUX_uxn_c_l375_c2_bc16_return_output,
 device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output,
 is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output,
 boot_check_MUX_uxn_c_l375_c2_bc16_return_output,
 vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output,
 u16_addr_MUX_uxn_c_l375_c2_bc16_return_output,
 is_booted_MUX_uxn_c_l375_c2_bc16_return_output,
 cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output,
 is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output,
 ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output,
 is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output,
 BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output,
 MUX_uxn_c_l384_c16_1957_return_output,
 BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output,
 BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output,
 MUX_uxn_c_l388_c15_4a1c_return_output,
 step_cpu_uxn_c_l391_c21_c936_return_output,
 main_ram_update_uxn_c_l402_c19_4c45_return_output,
 device_ram_update_uxn_c_l408_c26_3ee8_return_output,
 BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output,
 MUX_uxn_c_l414_c115_7b02_return_output,
 step_gpu_uxn_c_l414_c20_4395_return_output,
 palette_snoop_uxn_c_l415_c20_75c3_return_output,
 vector_snoop_uxn_c_l416_c12_cd92_return_output,
 BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l386_c3_bd6e : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_1957_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_1957_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_1957_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_1957_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_4a1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_4a1c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_4a1c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_4a1c_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_controller0_buttons : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_is_new_frame : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_screen_vector : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_controller_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_27b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_fbe5_return_output : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_c936_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_78a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_f4ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_eb2e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_531b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_3641_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_2c13_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_4c45_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_4c45_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_4c45_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_4c45_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_3ee8_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_3ee8_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_3ee8_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_3ee8_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_cycle : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_swap_buffers : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_7b02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_7b02_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_7b02_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_7b02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_3a0f_return_output : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_4395_return_output : gpu_step_result_t;
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_2c59_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_75c3_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_cd92_return_output : vector_snoop_result_t;
 variable VAR_cycle_count_uxn_c_l418_c2_10a2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_92d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_c417_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_u16_addr : unsigned(15 downto 0);
variable REG_VAR_vectors : vector_snoop_result_t;
variable REG_VAR_ram_write_value : unsigned(7 downto 0);
variable REG_VAR_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_device_ram_address : unsigned(7 downto 0);
variable REG_VAR_device_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_is_device_ram_write : unsigned(0 downto 0);
variable REG_VAR_is_vram_write : unsigned(0 downto 0);
variable REG_VAR_vram_write_layer : unsigned(0 downto 0);
variable REG_VAR_vram_value : unsigned(7 downto 0);
variable REG_VAR_cycle_count : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_boot_check := boot_check;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_booted := is_booted;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_cpu_step_result := cpu_step_result;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_u16_addr := u16_addr;
  REG_VAR_vectors := vectors;
  REG_VAR_ram_write_value := ram_write_value;
  REG_VAR_ram_read_value := ram_read_value;
  REG_VAR_device_ram_address := device_ram_address;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_is_device_ram_write := is_device_ram_write;
  REG_VAR_is_vram_write := is_vram_write;
  REG_VAR_vram_write_layer := vram_write_layer;
  REG_VAR_vram_value := vram_value;
  REG_VAR_cycle_count := cycle_count;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right := to_unsigned(256, 16);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l384_c16_1957_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l414_c115_7b02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_right := to_unsigned(16777215, 24);
     VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l388_c15_4a1c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l414_c115_7b02_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l388_c15_4a1c_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_controller0_buttons := controller0_buttons;
     VAR_is_visible_pixel := is_visible_pixel;
     VAR_rom_load_valid_byte := rom_load_valid_byte;
     VAR_rom_load_address := rom_load_address;
     VAR_rom_load_value := rom_load_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iffalse := boot_check;
     VAR_step_cpu_uxn_c_l391_c21_c936_controller0_buttons := VAR_controller0_buttons;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue := cpu_step_result;
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left := cycle_count;
     VAR_step_gpu_uxn_c_l414_c20_4395_cycle := cycle_count;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue := device_ram_address;
     VAR_step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue := is_device_ram_write;
     VAR_step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue := is_vram_write;
     VAR_step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value := ram_read_value;
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left := VAR_rom_load_address;
     VAR_MUX_uxn_c_l384_c16_1957_cond := VAR_rom_load_valid_byte;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue := VAR_rom_load_valid_byte;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue := VAR_rom_load_value;
     VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iftrue := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l386_c14_d5b2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left <= VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_left;
     BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right <= VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output := BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d[uxn_c_l391_c136_fbe5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_fbe5_return_output := vectors.controller;

     -- BIN_OP_PLUS[uxn_c_l384_c42_3162] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l384_c42_3162_left <= VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_left;
     BIN_OP_PLUS_uxn_c_l384_c42_3162_right <= VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output := BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output;

     -- UNARY_OP_NOT[uxn_c_l375_c7_00a4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr <= VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output := UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l391_c90_27b9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_27b9_return_output := gpu_step_result.is_new_frame;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_92d1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_92d1_return_output := vectors.screen;

     -- BIN_OP_PLUS[uxn_c_l418_c2_3dc7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left <= VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_left;
     BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right <= VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output := BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l384_c16_1957_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l384_c42_3162_return_output, 24);
     VAR_u16_addr_uxn_c_l386_c3_bd6e := resize(VAR_BIN_OP_PLUS_uxn_c_l386_c14_d5b2_return_output, 16);
     VAR_cycle_count_uxn_c_l418_c2_10a2 := resize(VAR_BIN_OP_PLUS_uxn_c_l418_c2_3dc7_return_output, 32);
     VAR_step_cpu_uxn_c_l391_c21_c936_controller_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_fbe5_return_output;
     VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_92d1_return_output;
     VAR_step_cpu_uxn_c_l391_c21_c936_screen_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_92d1_return_output;
     VAR_step_cpu_uxn_c_l391_c21_c936_is_new_frame := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_27b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_boot_check_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_is_booted_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_vram_value_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_00a4_return_output;
     REG_VAR_cycle_count := VAR_cycle_count_uxn_c_l418_c2_10a2;
     VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue := VAR_u16_addr_uxn_c_l386_c3_bd6e;
     -- BIN_OP_EQ[uxn_c_l414_c115_0a74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l414_c115_0a74_left <= VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_left;
     BIN_OP_EQ_uxn_c_l414_c115_0a74_right <= VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output := BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l390_c1_fe03] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output;

     -- MUX[uxn_c_l384_c16_1957] LATENCY=0
     -- Inputs
     MUX_uxn_c_l384_c16_1957_cond <= VAR_MUX_uxn_c_l384_c16_1957_cond;
     MUX_uxn_c_l384_c16_1957_iftrue <= VAR_MUX_uxn_c_l384_c16_1957_iftrue;
     MUX_uxn_c_l384_c16_1957_iffalse <= VAR_MUX_uxn_c_l384_c16_1957_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l384_c16_1957_return_output := MUX_uxn_c_l384_c16_1957_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l414_c115_7b02_cond := VAR_BIN_OP_EQ_uxn_c_l414_c115_0a74_return_output;
     VAR_step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_fe03_return_output;
     VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_left := VAR_MUX_uxn_c_l384_c16_1957_return_output;
     VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iftrue := VAR_MUX_uxn_c_l384_c16_1957_return_output;
     -- step_cpu[uxn_c_l391_c21_c936] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l391_c21_c936_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value <= VAR_step_cpu_uxn_c_l391_c21_c936_previous_ram_read_value;
     step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read <= VAR_step_cpu_uxn_c_l391_c21_c936_previous_device_ram_read;
     step_cpu_uxn_c_l391_c21_c936_controller0_buttons <= VAR_step_cpu_uxn_c_l391_c21_c936_controller0_buttons;
     step_cpu_uxn_c_l391_c21_c936_is_new_frame <= VAR_step_cpu_uxn_c_l391_c21_c936_is_new_frame;
     step_cpu_uxn_c_l391_c21_c936_screen_vector <= VAR_step_cpu_uxn_c_l391_c21_c936_screen_vector;
     step_cpu_uxn_c_l391_c21_c936_controller_vector <= VAR_step_cpu_uxn_c_l391_c21_c936_controller_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l391_c21_c936_return_output := step_cpu_uxn_c_l391_c21_c936_return_output;

     -- boot_check_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l375_c2_bc16_cond <= VAR_boot_check_MUX_uxn_c_l375_c2_bc16_cond;
     boot_check_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iftrue;
     boot_check_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_boot_check_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l375_c2_bc16_return_output := boot_check_MUX_uxn_c_l375_c2_bc16_return_output;

     -- BIN_OP_EQ[uxn_c_l388_c15_ae91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l388_c15_ae91_left <= VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_left;
     BIN_OP_EQ_uxn_c_l388_c15_ae91_right <= VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output := BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output;

     -- MUX[uxn_c_l414_c115_7b02] LATENCY=0
     -- Inputs
     MUX_uxn_c_l414_c115_7b02_cond <= VAR_MUX_uxn_c_l414_c115_7b02_cond;
     MUX_uxn_c_l414_c115_7b02_iftrue <= VAR_MUX_uxn_c_l414_c115_7b02_iftrue;
     MUX_uxn_c_l414_c115_7b02_iffalse <= VAR_MUX_uxn_c_l414_c115_7b02_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l414_c115_7b02_return_output := MUX_uxn_c_l414_c115_7b02_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l388_c15_4a1c_cond := VAR_BIN_OP_EQ_uxn_c_l388_c15_ae91_return_output;
     VAR_step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap := VAR_MUX_uxn_c_l414_c115_7b02_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_step_cpu_uxn_c_l391_c21_c936_return_output;
     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l394_c24_eb2e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_eb2e_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.device_ram_address;

     -- cpu_step_result_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_cond;
     cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iftrue;
     cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output := cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l397_c19_3641] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_3641_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.is_vram_write;

     -- MUX[uxn_c_l388_c15_4a1c] LATENCY=0
     -- Inputs
     MUX_uxn_c_l388_c15_4a1c_cond <= VAR_MUX_uxn_c_l388_c15_4a1c_cond;
     MUX_uxn_c_l388_c15_4a1c_iftrue <= VAR_MUX_uxn_c_l388_c15_4a1c_iftrue;
     MUX_uxn_c_l388_c15_4a1c_iffalse <= VAR_MUX_uxn_c_l388_c15_4a1c_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l388_c15_4a1c_return_output := MUX_uxn_c_l388_c15_4a1c_return_output;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l393_c14_f4ab] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_f4ab_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.u16_addr;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l392_c18_78a7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_78a7_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l398_c22_2c13] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_2c13_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_c417 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_c417_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l395_c25_531b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_531b_return_output := VAR_step_cpu_uxn_c_l391_c21_c936_return_output.is_device_ram_write;

     -- Submodule level 4
     VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_f4ab_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_531b_return_output;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_78a7_return_output;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_3641_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_2c13_return_output;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_eb2e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_c417_return_output;
     VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_c417_return_output;
     VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iftrue := VAR_MUX_uxn_c_l388_c15_4a1c_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output;
     -- ram_write_value_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l375_c2_bc16_cond <= VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_cond;
     ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iftrue;
     ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output := ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;

     -- is_ram_write_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l375_c2_bc16_cond <= VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_cond;
     is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue;
     is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output := is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;

     -- is_device_ram_write_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_cond;
     is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iftrue;
     is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output := is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;

     -- device_ram_address_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l375_c2_bc16_cond <= VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_cond;
     device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iftrue;
     device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output := device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output;

     -- is_vram_write_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l375_c2_bc16_cond <= VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_cond;
     is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iftrue;
     is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output := is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d[uxn_c_l414_c144_3a0f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_3a0f_return_output := VAR_cpu_step_result_MUX_uxn_c_l375_c2_bc16_return_output.swap_buffers;

     -- u16_addr_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l375_c2_bc16_cond <= VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_cond;
     u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iftrue;
     u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_return_output := u16_addr_MUX_uxn_c_l375_c2_bc16_return_output;

     -- vram_write_layer_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_cond;
     vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iftrue;
     vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output := vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output;

     -- vram_value_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l375_c2_bc16_cond <= VAR_vram_value_MUX_uxn_c_l375_c2_bc16_cond;
     vram_value_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iftrue;
     vram_value_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_vram_value_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l375_c2_bc16_return_output := vram_value_MUX_uxn_c_l375_c2_bc16_return_output;

     -- is_booted_MUX[uxn_c_l375_c2_bc16] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l375_c2_bc16_cond <= VAR_is_booted_MUX_uxn_c_l375_c2_bc16_cond;
     is_booted_MUX_uxn_c_l375_c2_bc16_iftrue <= VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iftrue;
     is_booted_MUX_uxn_c_l375_c2_bc16_iffalse <= VAR_is_booted_MUX_uxn_c_l375_c2_bc16_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l375_c2_bc16_return_output := is_booted_MUX_uxn_c_l375_c2_bc16_return_output;

     -- Submodule level 5
     VAR_step_gpu_uxn_c_l414_c20_4395_swap_buffers := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_3a0f_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_3ee8_device_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_3ee8_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_4c45_write_enable := VAR_is_ram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_step_gpu_uxn_c_l414_c20_4395_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_3ee8_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_4c45_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_4c45_ram_address := VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_step_gpu_uxn_c_l414_c20_4395_vram_address := VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_step_gpu_uxn_c_l414_c20_4395_vram_value := VAR_vram_value_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l375_c2_bc16_return_output;
     VAR_step_gpu_uxn_c_l414_c20_4395_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l375_c2_bc16_return_output;
     -- main_ram_update[uxn_c_l402_c19_4c45] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l402_c19_4c45_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l402_c19_4c45_ram_address <= VAR_main_ram_update_uxn_c_l402_c19_4c45_ram_address;
     main_ram_update_uxn_c_l402_c19_4c45_value <= VAR_main_ram_update_uxn_c_l402_c19_4c45_value;
     main_ram_update_uxn_c_l402_c19_4c45_write_enable <= VAR_main_ram_update_uxn_c_l402_c19_4c45_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l402_c19_4c45_return_output := main_ram_update_uxn_c_l402_c19_4c45_return_output;

     -- step_gpu[uxn_c_l414_c20_4395] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l414_c20_4395_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area <= VAR_step_gpu_uxn_c_l414_c20_4395_is_active_drawing_area;
     step_gpu_uxn_c_l414_c20_4395_is_vram_write <= VAR_step_gpu_uxn_c_l414_c20_4395_is_vram_write;
     step_gpu_uxn_c_l414_c20_4395_vram_write_layer <= VAR_step_gpu_uxn_c_l414_c20_4395_vram_write_layer;
     step_gpu_uxn_c_l414_c20_4395_vram_address <= VAR_step_gpu_uxn_c_l414_c20_4395_vram_address;
     step_gpu_uxn_c_l414_c20_4395_vram_value <= VAR_step_gpu_uxn_c_l414_c20_4395_vram_value;
     step_gpu_uxn_c_l414_c20_4395_cycle <= VAR_step_gpu_uxn_c_l414_c20_4395_cycle;
     step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap <= VAR_step_gpu_uxn_c_l414_c20_4395_enable_buffer_swap;
     step_gpu_uxn_c_l414_c20_4395_swap_buffers <= VAR_step_gpu_uxn_c_l414_c20_4395_swap_buffers;
     -- Outputs
     VAR_step_gpu_uxn_c_l414_c20_4395_return_output := step_gpu_uxn_c_l414_c20_4395_return_output;

     -- vector_snoop[uxn_c_l416_c12_cd92] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l416_c12_cd92_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l416_c12_cd92_device_ram_address <= VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_address;
     vector_snoop_uxn_c_l416_c12_cd92_device_ram_value <= VAR_vector_snoop_uxn_c_l416_c12_cd92_device_ram_value;
     vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write <= VAR_vector_snoop_uxn_c_l416_c12_cd92_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l416_c12_cd92_return_output := vector_snoop_uxn_c_l416_c12_cd92_return_output;

     -- device_ram_update[uxn_c_l408_c26_3ee8] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l408_c26_3ee8_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l408_c26_3ee8_device_address <= VAR_device_ram_update_uxn_c_l408_c26_3ee8_device_address;
     device_ram_update_uxn_c_l408_c26_3ee8_value <= VAR_device_ram_update_uxn_c_l408_c26_3ee8_value;
     device_ram_update_uxn_c_l408_c26_3ee8_write_enable <= VAR_device_ram_update_uxn_c_l408_c26_3ee8_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l408_c26_3ee8_return_output := device_ram_update_uxn_c_l408_c26_3ee8_return_output;

     -- Submodule level 6
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l408_c26_3ee8_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l402_c19_4c45_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l414_c20_4395_return_output;
     REG_VAR_vectors := VAR_vector_snoop_uxn_c_l416_c12_cd92_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l415_c92_2c59] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_2c59_return_output := VAR_step_gpu_uxn_c_l414_c20_4395_return_output.color;

     -- Submodule level 7
     VAR_palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_2c59_return_output;
     -- palette_snoop[uxn_c_l415_c20_75c3] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l415_c20_75c3_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l415_c20_75c3_device_ram_address <= VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_address;
     palette_snoop_uxn_c_l415_c20_75c3_device_ram_value <= VAR_palette_snoop_uxn_c_l415_c20_75c3_device_ram_value;
     palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write <= VAR_palette_snoop_uxn_c_l415_c20_75c3_is_device_ram_write;
     palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color <= VAR_palette_snoop_uxn_c_l415_c20_75c3_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l415_c20_75c3_return_output := palette_snoop_uxn_c_l415_c20_75c3_return_output;

     -- Submodule level 8
     VAR_return_output := VAR_palette_snoop_uxn_c_l415_c20_75c3_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l415_c20_75c3_return_output;
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
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_u16_addr <= REG_VAR_u16_addr;
REG_COMB_vectors <= REG_VAR_vectors;
REG_COMB_ram_write_value <= REG_VAR_ram_write_value;
REG_COMB_ram_read_value <= REG_VAR_ram_read_value;
REG_COMB_device_ram_address <= REG_VAR_device_ram_address;
REG_COMB_device_ram_read_value <= REG_VAR_device_ram_read_value;
REG_COMB_is_device_ram_write <= REG_VAR_is_device_ram_write;
REG_COMB_is_vram_write <= REG_VAR_is_vram_write;
REG_COMB_vram_write_layer <= REG_VAR_vram_write_layer;
REG_COMB_vram_value <= REG_VAR_vram_value;
REG_COMB_cycle_count <= REG_VAR_cycle_count;
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
     is_ram_write <= REG_COMB_is_ram_write;
     u16_addr <= REG_COMB_u16_addr;
     vectors <= REG_COMB_vectors;
     ram_write_value <= REG_COMB_ram_write_value;
     ram_read_value <= REG_COMB_ram_read_value;
     device_ram_address <= REG_COMB_device_ram_address;
     device_ram_read_value <= REG_COMB_device_ram_read_value;
     is_device_ram_write <= REG_COMB_is_device_ram_write;
     is_vram_write <= REG_COMB_is_vram_write;
     vram_write_layer <= REG_COMB_vram_write_layer;
     vram_value <= REG_COMB_vram_value;
     cycle_count <= REG_COMB_cycle_count;
 end if;
 end if;
end process;

end arch;
