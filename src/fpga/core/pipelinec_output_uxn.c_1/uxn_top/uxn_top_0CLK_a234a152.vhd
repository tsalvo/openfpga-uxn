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
-- Submodules: 34
entity uxn_top_0CLK_a234a152 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_a234a152;
architecture arch of uxn_top_0CLK_a234a152 is
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
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
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
signal REG_COMB_screen_vector : unsigned(15 downto 0);
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
-- UNARY_OP_NOT[uxn_c_l352_c7_fbd9]
signal UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l367_c1_bb6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l352_c2_225b]
signal u16_addr_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_225b_return_output : unsigned(15 downto 0);

-- is_vram_write_MUX[uxn_c_l352_c2_225b]
signal is_vram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l352_c2_225b]
signal is_ram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l352_c2_225b]
signal vram_write_layer_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l352_c2_225b]
signal vram_value_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);

-- is_booted_MUX[uxn_c_l352_c2_225b]
signal is_booted_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l352_c2_225b]
signal ram_write_value_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);

-- cpu_step_result_MUX[uxn_c_l352_c2_225b]
signal cpu_step_result_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output : cpu_step_result_t;

-- is_device_ram_write_MUX[uxn_c_l352_c2_225b]
signal is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l352_c2_225b]
signal device_ram_address_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);

-- boot_check_MUX[uxn_c_l352_c2_225b]
signal boot_check_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_225b_return_output : unsigned(23 downto 0);

-- CONST_SR_8[uxn_c_l361_c54_6e64]
signal CONST_SR_8_uxn_c_l361_c54_6e64_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_c_l361_c54_6e64_return_output : unsigned(15 downto 0);

-- BIN_OP_NEQ[uxn_c_l361_c44_d193]
signal BIN_OP_NEQ_uxn_c_l361_c44_d193_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_c_l361_c44_d193_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l361_c77_f06d]
signal BIN_OP_PLUS_uxn_c_l361_c77_f06d_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c77_f06d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l361_c44_995d]
signal MUX_uxn_c_l361_c44_995d_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l361_c44_995d_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c44_995d_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c44_995d_return_output : unsigned(23 downto 0);

-- MUX[uxn_c_l361_c16_0e47]
signal MUX_uxn_c_l361_c16_0e47_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l361_c16_0e47_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c16_0e47_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c16_0e47_return_output : unsigned(23 downto 0);

-- BIN_OP_EQ[uxn_c_l362_c16_75a3]
signal BIN_OP_EQ_uxn_c_l362_c16_75a3_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l362_c16_75a3_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l362_c16_e8fc]
signal MUX_uxn_c_l362_c16_e8fc_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l362_c16_e8fc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l362_c16_e8fc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l362_c16_e8fc_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l364_c16_747f]
signal MUX_uxn_c_l364_c16_747f_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l364_c16_747f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l364_c16_747f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l364_c16_747f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l364_c3_2008]
signal BIN_OP_PLUS_uxn_c_l364_c3_2008_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l364_c3_2008_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output : unsigned(16 downto 0);

-- MUX[uxn_c_l365_c21_1a60]
signal MUX_uxn_c_l365_c21_1a60_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l365_c21_1a60_iftrue : unsigned(7 downto 0);
signal MUX_uxn_c_l365_c21_1a60_iffalse : unsigned(7 downto 0);
signal MUX_uxn_c_l365_c21_1a60_return_output : unsigned(7 downto 0);

-- step_cpu[uxn_c_l368_c21_cec5]
signal step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l368_c21_cec5_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l368_c21_cec5_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l368_c21_cec5_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l379_c19_649a]
signal main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l379_c19_649a_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l379_c19_649a_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l379_c19_649a_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l379_c19_649a_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l385_c26_8acb]
signal device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l385_c26_8acb_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l385_c26_8acb_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l385_c26_8acb_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l385_c26_8acb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l391_c115_6fb7]
signal BIN_OP_EQ_uxn_c_l391_c115_6fb7_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l391_c115_6fb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l391_c115_798e]
signal MUX_uxn_c_l391_c115_798e_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l391_c115_798e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l391_c115_798e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l391_c115_798e_return_output : unsigned(0 downto 0);

-- step_gpu[uxn_c_l391_c20_7fdf]
signal step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_cycle : unsigned(31 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_swap_buffers : unsigned(0 downto 0);
signal step_gpu_uxn_c_l391_c20_7fdf_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l392_c20_b450]
signal palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l392_c20_b450_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l392_c20_b450_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l392_c20_b450_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l392_c20_b450_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l393_c18_be8f]
signal vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l393_c18_be8f_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l393_c18_be8f_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l393_c18_be8f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l395_c2_9d5e]
signal BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output : unsigned(32 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l352_c7_fbd9
UNARY_OP_NOT_uxn_c_l352_c7_fbd9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr,
UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output);

-- u16_addr_MUX_uxn_c_l352_c2_225b
u16_addr_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l352_c2_225b_cond,
u16_addr_MUX_uxn_c_l352_c2_225b_iftrue,
u16_addr_MUX_uxn_c_l352_c2_225b_iffalse,
u16_addr_MUX_uxn_c_l352_c2_225b_return_output);

-- is_vram_write_MUX_uxn_c_l352_c2_225b
is_vram_write_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l352_c2_225b_cond,
is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue,
is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse,
is_vram_write_MUX_uxn_c_l352_c2_225b_return_output);

-- is_ram_write_MUX_uxn_c_l352_c2_225b
is_ram_write_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l352_c2_225b_cond,
is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue,
is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse,
is_ram_write_MUX_uxn_c_l352_c2_225b_return_output);

-- vram_write_layer_MUX_uxn_c_l352_c2_225b
vram_write_layer_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l352_c2_225b_cond,
vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue,
vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse,
vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output);

-- vram_value_MUX_uxn_c_l352_c2_225b
vram_value_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l352_c2_225b_cond,
vram_value_MUX_uxn_c_l352_c2_225b_iftrue,
vram_value_MUX_uxn_c_l352_c2_225b_iffalse,
vram_value_MUX_uxn_c_l352_c2_225b_return_output);

-- is_booted_MUX_uxn_c_l352_c2_225b
is_booted_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l352_c2_225b_cond,
is_booted_MUX_uxn_c_l352_c2_225b_iftrue,
is_booted_MUX_uxn_c_l352_c2_225b_iffalse,
is_booted_MUX_uxn_c_l352_c2_225b_return_output);

-- ram_write_value_MUX_uxn_c_l352_c2_225b
ram_write_value_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l352_c2_225b_cond,
ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue,
ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse,
ram_write_value_MUX_uxn_c_l352_c2_225b_return_output);

-- cpu_step_result_MUX_uxn_c_l352_c2_225b
cpu_step_result_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l352_c2_225b_cond,
cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue,
cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse,
cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output);

-- is_device_ram_write_MUX_uxn_c_l352_c2_225b
is_device_ram_write_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond,
is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue,
is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse,
is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output);

-- device_ram_address_MUX_uxn_c_l352_c2_225b
device_ram_address_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l352_c2_225b_cond,
device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue,
device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse,
device_ram_address_MUX_uxn_c_l352_c2_225b_return_output);

-- boot_check_MUX_uxn_c_l352_c2_225b
boot_check_MUX_uxn_c_l352_c2_225b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l352_c2_225b_cond,
boot_check_MUX_uxn_c_l352_c2_225b_iftrue,
boot_check_MUX_uxn_c_l352_c2_225b_iffalse,
boot_check_MUX_uxn_c_l352_c2_225b_return_output);

-- CONST_SR_8_uxn_c_l361_c54_6e64
CONST_SR_8_uxn_c_l361_c54_6e64 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_c_l361_c54_6e64_x,
CONST_SR_8_uxn_c_l361_c54_6e64_return_output);

-- BIN_OP_NEQ_uxn_c_l361_c44_d193
BIN_OP_NEQ_uxn_c_l361_c44_d193 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_c_l361_c44_d193_left,
BIN_OP_NEQ_uxn_c_l361_c44_d193_right,
BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output);

-- BIN_OP_PLUS_uxn_c_l361_c77_f06d
BIN_OP_PLUS_uxn_c_l361_c77_f06d : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l361_c77_f06d_left,
BIN_OP_PLUS_uxn_c_l361_c77_f06d_right,
BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output);

-- MUX_uxn_c_l361_c44_995d
MUX_uxn_c_l361_c44_995d : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l361_c44_995d_cond,
MUX_uxn_c_l361_c44_995d_iftrue,
MUX_uxn_c_l361_c44_995d_iffalse,
MUX_uxn_c_l361_c44_995d_return_output);

-- MUX_uxn_c_l361_c16_0e47
MUX_uxn_c_l361_c16_0e47 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l361_c16_0e47_cond,
MUX_uxn_c_l361_c16_0e47_iftrue,
MUX_uxn_c_l361_c16_0e47_iffalse,
MUX_uxn_c_l361_c16_0e47_return_output);

-- BIN_OP_EQ_uxn_c_l362_c16_75a3
BIN_OP_EQ_uxn_c_l362_c16_75a3 : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l362_c16_75a3_left,
BIN_OP_EQ_uxn_c_l362_c16_75a3_right,
BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output);

-- MUX_uxn_c_l362_c16_e8fc
MUX_uxn_c_l362_c16_e8fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l362_c16_e8fc_cond,
MUX_uxn_c_l362_c16_e8fc_iftrue,
MUX_uxn_c_l362_c16_e8fc_iffalse,
MUX_uxn_c_l362_c16_e8fc_return_output);

-- MUX_uxn_c_l364_c16_747f
MUX_uxn_c_l364_c16_747f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l364_c16_747f_cond,
MUX_uxn_c_l364_c16_747f_iftrue,
MUX_uxn_c_l364_c16_747f_iffalse,
MUX_uxn_c_l364_c16_747f_return_output);

-- BIN_OP_PLUS_uxn_c_l364_c3_2008
BIN_OP_PLUS_uxn_c_l364_c3_2008 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l364_c3_2008_left,
BIN_OP_PLUS_uxn_c_l364_c3_2008_right,
BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output);

-- MUX_uxn_c_l365_c21_1a60
MUX_uxn_c_l365_c21_1a60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_c_l365_c21_1a60_cond,
MUX_uxn_c_l365_c21_1a60_iftrue,
MUX_uxn_c_l365_c21_1a60_iffalse,
MUX_uxn_c_l365_c21_1a60_return_output);

-- step_cpu_uxn_c_l368_c21_cec5
step_cpu_uxn_c_l368_c21_cec5 : entity work.step_cpu_0CLK_761eb34a port map (
clk,
step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE,
step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value,
step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read,
step_cpu_uxn_c_l368_c21_cec5_use_vector,
step_cpu_uxn_c_l368_c21_cec5_vector,
step_cpu_uxn_c_l368_c21_cec5_return_output);

-- main_ram_update_uxn_c_l379_c19_649a
main_ram_update_uxn_c_l379_c19_649a : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE,
main_ram_update_uxn_c_l379_c19_649a_ram_address,
main_ram_update_uxn_c_l379_c19_649a_value,
main_ram_update_uxn_c_l379_c19_649a_write_enable,
main_ram_update_uxn_c_l379_c19_649a_return_output);

-- device_ram_update_uxn_c_l385_c26_8acb
device_ram_update_uxn_c_l385_c26_8acb : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE,
device_ram_update_uxn_c_l385_c26_8acb_device_address,
device_ram_update_uxn_c_l385_c26_8acb_value,
device_ram_update_uxn_c_l385_c26_8acb_write_enable,
device_ram_update_uxn_c_l385_c26_8acb_return_output);

-- BIN_OP_EQ_uxn_c_l391_c115_6fb7
BIN_OP_EQ_uxn_c_l391_c115_6fb7 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l391_c115_6fb7_left,
BIN_OP_EQ_uxn_c_l391_c115_6fb7_right,
BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output);

-- MUX_uxn_c_l391_c115_798e
MUX_uxn_c_l391_c115_798e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l391_c115_798e_cond,
MUX_uxn_c_l391_c115_798e_iftrue,
MUX_uxn_c_l391_c115_798e_iffalse,
MUX_uxn_c_l391_c115_798e_return_output);

-- step_gpu_uxn_c_l391_c20_7fdf
step_gpu_uxn_c_l391_c20_7fdf : entity work.step_gpu_0CLK_a341b2ce port map (
clk,
step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE,
step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area,
step_gpu_uxn_c_l391_c20_7fdf_is_vram_write,
step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer,
step_gpu_uxn_c_l391_c20_7fdf_vram_address,
step_gpu_uxn_c_l391_c20_7fdf_vram_value,
step_gpu_uxn_c_l391_c20_7fdf_cycle,
step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap,
step_gpu_uxn_c_l391_c20_7fdf_swap_buffers,
step_gpu_uxn_c_l391_c20_7fdf_return_output);

-- palette_snoop_uxn_c_l392_c20_b450
palette_snoop_uxn_c_l392_c20_b450 : entity work.palette_snoop_0CLK_ddbb7dc6 port map (
clk,
palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE,
palette_snoop_uxn_c_l392_c20_b450_device_ram_address,
palette_snoop_uxn_c_l392_c20_b450_device_ram_value,
palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write,
palette_snoop_uxn_c_l392_c20_b450_gpu_step_color,
palette_snoop_uxn_c_l392_c20_b450_return_output);

-- vector_snoop_uxn_c_l393_c18_be8f
vector_snoop_uxn_c_l393_c18_be8f : entity work.vector_snoop_0CLK_10d8c973 port map (
clk,
vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE,
vector_snoop_uxn_c_l393_c18_be8f_device_ram_address,
vector_snoop_uxn_c_l393_c18_be8f_device_ram_value,
vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write,
vector_snoop_uxn_c_l393_c18_be8f_return_output);

-- BIN_OP_PLUS_uxn_c_l395_c2_9d5e
BIN_OP_PLUS_uxn_c_l395_c2_9d5e : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left,
BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right,
BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output);



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
 cycle_count,
 -- All submodule outputs
 UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output,
 u16_addr_MUX_uxn_c_l352_c2_225b_return_output,
 is_vram_write_MUX_uxn_c_l352_c2_225b_return_output,
 is_ram_write_MUX_uxn_c_l352_c2_225b_return_output,
 vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output,
 vram_value_MUX_uxn_c_l352_c2_225b_return_output,
 is_booted_MUX_uxn_c_l352_c2_225b_return_output,
 ram_write_value_MUX_uxn_c_l352_c2_225b_return_output,
 cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output,
 is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output,
 device_ram_address_MUX_uxn_c_l352_c2_225b_return_output,
 boot_check_MUX_uxn_c_l352_c2_225b_return_output,
 CONST_SR_8_uxn_c_l361_c54_6e64_return_output,
 BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output,
 BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output,
 MUX_uxn_c_l361_c44_995d_return_output,
 MUX_uxn_c_l361_c16_0e47_return_output,
 BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output,
 MUX_uxn_c_l362_c16_e8fc_return_output,
 MUX_uxn_c_l364_c16_747f_return_output,
 BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output,
 MUX_uxn_c_l365_c21_1a60_return_output,
 step_cpu_uxn_c_l368_c21_cec5_return_output,
 main_ram_update_uxn_c_l379_c19_649a_return_output,
 device_ram_update_uxn_c_l385_c26_8acb_return_output,
 BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output,
 MUX_uxn_c_l391_c115_798e_return_output,
 step_gpu_uxn_c_l391_c20_7fdf_return_output,
 palette_snoop_uxn_c_l392_c20_b450_return_output,
 vector_snoop_uxn_c_l393_c18_be8f_return_output,
 BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l364_c3_0e15 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_225b_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_225b_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_225b_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_225b_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_225b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_0e47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_0e47_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_0e47_iffalse : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l361_c44_995d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l361_c54_6e64_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_c_l361_c54_6e64_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_c_l361_c44_53c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c44_995d_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l361_c44_995d_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l361_c44_995d_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_0e47_return_output : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l362_c16_e8fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l362_c16_e8fc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l362_c16_e8fc_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l362_c16_e8fc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_left : unsigned(15 downto 0);
 variable VAR_MUX_uxn_c_l364_c16_747f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l364_c16_747f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l364_c16_747f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l364_c16_747f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l365_c21_1a60_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l365_c21_1a60_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l365_c21_1a60_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_c_l365_c21_1a60_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l368_c69_144a_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l368_c21_cec5_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l369_c18_4b10_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l370_c14_b224_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l371_c24_f716_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l372_c25_54cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l374_c19_971f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l375_c22_a13c_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l379_c19_649a_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l379_c19_649a_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l379_c19_649a_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l379_c19_649a_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l385_c26_8acb_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l385_c26_8acb_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l385_c26_8acb_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l385_c26_8acb_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_cycle : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_swap_buffers : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l391_c115_798e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l391_c115_798e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l391_c115_798e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l391_c115_798e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l391_c143_34da_return_output : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l391_c20_7fdf_return_output : gpu_step_result_t;
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l392_c92_a02f_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l392_c20_b450_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l393_c18_be8f_return_output : unsigned(15 downto 0);
 variable VAR_cycle_count_uxn_c_l395_c2_2bf0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output : unsigned(32 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l376_l373_DUPLICATE_dbf5_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_boot_check : unsigned(23 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_cpu_step_result : cpu_step_result_t;
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
  REG_VAR_screen_vector := screen_vector;
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
     VAR_MUX_uxn_c_l362_c16_e8fc_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l391_c115_798e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_right := to_unsigned(16777215, 24);
     VAR_MUX_uxn_c_l364_c16_747f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l365_c21_1a60_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_c_l362_c16_e8fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l364_c16_747f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l361_c44_995d_iffalse := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l361_c16_0e47_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_MUX_uxn_c_l391_c115_798e_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l352_c2_225b_iffalse := boot_check;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue := cpu_step_result;
     VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left := cycle_count;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_cycle := cycle_count;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue := device_ram_address;
     VAR_step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l352_c2_225b_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue := is_device_ram_write;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue := is_vram_write;
     VAR_step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value := ram_read_value;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l361_c16_0e47_cond := VAR_rom_load_valid_byte;
     VAR_MUX_uxn_c_l365_c21_1a60_iffalse := VAR_rom_load_value;
     VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_left := screen_vector;
     VAR_step_cpu_uxn_c_l368_c21_cec5_vector := screen_vector;
     VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_left := u16_addr;
     VAR_CONST_SR_8_uxn_c_l361_c54_6e64_x := u16_addr;
     VAR_vram_value_MUX_uxn_c_l352_c2_225b_iftrue := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l395_c2_9d5e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left <= VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_left;
     BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right <= VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output := BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output;

     -- CONST_SR_8[uxn_c_l361_c54_6e64] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_c_l361_c54_6e64_x <= VAR_CONST_SR_8_uxn_c_l361_c54_6e64_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_c_l361_c54_6e64_return_output := CONST_SR_8_uxn_c_l361_c54_6e64_return_output;

     -- BIN_OP_EQ[uxn_c_l391_c115_6fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l391_c115_6fb7_left <= VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_left;
     BIN_OP_EQ_uxn_c_l391_c115_6fb7_right <= VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output := BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l368_c69_144a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l368_c69_144a_return_output := gpu_step_result.is_new_frame;

     -- BIN_OP_PLUS[uxn_c_l361_c77_f06d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l361_c77_f06d_left <= VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_left;
     BIN_OP_PLUS_uxn_c_l361_c77_f06d_right <= VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output := BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output;

     -- UNARY_OP_NOT[uxn_c_l352_c7_fbd9] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr <= VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output := UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_c_l391_c115_798e_cond := VAR_BIN_OP_EQ_uxn_c_l391_c115_6fb7_return_output;
     VAR_MUX_uxn_c_l361_c44_995d_iftrue := resize(VAR_BIN_OP_PLUS_uxn_c_l361_c77_f06d_return_output, 24);
     VAR_cycle_count_uxn_c_l395_c2_2bf0 := resize(VAR_BIN_OP_PLUS_uxn_c_l395_c2_9d5e_return_output, 32);
     VAR_step_cpu_uxn_c_l368_c21_cec5_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l368_c69_144a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_boot_check_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_is_booted_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_u16_addr_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_vram_value_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_fbd9_return_output;
     REG_VAR_cycle_count := VAR_cycle_count_uxn_c_l395_c2_2bf0;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l367_c1_bb6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output;

     -- MUX[uxn_c_l391_c115_798e] LATENCY=0
     -- Inputs
     MUX_uxn_c_l391_c115_798e_cond <= VAR_MUX_uxn_c_l391_c115_798e_cond;
     MUX_uxn_c_l391_c115_798e_iftrue <= VAR_MUX_uxn_c_l391_c115_798e_iftrue;
     MUX_uxn_c_l391_c115_798e_iffalse <= VAR_MUX_uxn_c_l391_c115_798e_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l391_c115_798e_return_output := MUX_uxn_c_l391_c115_798e_return_output;

     -- CAST_TO_uint8_t[uxn_c_l361_c44_53c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_c_l361_c44_53c1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_c_l361_c54_6e64_return_output);

     -- Submodule level 2
     VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_left := VAR_CAST_TO_uint8_t_uxn_c_l361_c44_53c1_return_output;
     VAR_step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_bb6d_return_output;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap := VAR_MUX_uxn_c_l391_c115_798e_return_output;
     -- BIN_OP_NEQ[uxn_c_l361_c44_d193] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_c_l361_c44_d193_left <= VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_left;
     BIN_OP_NEQ_uxn_c_l361_c44_d193_right <= VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output := BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output;

     -- step_cpu[uxn_c_l368_c21_cec5] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l368_c21_cec5_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value <= VAR_step_cpu_uxn_c_l368_c21_cec5_previous_ram_read_value;
     step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read <= VAR_step_cpu_uxn_c_l368_c21_cec5_previous_device_ram_read;
     step_cpu_uxn_c_l368_c21_cec5_use_vector <= VAR_step_cpu_uxn_c_l368_c21_cec5_use_vector;
     step_cpu_uxn_c_l368_c21_cec5_vector <= VAR_step_cpu_uxn_c_l368_c21_cec5_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l368_c21_cec5_return_output := step_cpu_uxn_c_l368_c21_cec5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l361_c44_995d_cond := VAR_BIN_OP_NEQ_uxn_c_l361_c44_d193_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output;
     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l376_l373_DUPLICATE_dbf5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l376_l373_DUPLICATE_dbf5_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l375_c22_a13c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l375_c22_a13c_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l372_c25_54cb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l372_c25_54cb_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l374_c19_971f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l374_c19_971f_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.is_vram_write;

     -- MUX[uxn_c_l361_c44_995d] LATENCY=0
     -- Inputs
     MUX_uxn_c_l361_c44_995d_cond <= VAR_MUX_uxn_c_l361_c44_995d_cond;
     MUX_uxn_c_l361_c44_995d_iftrue <= VAR_MUX_uxn_c_l361_c44_995d_iftrue;
     MUX_uxn_c_l361_c44_995d_iffalse <= VAR_MUX_uxn_c_l361_c44_995d_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l361_c44_995d_return_output := MUX_uxn_c_l361_c44_995d_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l369_c18_4b10] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l369_c18_4b10_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.is_ram_write;

     -- cpu_step_result_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l352_c2_225b_cond <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_cond;
     cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iftrue;
     cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output := cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l370_c14_b224] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l370_c14_b224_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.u16_addr;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l371_c24_f716] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l371_c24_f716_return_output := VAR_step_cpu_uxn_c_l368_c21_cec5_return_output.device_ram_address;

     -- Submodule level 4
     VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l370_c14_b224_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l372_c25_54cb_return_output;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l369_c18_4b10_return_output;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l374_c19_971f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l375_c22_a13c_return_output;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l371_c24_f716_return_output;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l376_l373_DUPLICATE_dbf5_return_output;
     VAR_vram_value_MUX_uxn_c_l352_c2_225b_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l376_l373_DUPLICATE_dbf5_return_output;
     VAR_MUX_uxn_c_l361_c16_0e47_iffalse := VAR_MUX_uxn_c_l361_c44_995d_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output;
     -- MUX[uxn_c_l361_c16_0e47] LATENCY=0
     -- Inputs
     MUX_uxn_c_l361_c16_0e47_cond <= VAR_MUX_uxn_c_l361_c16_0e47_cond;
     MUX_uxn_c_l361_c16_0e47_iftrue <= VAR_MUX_uxn_c_l361_c16_0e47_iftrue;
     MUX_uxn_c_l361_c16_0e47_iffalse <= VAR_MUX_uxn_c_l361_c16_0e47_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l361_c16_0e47_return_output := MUX_uxn_c_l361_c16_0e47_return_output;

     -- device_ram_address_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l352_c2_225b_cond <= VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_cond;
     device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iftrue;
     device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output := device_ram_address_MUX_uxn_c_l352_c2_225b_return_output;

     -- vram_write_layer_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l352_c2_225b_cond <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_cond;
     vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iftrue;
     vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output := vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d[uxn_c_l391_c143_34da] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l391_c143_34da_return_output := VAR_cpu_step_result_MUX_uxn_c_l352_c2_225b_return_output.swap_buffers;

     -- is_vram_write_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l352_c2_225b_cond <= VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_cond;
     is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iftrue;
     is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_return_output := is_vram_write_MUX_uxn_c_l352_c2_225b_return_output;

     -- vram_value_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l352_c2_225b_cond <= VAR_vram_value_MUX_uxn_c_l352_c2_225b_cond;
     vram_value_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_vram_value_MUX_uxn_c_l352_c2_225b_iftrue;
     vram_value_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_vram_value_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l352_c2_225b_return_output := vram_value_MUX_uxn_c_l352_c2_225b_return_output;

     -- is_device_ram_write_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_cond;
     is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iftrue;
     is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output := is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output;

     -- Submodule level 5
     VAR_step_gpu_uxn_c_l391_c20_7fdf_swap_buffers := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l391_c143_34da_return_output;
     VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_left := VAR_MUX_uxn_c_l361_c16_0e47_return_output;
     VAR_boot_check_MUX_uxn_c_l352_c2_225b_iftrue := VAR_MUX_uxn_c_l361_c16_0e47_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_device_ram_update_uxn_c_l385_c26_8acb_device_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_device_ram_update_uxn_c_l385_c26_8acb_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_value := VAR_vram_value_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l352_c2_225b_return_output;
     -- boot_check_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l352_c2_225b_cond <= VAR_boot_check_MUX_uxn_c_l352_c2_225b_cond;
     boot_check_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_boot_check_MUX_uxn_c_l352_c2_225b_iftrue;
     boot_check_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_boot_check_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l352_c2_225b_return_output := boot_check_MUX_uxn_c_l352_c2_225b_return_output;

     -- BIN_OP_EQ[uxn_c_l362_c16_75a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l362_c16_75a3_left <= VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_left;
     BIN_OP_EQ_uxn_c_l362_c16_75a3_right <= VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output := BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_c_l362_c16_e8fc_cond := VAR_BIN_OP_EQ_uxn_c_l362_c16_75a3_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l352_c2_225b_return_output;
     -- MUX[uxn_c_l362_c16_e8fc] LATENCY=0
     -- Inputs
     MUX_uxn_c_l362_c16_e8fc_cond <= VAR_MUX_uxn_c_l362_c16_e8fc_cond;
     MUX_uxn_c_l362_c16_e8fc_iftrue <= VAR_MUX_uxn_c_l362_c16_e8fc_iftrue;
     MUX_uxn_c_l362_c16_e8fc_iffalse <= VAR_MUX_uxn_c_l362_c16_e8fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l362_c16_e8fc_return_output := MUX_uxn_c_l362_c16_e8fc_return_output;

     -- Submodule level 7
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right := VAR_MUX_uxn_c_l362_c16_e8fc_return_output;
     VAR_MUX_uxn_c_l365_c21_1a60_cond := VAR_MUX_uxn_c_l362_c16_e8fc_return_output;
     VAR_is_booted_MUX_uxn_c_l352_c2_225b_iftrue := VAR_MUX_uxn_c_l362_c16_e8fc_return_output;
     -- BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output;

     -- is_booted_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l352_c2_225b_cond <= VAR_is_booted_MUX_uxn_c_l352_c2_225b_cond;
     is_booted_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_is_booted_MUX_uxn_c_l352_c2_225b_iftrue;
     is_booted_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_is_booted_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l352_c2_225b_return_output := is_booted_MUX_uxn_c_l352_c2_225b_return_output;

     -- MUX[uxn_c_l365_c21_1a60] LATENCY=0
     -- Inputs
     MUX_uxn_c_l365_c21_1a60_cond <= VAR_MUX_uxn_c_l365_c21_1a60_cond;
     MUX_uxn_c_l365_c21_1a60_iftrue <= VAR_MUX_uxn_c_l365_c21_1a60_iftrue;
     MUX_uxn_c_l365_c21_1a60_iffalse <= VAR_MUX_uxn_c_l365_c21_1a60_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l365_c21_1a60_return_output := MUX_uxn_c_l365_c21_1a60_return_output;

     -- Submodule level 8
     VAR_MUX_uxn_c_l364_c16_747f_cond := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_c_l364_l363_DUPLICATE_e14e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue := VAR_MUX_uxn_c_l365_c21_1a60_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l352_c2_225b_return_output;
     -- MUX[uxn_c_l364_c16_747f] LATENCY=0
     -- Inputs
     MUX_uxn_c_l364_c16_747f_cond <= VAR_MUX_uxn_c_l364_c16_747f_cond;
     MUX_uxn_c_l364_c16_747f_iftrue <= VAR_MUX_uxn_c_l364_c16_747f_iftrue;
     MUX_uxn_c_l364_c16_747f_iffalse <= VAR_MUX_uxn_c_l364_c16_747f_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l364_c16_747f_return_output := MUX_uxn_c_l364_c16_747f_return_output;

     -- is_ram_write_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l352_c2_225b_cond <= VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_cond;
     is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iftrue;
     is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_return_output := is_ram_write_MUX_uxn_c_l352_c2_225b_return_output;

     -- ram_write_value_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l352_c2_225b_cond <= VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_cond;
     ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iftrue;
     ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output := ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;

     -- Submodule level 9
     VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_right := VAR_MUX_uxn_c_l364_c16_747f_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_main_ram_update_uxn_c_l379_c19_649a_write_enable := VAR_is_ram_write_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_device_ram_update_uxn_c_l385_c26_8acb_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_main_ram_update_uxn_c_l379_c19_649a_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_225b_return_output;
     -- vector_snoop[uxn_c_l393_c18_be8f] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l393_c18_be8f_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l393_c18_be8f_device_ram_address <= VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_address;
     vector_snoop_uxn_c_l393_c18_be8f_device_ram_value <= VAR_vector_snoop_uxn_c_l393_c18_be8f_device_ram_value;
     vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write <= VAR_vector_snoop_uxn_c_l393_c18_be8f_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l393_c18_be8f_return_output := vector_snoop_uxn_c_l393_c18_be8f_return_output;

     -- BIN_OP_PLUS[uxn_c_l364_c3_2008] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l364_c3_2008_left <= VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_left;
     BIN_OP_PLUS_uxn_c_l364_c3_2008_right <= VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output := BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output;

     -- device_ram_update[uxn_c_l385_c26_8acb] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l385_c26_8acb_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l385_c26_8acb_device_address <= VAR_device_ram_update_uxn_c_l385_c26_8acb_device_address;
     device_ram_update_uxn_c_l385_c26_8acb_value <= VAR_device_ram_update_uxn_c_l385_c26_8acb_value;
     device_ram_update_uxn_c_l385_c26_8acb_write_enable <= VAR_device_ram_update_uxn_c_l385_c26_8acb_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l385_c26_8acb_return_output := device_ram_update_uxn_c_l385_c26_8acb_return_output;

     -- Submodule level 10
     VAR_u16_addr_uxn_c_l364_c3_0e15 := resize(VAR_BIN_OP_PLUS_uxn_c_l364_c3_2008_return_output, 16);
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l385_c26_8acb_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l393_c18_be8f_return_output;
     VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iftrue := VAR_u16_addr_uxn_c_l364_c3_0e15;
     -- u16_addr_MUX[uxn_c_l352_c2_225b] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l352_c2_225b_cond <= VAR_u16_addr_MUX_uxn_c_l352_c2_225b_cond;
     u16_addr_MUX_uxn_c_l352_c2_225b_iftrue <= VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iftrue;
     u16_addr_MUX_uxn_c_l352_c2_225b_iffalse <= VAR_u16_addr_MUX_uxn_c_l352_c2_225b_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l352_c2_225b_return_output := u16_addr_MUX_uxn_c_l352_c2_225b_return_output;

     -- Submodule level 11
     VAR_main_ram_update_uxn_c_l379_c19_649a_ram_address := VAR_u16_addr_MUX_uxn_c_l352_c2_225b_return_output;
     VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_address := VAR_u16_addr_MUX_uxn_c_l352_c2_225b_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l352_c2_225b_return_output;
     -- main_ram_update[uxn_c_l379_c19_649a] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l379_c19_649a_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l379_c19_649a_ram_address <= VAR_main_ram_update_uxn_c_l379_c19_649a_ram_address;
     main_ram_update_uxn_c_l379_c19_649a_value <= VAR_main_ram_update_uxn_c_l379_c19_649a_value;
     main_ram_update_uxn_c_l379_c19_649a_write_enable <= VAR_main_ram_update_uxn_c_l379_c19_649a_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l379_c19_649a_return_output := main_ram_update_uxn_c_l379_c19_649a_return_output;

     -- step_gpu[uxn_c_l391_c20_7fdf] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l391_c20_7fdf_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area <= VAR_step_gpu_uxn_c_l391_c20_7fdf_is_active_drawing_area;
     step_gpu_uxn_c_l391_c20_7fdf_is_vram_write <= VAR_step_gpu_uxn_c_l391_c20_7fdf_is_vram_write;
     step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer <= VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_write_layer;
     step_gpu_uxn_c_l391_c20_7fdf_vram_address <= VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_address;
     step_gpu_uxn_c_l391_c20_7fdf_vram_value <= VAR_step_gpu_uxn_c_l391_c20_7fdf_vram_value;
     step_gpu_uxn_c_l391_c20_7fdf_cycle <= VAR_step_gpu_uxn_c_l391_c20_7fdf_cycle;
     step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap <= VAR_step_gpu_uxn_c_l391_c20_7fdf_enable_buffer_swap;
     step_gpu_uxn_c_l391_c20_7fdf_swap_buffers <= VAR_step_gpu_uxn_c_l391_c20_7fdf_swap_buffers;
     -- Outputs
     VAR_step_gpu_uxn_c_l391_c20_7fdf_return_output := step_gpu_uxn_c_l391_c20_7fdf_return_output;

     -- Submodule level 12
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l379_c19_649a_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l391_c20_7fdf_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l392_c92_a02f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l392_c92_a02f_return_output := VAR_step_gpu_uxn_c_l391_c20_7fdf_return_output.color;

     -- Submodule level 13
     VAR_palette_snoop_uxn_c_l392_c20_b450_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l392_c92_a02f_return_output;
     -- palette_snoop[uxn_c_l392_c20_b450] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l392_c20_b450_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l392_c20_b450_device_ram_address <= VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_address;
     palette_snoop_uxn_c_l392_c20_b450_device_ram_value <= VAR_palette_snoop_uxn_c_l392_c20_b450_device_ram_value;
     palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write <= VAR_palette_snoop_uxn_c_l392_c20_b450_is_device_ram_write;
     palette_snoop_uxn_c_l392_c20_b450_gpu_step_color <= VAR_palette_snoop_uxn_c_l392_c20_b450_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l392_c20_b450_return_output := palette_snoop_uxn_c_l392_c20_b450_return_output;

     -- Submodule level 14
     VAR_return_output := VAR_palette_snoop_uxn_c_l392_c20_b450_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l392_c20_b450_return_output;
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
REG_COMB_screen_vector <= REG_VAR_screen_vector;
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
     screen_vector <= REG_COMB_screen_vector;
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
