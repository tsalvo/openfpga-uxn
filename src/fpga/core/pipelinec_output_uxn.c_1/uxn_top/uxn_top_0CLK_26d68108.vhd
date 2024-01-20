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
entity uxn_top_0CLK_26d68108 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_26d68108;
architecture arch of uxn_top_0CLK_26d68108 is
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
-- UNARY_OP_NOT[uxn_c_l375_c7_c507]
signal UNARY_OP_NOT_uxn_c_l375_c7_c507_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l390_c1_ae5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l375_c2_3189]
signal vram_value_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);

-- ram_write_value_MUX[uxn_c_l375_c2_3189]
signal ram_write_value_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);

-- is_booted_MUX[uxn_c_l375_c2_3189]
signal is_booted_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l375_c2_3189]
signal is_vram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l375_c2_3189]
signal is_ram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l375_c2_3189]
signal is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l375_c2_3189]
signal u16_addr_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l375_c2_3189_return_output : unsigned(15 downto 0);

-- device_ram_address_MUX[uxn_c_l375_c2_3189]
signal device_ram_address_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);

-- boot_check_MUX[uxn_c_l375_c2_3189]
signal boot_check_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l375_c2_3189_return_output : unsigned(23 downto 0);

-- vram_write_layer_MUX[uxn_c_l375_c2_3189]
signal vram_write_layer_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l375_c2_3189]
signal cpu_step_result_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output : cpu_step_result_t;

-- BIN_OP_PLUS[uxn_c_l384_c42_3365]
signal BIN_OP_PLUS_uxn_c_l384_c42_3365_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l384_c42_3365_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l384_c16_54b6]
signal MUX_uxn_c_l384_c16_54b6_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l384_c16_54b6_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l384_c16_54b6_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l384_c16_54b6_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l386_c14_7d7f]
signal BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l388_c15_cdd7]
signal BIN_OP_EQ_uxn_c_l388_c15_cdd7_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l388_c15_cdd7_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l388_c15_3f51]
signal MUX_uxn_c_l388_c15_3f51_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_3f51_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_3f51_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l388_c15_3f51_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l391_c21_a99e]
signal step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_controller0_buttons : unsigned(7 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_is_new_frame : unsigned(0 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_screen_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_controller_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l391_c21_a99e_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l402_c19_7cb7]
signal main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l402_c19_7cb7_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l402_c19_7cb7_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l402_c19_7cb7_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l402_c19_7cb7_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l408_c26_6ff5]
signal device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l408_c26_6ff5_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l408_c26_6ff5_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l408_c26_6ff5_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l408_c26_6ff5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l414_c115_c7cc]
signal BIN_OP_EQ_uxn_c_l414_c115_c7cc_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l414_c115_c7cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l414_c115_d9fe]
signal MUX_uxn_c_l414_c115_d9fe_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_d9fe_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_d9fe_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l414_c115_d9fe_return_output : unsigned(0 downto 0);

-- step_gpu[uxn_c_l414_c20_8483]
signal step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_cycle : unsigned(31 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_swap_buffers : unsigned(0 downto 0);
signal step_gpu_uxn_c_l414_c20_8483_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l415_c20_fb7a]
signal palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l415_c20_fb7a_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l416_c12_8af8]
signal vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l416_c12_8af8_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l416_c12_8af8_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l416_c12_8af8_return_output : vector_snoop_result_t;

-- BIN_OP_PLUS[uxn_c_l418_c2_ea2c]
signal BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output : unsigned(32 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l375_c7_c507
UNARY_OP_NOT_uxn_c_l375_c7_c507 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l375_c7_c507_expr,
UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output);

-- vram_value_MUX_uxn_c_l375_c2_3189
vram_value_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l375_c2_3189_cond,
vram_value_MUX_uxn_c_l375_c2_3189_iftrue,
vram_value_MUX_uxn_c_l375_c2_3189_iffalse,
vram_value_MUX_uxn_c_l375_c2_3189_return_output);

-- ram_write_value_MUX_uxn_c_l375_c2_3189
ram_write_value_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l375_c2_3189_cond,
ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue,
ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse,
ram_write_value_MUX_uxn_c_l375_c2_3189_return_output);

-- is_booted_MUX_uxn_c_l375_c2_3189
is_booted_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l375_c2_3189_cond,
is_booted_MUX_uxn_c_l375_c2_3189_iftrue,
is_booted_MUX_uxn_c_l375_c2_3189_iffalse,
is_booted_MUX_uxn_c_l375_c2_3189_return_output);

-- is_vram_write_MUX_uxn_c_l375_c2_3189
is_vram_write_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l375_c2_3189_cond,
is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue,
is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse,
is_vram_write_MUX_uxn_c_l375_c2_3189_return_output);

-- is_ram_write_MUX_uxn_c_l375_c2_3189
is_ram_write_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l375_c2_3189_cond,
is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue,
is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse,
is_ram_write_MUX_uxn_c_l375_c2_3189_return_output);

-- is_device_ram_write_MUX_uxn_c_l375_c2_3189
is_device_ram_write_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond,
is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue,
is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse,
is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output);

-- u16_addr_MUX_uxn_c_l375_c2_3189
u16_addr_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l375_c2_3189_cond,
u16_addr_MUX_uxn_c_l375_c2_3189_iftrue,
u16_addr_MUX_uxn_c_l375_c2_3189_iffalse,
u16_addr_MUX_uxn_c_l375_c2_3189_return_output);

-- device_ram_address_MUX_uxn_c_l375_c2_3189
device_ram_address_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l375_c2_3189_cond,
device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue,
device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse,
device_ram_address_MUX_uxn_c_l375_c2_3189_return_output);

-- boot_check_MUX_uxn_c_l375_c2_3189
boot_check_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l375_c2_3189_cond,
boot_check_MUX_uxn_c_l375_c2_3189_iftrue,
boot_check_MUX_uxn_c_l375_c2_3189_iffalse,
boot_check_MUX_uxn_c_l375_c2_3189_return_output);

-- vram_write_layer_MUX_uxn_c_l375_c2_3189
vram_write_layer_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l375_c2_3189_cond,
vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue,
vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse,
vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output);

-- cpu_step_result_MUX_uxn_c_l375_c2_3189
cpu_step_result_MUX_uxn_c_l375_c2_3189 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l375_c2_3189_cond,
cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue,
cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse,
cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output);

-- BIN_OP_PLUS_uxn_c_l384_c42_3365
BIN_OP_PLUS_uxn_c_l384_c42_3365 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l384_c42_3365_left,
BIN_OP_PLUS_uxn_c_l384_c42_3365_right,
BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output);

-- MUX_uxn_c_l384_c16_54b6
MUX_uxn_c_l384_c16_54b6 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l384_c16_54b6_cond,
MUX_uxn_c_l384_c16_54b6_iftrue,
MUX_uxn_c_l384_c16_54b6_iffalse,
MUX_uxn_c_l384_c16_54b6_return_output);

-- BIN_OP_PLUS_uxn_c_l386_c14_7d7f
BIN_OP_PLUS_uxn_c_l386_c14_7d7f : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left,
BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right,
BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output);

-- BIN_OP_EQ_uxn_c_l388_c15_cdd7
BIN_OP_EQ_uxn_c_l388_c15_cdd7 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l388_c15_cdd7_left,
BIN_OP_EQ_uxn_c_l388_c15_cdd7_right,
BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output);

-- MUX_uxn_c_l388_c15_3f51
MUX_uxn_c_l388_c15_3f51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l388_c15_3f51_cond,
MUX_uxn_c_l388_c15_3f51_iftrue,
MUX_uxn_c_l388_c15_3f51_iffalse,
MUX_uxn_c_l388_c15_3f51_return_output);

-- step_cpu_uxn_c_l391_c21_a99e
step_cpu_uxn_c_l391_c21_a99e : entity work.step_cpu_0CLK_950c2e4f port map (
clk,
step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE,
step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value,
step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read,
step_cpu_uxn_c_l391_c21_a99e_controller0_buttons,
step_cpu_uxn_c_l391_c21_a99e_is_new_frame,
step_cpu_uxn_c_l391_c21_a99e_screen_vector,
step_cpu_uxn_c_l391_c21_a99e_controller_vector,
step_cpu_uxn_c_l391_c21_a99e_return_output);

-- main_ram_update_uxn_c_l402_c19_7cb7
main_ram_update_uxn_c_l402_c19_7cb7 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE,
main_ram_update_uxn_c_l402_c19_7cb7_ram_address,
main_ram_update_uxn_c_l402_c19_7cb7_value,
main_ram_update_uxn_c_l402_c19_7cb7_write_enable,
main_ram_update_uxn_c_l402_c19_7cb7_return_output);

-- device_ram_update_uxn_c_l408_c26_6ff5
device_ram_update_uxn_c_l408_c26_6ff5 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE,
device_ram_update_uxn_c_l408_c26_6ff5_device_address,
device_ram_update_uxn_c_l408_c26_6ff5_value,
device_ram_update_uxn_c_l408_c26_6ff5_write_enable,
device_ram_update_uxn_c_l408_c26_6ff5_return_output);

-- BIN_OP_EQ_uxn_c_l414_c115_c7cc
BIN_OP_EQ_uxn_c_l414_c115_c7cc : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l414_c115_c7cc_left,
BIN_OP_EQ_uxn_c_l414_c115_c7cc_right,
BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output);

-- MUX_uxn_c_l414_c115_d9fe
MUX_uxn_c_l414_c115_d9fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l414_c115_d9fe_cond,
MUX_uxn_c_l414_c115_d9fe_iftrue,
MUX_uxn_c_l414_c115_d9fe_iffalse,
MUX_uxn_c_l414_c115_d9fe_return_output);

-- step_gpu_uxn_c_l414_c20_8483
step_gpu_uxn_c_l414_c20_8483 : entity work.step_gpu_0CLK_a341b2ce port map (
clk,
step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE,
step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area,
step_gpu_uxn_c_l414_c20_8483_is_vram_write,
step_gpu_uxn_c_l414_c20_8483_vram_write_layer,
step_gpu_uxn_c_l414_c20_8483_vram_address,
step_gpu_uxn_c_l414_c20_8483_vram_value,
step_gpu_uxn_c_l414_c20_8483_cycle,
step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap,
step_gpu_uxn_c_l414_c20_8483_swap_buffers,
step_gpu_uxn_c_l414_c20_8483_return_output);

-- palette_snoop_uxn_c_l415_c20_fb7a
palette_snoop_uxn_c_l415_c20_fb7a : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE,
palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address,
palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value,
palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write,
palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color,
palette_snoop_uxn_c_l415_c20_fb7a_return_output);

-- vector_snoop_uxn_c_l416_c12_8af8
vector_snoop_uxn_c_l416_c12_8af8 : entity work.vector_snoop_0CLK_9d7e88d4 port map (
clk,
vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE,
vector_snoop_uxn_c_l416_c12_8af8_device_ram_address,
vector_snoop_uxn_c_l416_c12_8af8_device_ram_value,
vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write,
vector_snoop_uxn_c_l416_c12_8af8_return_output);

-- BIN_OP_PLUS_uxn_c_l418_c2_ea2c
BIN_OP_PLUS_uxn_c_l418_c2_ea2c : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left,
BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right,
BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output);



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
 UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output,
 vram_value_MUX_uxn_c_l375_c2_3189_return_output,
 ram_write_value_MUX_uxn_c_l375_c2_3189_return_output,
 is_booted_MUX_uxn_c_l375_c2_3189_return_output,
 is_vram_write_MUX_uxn_c_l375_c2_3189_return_output,
 is_ram_write_MUX_uxn_c_l375_c2_3189_return_output,
 is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output,
 u16_addr_MUX_uxn_c_l375_c2_3189_return_output,
 device_ram_address_MUX_uxn_c_l375_c2_3189_return_output,
 boot_check_MUX_uxn_c_l375_c2_3189_return_output,
 vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output,
 cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output,
 BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output,
 MUX_uxn_c_l384_c16_54b6_return_output,
 BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output,
 BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output,
 MUX_uxn_c_l388_c15_3f51_return_output,
 step_cpu_uxn_c_l391_c21_a99e_return_output,
 main_ram_update_uxn_c_l402_c19_7cb7_return_output,
 device_ram_update_uxn_c_l408_c26_6ff5_return_output,
 BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output,
 MUX_uxn_c_l414_c115_d9fe_return_output,
 step_gpu_uxn_c_l414_c20_8483_return_output,
 palette_snoop_uxn_c_l415_c20_fb7a_return_output,
 vector_snoop_uxn_c_l416_c12_8af8_return_output,
 BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l386_c3_d458 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_3189_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_3189_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_54b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_54b6_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_54b6_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l384_c16_54b6_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_3f51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_3f51_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_3f51_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l388_c15_3f51_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_controller0_buttons : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_is_new_frame : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_screen_vector : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_controller_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_f496_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_edc8_return_output : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l391_c21_a99e_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_3df0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_3520_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_c33a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_33b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_5e00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_9549_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_7cb7_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_7cb7_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_7cb7_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l402_c19_7cb7_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_6ff5_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_6ff5_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_6ff5_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l408_c26_6ff5_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_cycle : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_swap_buffers : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_d9fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_d9fe_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_d9fe_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l414_c115_d9fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_eec0_return_output : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l414_c20_8483_return_output : gpu_step_result_t;
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_b939_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l415_c20_fb7a_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l416_c12_8af8_return_output : vector_snoop_result_t;
 variable VAR_cycle_count_uxn_c_l418_c2_f457 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_150f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_8513_return_output : unsigned(7 downto 0);
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
     VAR_MUX_uxn_c_l384_c16_54b6_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right := to_unsigned(256, 16);
     VAR_MUX_uxn_c_l414_c115_d9fe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_right := to_unsigned(16777215, 24);
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l414_c115_d9fe_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l388_c15_3f51_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l388_c15_3f51_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l375_c2_3189_iffalse := boot_check;
     VAR_step_cpu_uxn_c_l391_c21_a99e_controller0_buttons := VAR_controller0_buttons;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue := cpu_step_result;
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left := cycle_count;
     VAR_step_gpu_uxn_c_l414_c20_8483_cycle := cycle_count;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue := device_ram_address;
     VAR_step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l375_c2_3189_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue := is_device_ram_write;
     VAR_step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue := is_vram_write;
     VAR_step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value := ram_read_value;
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left := VAR_rom_load_address;
     VAR_MUX_uxn_c_l384_c16_54b6_cond := VAR_rom_load_valid_byte;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue := VAR_rom_load_valid_byte;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue := VAR_rom_load_value;
     VAR_vram_value_MUX_uxn_c_l375_c2_3189_iftrue := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue := vram_write_layer;
     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d[uxn_c_l391_c136_edc8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_edc8_return_output := vectors.controller;

     -- BIN_OP_PLUS[uxn_c_l386_c14_7d7f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left <= VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_left;
     BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right <= VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output := BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l391_c90_f496] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_f496_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l375_c7_c507] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l375_c7_c507_expr <= VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output := UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;

     -- BIN_OP_PLUS[uxn_c_l418_c2_ea2c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left <= VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_left;
     BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right <= VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output := BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output;

     -- BIN_OP_PLUS[uxn_c_l384_c42_3365] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l384_c42_3365_left <= VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_left;
     BIN_OP_PLUS_uxn_c_l384_c42_3365_right <= VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output := BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_150f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_150f_return_output := vectors.screen;

     -- Submodule level 1
     VAR_MUX_uxn_c_l384_c16_54b6_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l384_c42_3365_return_output, 24);
     VAR_u16_addr_uxn_c_l386_c3_d458 := resize(VAR_BIN_OP_PLUS_uxn_c_l386_c14_7d7f_return_output, 16);
     VAR_cycle_count_uxn_c_l418_c2_f457 := resize(VAR_BIN_OP_PLUS_uxn_c_l418_c2_ea2c_return_output, 32);
     VAR_step_cpu_uxn_c_l391_c21_a99e_controller_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l391_c136_edc8_return_output;
     VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_150f_return_output;
     VAR_step_cpu_uxn_c_l391_c21_a99e_screen_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l414_l391_DUPLICATE_150f_return_output;
     VAR_step_cpu_uxn_c_l391_c21_a99e_is_new_frame := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l391_c90_f496_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_boot_check_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_is_booted_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_u16_addr_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_vram_value_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_cond := VAR_UNARY_OP_NOT_uxn_c_l375_c7_c507_return_output;
     REG_VAR_cycle_count := VAR_cycle_count_uxn_c_l418_c2_f457;
     VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iftrue := VAR_u16_addr_uxn_c_l386_c3_d458;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l390_c1_ae5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output;

     -- MUX[uxn_c_l384_c16_54b6] LATENCY=0
     -- Inputs
     MUX_uxn_c_l384_c16_54b6_cond <= VAR_MUX_uxn_c_l384_c16_54b6_cond;
     MUX_uxn_c_l384_c16_54b6_iftrue <= VAR_MUX_uxn_c_l384_c16_54b6_iftrue;
     MUX_uxn_c_l384_c16_54b6_iffalse <= VAR_MUX_uxn_c_l384_c16_54b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l384_c16_54b6_return_output := MUX_uxn_c_l384_c16_54b6_return_output;

     -- BIN_OP_EQ[uxn_c_l414_c115_c7cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l414_c115_c7cc_left <= VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_left;
     BIN_OP_EQ_uxn_c_l414_c115_c7cc_right <= VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output := BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l414_c115_d9fe_cond := VAR_BIN_OP_EQ_uxn_c_l414_c115_c7cc_return_output;
     VAR_step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l390_c1_ae5e_return_output;
     VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_left := VAR_MUX_uxn_c_l384_c16_54b6_return_output;
     VAR_boot_check_MUX_uxn_c_l375_c2_3189_iftrue := VAR_MUX_uxn_c_l384_c16_54b6_return_output;
     -- BIN_OP_EQ[uxn_c_l388_c15_cdd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l388_c15_cdd7_left <= VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_left;
     BIN_OP_EQ_uxn_c_l388_c15_cdd7_right <= VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output := BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output;

     -- boot_check_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l375_c2_3189_cond <= VAR_boot_check_MUX_uxn_c_l375_c2_3189_cond;
     boot_check_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_boot_check_MUX_uxn_c_l375_c2_3189_iftrue;
     boot_check_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_boot_check_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l375_c2_3189_return_output := boot_check_MUX_uxn_c_l375_c2_3189_return_output;

     -- step_cpu[uxn_c_l391_c21_a99e] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l391_c21_a99e_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value <= VAR_step_cpu_uxn_c_l391_c21_a99e_previous_ram_read_value;
     step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read <= VAR_step_cpu_uxn_c_l391_c21_a99e_previous_device_ram_read;
     step_cpu_uxn_c_l391_c21_a99e_controller0_buttons <= VAR_step_cpu_uxn_c_l391_c21_a99e_controller0_buttons;
     step_cpu_uxn_c_l391_c21_a99e_is_new_frame <= VAR_step_cpu_uxn_c_l391_c21_a99e_is_new_frame;
     step_cpu_uxn_c_l391_c21_a99e_screen_vector <= VAR_step_cpu_uxn_c_l391_c21_a99e_screen_vector;
     step_cpu_uxn_c_l391_c21_a99e_controller_vector <= VAR_step_cpu_uxn_c_l391_c21_a99e_controller_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l391_c21_a99e_return_output := step_cpu_uxn_c_l391_c21_a99e_return_output;

     -- MUX[uxn_c_l414_c115_d9fe] LATENCY=0
     -- Inputs
     MUX_uxn_c_l414_c115_d9fe_cond <= VAR_MUX_uxn_c_l414_c115_d9fe_cond;
     MUX_uxn_c_l414_c115_d9fe_iftrue <= VAR_MUX_uxn_c_l414_c115_d9fe_iftrue;
     MUX_uxn_c_l414_c115_d9fe_iffalse <= VAR_MUX_uxn_c_l414_c115_d9fe_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l414_c115_d9fe_return_output := MUX_uxn_c_l414_c115_d9fe_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l388_c15_3f51_cond := VAR_BIN_OP_EQ_uxn_c_l388_c15_cdd7_return_output;
     VAR_step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap := VAR_MUX_uxn_c_l414_c115_d9fe_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l397_c19_5e00] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_5e00_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l392_c18_3df0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_3df0_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l394_c24_c33a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_c33a_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l393_c14_3520] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_3520_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.u16_addr;

     -- cpu_step_result_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l375_c2_3189_cond <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_cond;
     cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iftrue;
     cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output := cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l398_c22_9549] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_9549_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.vram_write_layer;

     -- MUX[uxn_c_l388_c15_3f51] LATENCY=0
     -- Inputs
     MUX_uxn_c_l388_c15_3f51_cond <= VAR_MUX_uxn_c_l388_c15_3f51_cond;
     MUX_uxn_c_l388_c15_3f51_iftrue <= VAR_MUX_uxn_c_l388_c15_3f51_iftrue;
     MUX_uxn_c_l388_c15_3f51_iffalse <= VAR_MUX_uxn_c_l388_c15_3f51_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l388_c15_3f51_return_output := MUX_uxn_c_l388_c15_3f51_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l395_c25_33b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_33b4_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_8513 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_8513_return_output := VAR_step_cpu_uxn_c_l391_c21_a99e_return_output.u8_value;

     -- Submodule level 4
     VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l393_c14_3520_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l395_c25_33b4_return_output;
     VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l392_c18_3df0_return_output;
     VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l397_c19_5e00_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l398_c22_9549_return_output;
     VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l394_c24_c33a_return_output;
     VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_8513_return_output;
     VAR_vram_value_MUX_uxn_c_l375_c2_3189_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l399_l396_DUPLICATE_8513_return_output;
     VAR_is_booted_MUX_uxn_c_l375_c2_3189_iftrue := VAR_MUX_uxn_c_l388_c15_3f51_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output;
     -- ram_write_value_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l375_c2_3189_cond <= VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_cond;
     ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iftrue;
     ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output := ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;

     -- vram_write_layer_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l375_c2_3189_cond <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_cond;
     vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iftrue;
     vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output := vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output;

     -- is_booted_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l375_c2_3189_cond <= VAR_is_booted_MUX_uxn_c_l375_c2_3189_cond;
     is_booted_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_is_booted_MUX_uxn_c_l375_c2_3189_iftrue;
     is_booted_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_is_booted_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l375_c2_3189_return_output := is_booted_MUX_uxn_c_l375_c2_3189_return_output;

     -- u16_addr_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l375_c2_3189_cond <= VAR_u16_addr_MUX_uxn_c_l375_c2_3189_cond;
     u16_addr_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iftrue;
     u16_addr_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_u16_addr_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l375_c2_3189_return_output := u16_addr_MUX_uxn_c_l375_c2_3189_return_output;

     -- device_ram_address_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l375_c2_3189_cond <= VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_cond;
     device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iftrue;
     device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output := device_ram_address_MUX_uxn_c_l375_c2_3189_return_output;

     -- is_ram_write_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l375_c2_3189_cond <= VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_cond;
     is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iftrue;
     is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_return_output := is_ram_write_MUX_uxn_c_l375_c2_3189_return_output;

     -- vram_value_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l375_c2_3189_cond <= VAR_vram_value_MUX_uxn_c_l375_c2_3189_cond;
     vram_value_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_vram_value_MUX_uxn_c_l375_c2_3189_iftrue;
     vram_value_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_vram_value_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l375_c2_3189_return_output := vram_value_MUX_uxn_c_l375_c2_3189_return_output;

     -- is_vram_write_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l375_c2_3189_cond <= VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_cond;
     is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iftrue;
     is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_return_output := is_vram_write_MUX_uxn_c_l375_c2_3189_return_output;

     -- is_device_ram_write_MUX[uxn_c_l375_c2_3189] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_cond;
     is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iftrue;
     is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output := is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d[uxn_c_l414_c144_eec0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_eec0_return_output := VAR_cpu_step_result_MUX_uxn_c_l375_c2_3189_return_output.swap_buffers;

     -- Submodule level 5
     VAR_step_gpu_uxn_c_l414_c20_8483_swap_buffers := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l414_c144_eec0_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_6ff5_device_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_6ff5_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_7cb7_write_enable := VAR_is_ram_write_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_step_gpu_uxn_c_l414_c20_8483_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_device_ram_update_uxn_c_l408_c26_6ff5_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_7cb7_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_main_ram_update_uxn_c_l402_c19_7cb7_ram_address := VAR_u16_addr_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_step_gpu_uxn_c_l414_c20_8483_vram_address := VAR_u16_addr_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_step_gpu_uxn_c_l414_c20_8483_vram_value := VAR_vram_value_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l375_c2_3189_return_output;
     VAR_step_gpu_uxn_c_l414_c20_8483_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l375_c2_3189_return_output;
     -- step_gpu[uxn_c_l414_c20_8483] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l414_c20_8483_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area <= VAR_step_gpu_uxn_c_l414_c20_8483_is_active_drawing_area;
     step_gpu_uxn_c_l414_c20_8483_is_vram_write <= VAR_step_gpu_uxn_c_l414_c20_8483_is_vram_write;
     step_gpu_uxn_c_l414_c20_8483_vram_write_layer <= VAR_step_gpu_uxn_c_l414_c20_8483_vram_write_layer;
     step_gpu_uxn_c_l414_c20_8483_vram_address <= VAR_step_gpu_uxn_c_l414_c20_8483_vram_address;
     step_gpu_uxn_c_l414_c20_8483_vram_value <= VAR_step_gpu_uxn_c_l414_c20_8483_vram_value;
     step_gpu_uxn_c_l414_c20_8483_cycle <= VAR_step_gpu_uxn_c_l414_c20_8483_cycle;
     step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap <= VAR_step_gpu_uxn_c_l414_c20_8483_enable_buffer_swap;
     step_gpu_uxn_c_l414_c20_8483_swap_buffers <= VAR_step_gpu_uxn_c_l414_c20_8483_swap_buffers;
     -- Outputs
     VAR_step_gpu_uxn_c_l414_c20_8483_return_output := step_gpu_uxn_c_l414_c20_8483_return_output;

     -- vector_snoop[uxn_c_l416_c12_8af8] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l416_c12_8af8_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l416_c12_8af8_device_ram_address <= VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_address;
     vector_snoop_uxn_c_l416_c12_8af8_device_ram_value <= VAR_vector_snoop_uxn_c_l416_c12_8af8_device_ram_value;
     vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write <= VAR_vector_snoop_uxn_c_l416_c12_8af8_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l416_c12_8af8_return_output := vector_snoop_uxn_c_l416_c12_8af8_return_output;

     -- device_ram_update[uxn_c_l408_c26_6ff5] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l408_c26_6ff5_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l408_c26_6ff5_device_address <= VAR_device_ram_update_uxn_c_l408_c26_6ff5_device_address;
     device_ram_update_uxn_c_l408_c26_6ff5_value <= VAR_device_ram_update_uxn_c_l408_c26_6ff5_value;
     device_ram_update_uxn_c_l408_c26_6ff5_write_enable <= VAR_device_ram_update_uxn_c_l408_c26_6ff5_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l408_c26_6ff5_return_output := device_ram_update_uxn_c_l408_c26_6ff5_return_output;

     -- main_ram_update[uxn_c_l402_c19_7cb7] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l402_c19_7cb7_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l402_c19_7cb7_ram_address <= VAR_main_ram_update_uxn_c_l402_c19_7cb7_ram_address;
     main_ram_update_uxn_c_l402_c19_7cb7_value <= VAR_main_ram_update_uxn_c_l402_c19_7cb7_value;
     main_ram_update_uxn_c_l402_c19_7cb7_write_enable <= VAR_main_ram_update_uxn_c_l402_c19_7cb7_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l402_c19_7cb7_return_output := main_ram_update_uxn_c_l402_c19_7cb7_return_output;

     -- Submodule level 6
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l408_c26_6ff5_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l402_c19_7cb7_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l414_c20_8483_return_output;
     REG_VAR_vectors := VAR_vector_snoop_uxn_c_l416_c12_8af8_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l415_c92_b939] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_b939_return_output := VAR_step_gpu_uxn_c_l414_c20_8483_return_output.color;

     -- Submodule level 7
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l415_c92_b939_return_output;
     -- palette_snoop[uxn_c_l415_c20_fb7a] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l415_c20_fb7a_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address <= VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_address;
     palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value <= VAR_palette_snoop_uxn_c_l415_c20_fb7a_device_ram_value;
     palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write <= VAR_palette_snoop_uxn_c_l415_c20_fb7a_is_device_ram_write;
     palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color <= VAR_palette_snoop_uxn_c_l415_c20_fb7a_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l415_c20_fb7a_return_output := palette_snoop_uxn_c_l415_c20_fb7a_return_output;

     -- Submodule level 8
     VAR_return_output := VAR_palette_snoop_uxn_c_l415_c20_fb7a_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l415_c20_fb7a_return_output;
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
