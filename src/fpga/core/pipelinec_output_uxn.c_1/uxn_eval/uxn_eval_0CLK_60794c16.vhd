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
-- Submodules: 37
entity uxn_eval_0CLK_60794c16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_60794c16;
architecture arch of uxn_eval_0CLK_60794c16 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal main_clock_cycle : unsigned(31 downto 0) := to_unsigned(0, 32);
signal input_code : unsigned(3 downto 0) := to_unsigned(0, 4);
signal uxn_eval_result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal is_active_drawing_area : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_booted : unsigned(0 downto 0) := to_unsigned(0, 1);
signal gpu_step_result : gpu_step_result_t := gpu_step_result_t_NULL;
signal is_active_fill : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_ram_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal ram_address : unsigned(15 downto 0) := to_unsigned(0, 16);
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
signal REG_COMB_input_code : unsigned(3 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_active_drawing_area : unsigned(0 downto 0);
signal REG_COMB_is_booted : unsigned(0 downto 0);
signal REG_COMB_gpu_step_result : gpu_step_result_t;
signal REG_COMB_is_active_fill : unsigned(0 downto 0);
signal REG_COMB_is_ram_write : unsigned(0 downto 0);
signal REG_COMB_ram_address : unsigned(15 downto 0);
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
-- CONST_SR_12[uxn_c_l294_c15_9d37]
signal CONST_SR_12_uxn_c_l294_c15_9d37_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l294_c15_9d37_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l296_c6_a387]
signal BIN_OP_EQ_uxn_c_l296_c6_a387_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l296_c6_a387_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l296_c6_a387_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l296_c2_c433]
signal is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l297_c28_1b00]
signal CONST_SR_2_uxn_c_l297_c28_1b00_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l297_c28_1b00_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l297_c28_fe28]
signal BIN_OP_AND_uxn_c_l297_c28_fe28_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l297_c28_fe28_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l297_c28_fe28_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l300_c7_6456]
signal UNARY_OP_NOT_uxn_c_l300_c7_6456_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l300_c1_0de4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l306_c9_dc6f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l300_c2_8c05]
signal is_booted_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l300_c2_8c05]
signal is_ram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l300_c2_8c05]
signal is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l300_c2_8c05]
signal device_ram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l300_c2_8c05]
signal is_vram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l300_c2_8c05]
signal vram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(31 downto 0);

-- vram_value_MUX[uxn_c_l300_c2_8c05]
signal vram_value_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(1 downto 0);

-- ram_address_MUX[uxn_c_l300_c2_8c05]
signal ram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(15 downto 0);

-- ram_write_value_MUX[uxn_c_l300_c2_8c05]
signal ram_write_value_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l300_c2_8c05]
signal vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);

-- step_boot[uxn_c_l301_c41_62de]
signal step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l301_c41_62de_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l306_c14_2195]
signal UNARY_OP_NOT_uxn_c_l306_c14_2195_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l306_c1_3a5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output : unsigned(0 downto 0);

-- is_ram_write_MUX[uxn_c_l306_c9_dc6f]
signal is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l306_c9_dc6f]
signal is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l306_c9_dc6f]
signal device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l306_c9_dc6f]
signal is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l306_c9_dc6f]
signal vram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(31 downto 0);

-- vram_value_MUX[uxn_c_l306_c9_dc6f]
signal vram_value_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(1 downto 0);

-- ram_address_MUX[uxn_c_l306_c9_dc6f]
signal ram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(15 downto 0);

-- ram_write_value_MUX[uxn_c_l306_c9_dc6f]
signal ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(7 downto 0);

-- vram_write_layer_MUX[uxn_c_l306_c9_dc6f]
signal vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l307_c39_f5d8]
signal step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l307_c39_f5d8_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l319_c19_d029]
signal main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l319_c19_d029_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l319_c19_d029_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l319_c19_d029_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l319_c19_d029_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l325_c26_e94a]
signal device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l325_c26_e94a_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l325_c26_e94a_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l325_c26_e94a_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l325_c26_e94a_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l331_c20_fae7]
signal step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l331_c20_fae7_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l333_c20_b5aa]
signal palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l333_c20_b5aa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l335_c2_65ec]
signal BIN_OP_PLUS_uxn_c_l335_c2_65ec_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l335_c2_65ec_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l294_c15_9d37
CONST_SR_12_uxn_c_l294_c15_9d37 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l294_c15_9d37_x,
CONST_SR_12_uxn_c_l294_c15_9d37_return_output);

-- BIN_OP_EQ_uxn_c_l296_c6_a387
BIN_OP_EQ_uxn_c_l296_c6_a387 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l296_c6_a387_left,
BIN_OP_EQ_uxn_c_l296_c6_a387_right,
BIN_OP_EQ_uxn_c_l296_c6_a387_return_output);

-- is_active_drawing_area_MUX_uxn_c_l296_c2_c433
is_active_drawing_area_MUX_uxn_c_l296_c2_c433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond,
is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue,
is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse,
is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output);

-- CONST_SR_2_uxn_c_l297_c28_1b00
CONST_SR_2_uxn_c_l297_c28_1b00 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l297_c28_1b00_x,
CONST_SR_2_uxn_c_l297_c28_1b00_return_output);

-- BIN_OP_AND_uxn_c_l297_c28_fe28
BIN_OP_AND_uxn_c_l297_c28_fe28 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l297_c28_fe28_left,
BIN_OP_AND_uxn_c_l297_c28_fe28_right,
BIN_OP_AND_uxn_c_l297_c28_fe28_return_output);

-- UNARY_OP_NOT_uxn_c_l300_c7_6456
UNARY_OP_NOT_uxn_c_l300_c7_6456 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l300_c7_6456_expr,
UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4
TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f
FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output);

-- is_booted_MUX_uxn_c_l300_c2_8c05
is_booted_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l300_c2_8c05_cond,
is_booted_MUX_uxn_c_l300_c2_8c05_iftrue,
is_booted_MUX_uxn_c_l300_c2_8c05_iffalse,
is_booted_MUX_uxn_c_l300_c2_8c05_return_output);

-- is_ram_write_MUX_uxn_c_l300_c2_8c05
is_ram_write_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l300_c2_8c05_cond,
is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue,
is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse,
is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output);

-- is_device_ram_write_MUX_uxn_c_l300_c2_8c05
is_device_ram_write_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond,
is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue,
is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse,
is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output);

-- device_ram_address_MUX_uxn_c_l300_c2_8c05
device_ram_address_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l300_c2_8c05_cond,
device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue,
device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse,
device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output);

-- is_vram_write_MUX_uxn_c_l300_c2_8c05
is_vram_write_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l300_c2_8c05_cond,
is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue,
is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse,
is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output);

-- vram_address_MUX_uxn_c_l300_c2_8c05
vram_address_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l300_c2_8c05_cond,
vram_address_MUX_uxn_c_l300_c2_8c05_iftrue,
vram_address_MUX_uxn_c_l300_c2_8c05_iffalse,
vram_address_MUX_uxn_c_l300_c2_8c05_return_output);

-- vram_value_MUX_uxn_c_l300_c2_8c05
vram_value_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l300_c2_8c05_cond,
vram_value_MUX_uxn_c_l300_c2_8c05_iftrue,
vram_value_MUX_uxn_c_l300_c2_8c05_iffalse,
vram_value_MUX_uxn_c_l300_c2_8c05_return_output);

-- ram_address_MUX_uxn_c_l300_c2_8c05
ram_address_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l300_c2_8c05_cond,
ram_address_MUX_uxn_c_l300_c2_8c05_iftrue,
ram_address_MUX_uxn_c_l300_c2_8c05_iffalse,
ram_address_MUX_uxn_c_l300_c2_8c05_return_output);

-- ram_write_value_MUX_uxn_c_l300_c2_8c05
ram_write_value_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l300_c2_8c05_cond,
ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue,
ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse,
ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output);

-- vram_write_layer_MUX_uxn_c_l300_c2_8c05
vram_write_layer_MUX_uxn_c_l300_c2_8c05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond,
vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue,
vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse,
vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output);

-- step_boot_uxn_c_l301_c41_62de
step_boot_uxn_c_l301_c41_62de : entity work.step_boot_0CLK_e08689a7 port map (
clk,
step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE,
step_boot_uxn_c_l301_c41_62de_return_output);

-- UNARY_OP_NOT_uxn_c_l306_c14_2195
UNARY_OP_NOT_uxn_c_l306_c14_2195 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l306_c14_2195_expr,
UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output);

-- is_ram_write_MUX_uxn_c_l306_c9_dc6f
is_ram_write_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond,
is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue,
is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse,
is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output);

-- is_device_ram_write_MUX_uxn_c_l306_c9_dc6f
is_device_ram_write_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond,
is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue,
is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse,
is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output);

-- device_ram_address_MUX_uxn_c_l306_c9_dc6f
device_ram_address_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond,
device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue,
device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse,
device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output);

-- is_vram_write_MUX_uxn_c_l306_c9_dc6f
is_vram_write_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond,
is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue,
is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse,
is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output);

-- vram_address_MUX_uxn_c_l306_c9_dc6f
vram_address_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l306_c9_dc6f_cond,
vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue,
vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse,
vram_address_MUX_uxn_c_l306_c9_dc6f_return_output);

-- vram_value_MUX_uxn_c_l306_c9_dc6f
vram_value_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l306_c9_dc6f_cond,
vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue,
vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse,
vram_value_MUX_uxn_c_l306_c9_dc6f_return_output);

-- ram_address_MUX_uxn_c_l306_c9_dc6f
ram_address_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l306_c9_dc6f_cond,
ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue,
ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse,
ram_address_MUX_uxn_c_l306_c9_dc6f_return_output);

-- ram_write_value_MUX_uxn_c_l306_c9_dc6f
ram_write_value_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond,
ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue,
ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse,
ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output);

-- vram_write_layer_MUX_uxn_c_l306_c9_dc6f
vram_write_layer_MUX_uxn_c_l306_c9_dc6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond,
vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue,
vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse,
vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output);

-- step_cpu_uxn_c_l307_c39_f5d8
step_cpu_uxn_c_l307_c39_f5d8 : entity work.step_cpu_0CLK_f8d25c58 port map (
clk,
step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE,
step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value,
step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read,
step_cpu_uxn_c_l307_c39_f5d8_return_output);

-- main_ram_update_uxn_c_l319_c19_d029
main_ram_update_uxn_c_l319_c19_d029 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE,
main_ram_update_uxn_c_l319_c19_d029_ram_address,
main_ram_update_uxn_c_l319_c19_d029_value,
main_ram_update_uxn_c_l319_c19_d029_write_enable,
main_ram_update_uxn_c_l319_c19_d029_return_output);

-- device_ram_update_uxn_c_l325_c26_e94a
device_ram_update_uxn_c_l325_c26_e94a : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE,
device_ram_update_uxn_c_l325_c26_e94a_device_address,
device_ram_update_uxn_c_l325_c26_e94a_value,
device_ram_update_uxn_c_l325_c26_e94a_write_enable,
device_ram_update_uxn_c_l325_c26_e94a_return_output);

-- step_gpu_uxn_c_l331_c20_fae7
step_gpu_uxn_c_l331_c20_fae7 : entity work.step_gpu_0CLK_57094e53 port map (
clk,
step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE,
step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area,
step_gpu_uxn_c_l331_c20_fae7_is_vram_write,
step_gpu_uxn_c_l331_c20_fae7_vram_write_layer,
step_gpu_uxn_c_l331_c20_fae7_vram_address,
step_gpu_uxn_c_l331_c20_fae7_vram_value,
step_gpu_uxn_c_l331_c20_fae7_return_output);

-- palette_snoop_uxn_c_l333_c20_b5aa
palette_snoop_uxn_c_l333_c20_b5aa : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE,
palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address,
palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value,
palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write,
palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color,
palette_snoop_uxn_c_l333_c20_b5aa_return_output);

-- BIN_OP_PLUS_uxn_c_l335_c2_65ec
BIN_OP_PLUS_uxn_c_l335_c2_65ec : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l335_c2_65ec_left,
BIN_OP_PLUS_uxn_c_l335_c2_65ec_right,
BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 input,
 -- Registers
 main_clock_cycle,
 input_code,
 uxn_eval_result,
 is_active_drawing_area,
 is_booted,
 gpu_step_result,
 is_active_fill,
 is_ram_write,
 ram_address,
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
 CONST_SR_12_uxn_c_l294_c15_9d37_return_output,
 BIN_OP_EQ_uxn_c_l296_c6_a387_return_output,
 is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output,
 CONST_SR_2_uxn_c_l297_c28_1b00_return_output,
 BIN_OP_AND_uxn_c_l297_c28_fe28_return_output,
 UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output,
 is_booted_MUX_uxn_c_l300_c2_8c05_return_output,
 is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output,
 is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output,
 device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output,
 is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output,
 vram_address_MUX_uxn_c_l300_c2_8c05_return_output,
 vram_value_MUX_uxn_c_l300_c2_8c05_return_output,
 ram_address_MUX_uxn_c_l300_c2_8c05_return_output,
 ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output,
 vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output,
 step_boot_uxn_c_l301_c41_62de_return_output,
 UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output,
 is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output,
 is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output,
 device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output,
 is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output,
 vram_address_MUX_uxn_c_l306_c9_dc6f_return_output,
 vram_value_MUX_uxn_c_l306_c9_dc6f_return_output,
 ram_address_MUX_uxn_c_l306_c9_dc6f_return_output,
 ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output,
 vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output,
 step_cpu_uxn_c_l307_c39_f5d8_return_output,
 main_ram_update_uxn_c_l319_c19_d029_return_output,
 device_ram_update_uxn_c_l325_c26_e94a_return_output,
 step_gpu_uxn_c_l331_c20_fae7_return_output,
 palette_snoop_uxn_c_l333_c20_b5aa_return_output,
 BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l294_c2_38f9 : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l294_c15_9d37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l294_c15_9d37_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l297_c3_eb2a : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l297_c28_1b00_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l297_c28_1b00_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l301_c41_62de_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l302_c18_3b74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l303_c17_a9f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l304_c21_de0b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l305_c15_7a14_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l308_c18_441d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l309_c17_b4f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l310_c24_780a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l311_c25_761b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l313_c19_2302_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l314_c22_1aa3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l315_c18_c428_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l316_c16_bbc5_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l319_c19_d029_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l319_c19_d029_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l319_c19_d029_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l319_c19_d029_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l325_c26_e94a_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l325_c26_e94a_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l325_c26_e94a_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l325_c26_e94a_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l331_c20_fae7_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l332_c19_224b_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l333_c92_782b_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l333_c20_b5aa_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l335_c2_b5a5 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l312_l316_DUPLICATE_eb92_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_clock_cycle : unsigned(31 downto 0);
variable REG_VAR_input_code : unsigned(3 downto 0);
variable REG_VAR_uxn_eval_result : unsigned(15 downto 0);
variable REG_VAR_is_active_drawing_area : unsigned(0 downto 0);
variable REG_VAR_is_booted : unsigned(0 downto 0);
variable REG_VAR_gpu_step_result : gpu_step_result_t;
variable REG_VAR_is_active_fill : unsigned(0 downto 0);
variable REG_VAR_is_ram_write : unsigned(0 downto 0);
variable REG_VAR_ram_address : unsigned(15 downto 0);
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
  REG_VAR_input_code := input_code;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_active_drawing_area := is_active_drawing_area;
  REG_VAR_is_booted := is_booted;
  REG_VAR_gpu_step_result := gpu_step_result;
  REG_VAR_is_active_fill := is_active_fill;
  REG_VAR_is_ram_write := is_ram_write;
  REG_VAR_ram_address := ram_address;
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
     VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read := device_ram_read_value;
     VAR_CONST_SR_12_uxn_c_l294_c15_9d37_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l297_c28_1b00_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_left := main_clock_cycle;
     VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse := ram_write_value;
     VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l335_c2_65ec] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l335_c2_65ec_left <= VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_left;
     BIN_OP_PLUS_uxn_c_l335_c2_65ec_right <= VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output := BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output;

     -- CONST_SR_12[uxn_c_l294_c15_9d37] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l294_c15_9d37_x <= VAR_CONST_SR_12_uxn_c_l294_c15_9d37_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l294_c15_9d37_return_output := CONST_SR_12_uxn_c_l294_c15_9d37_return_output;

     -- UNARY_OP_NOT[uxn_c_l306_c14_2195] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l306_c14_2195_expr <= VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output := UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;

     -- CONST_SR_2[uxn_c_l297_c28_1b00] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l297_c28_1b00_x <= VAR_CONST_SR_2_uxn_c_l297_c28_1b00_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l297_c28_1b00_return_output := CONST_SR_2_uxn_c_l297_c28_1b00_return_output;

     -- UNARY_OP_NOT[uxn_c_l300_c7_6456] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l300_c7_6456_expr <= VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output := UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l335_c2_b5a5 := resize(VAR_BIN_OP_PLUS_uxn_c_l335_c2_65ec_return_output, 32);
     VAR_input_code_uxn_c_l294_c2_38f9 := resize(VAR_CONST_SR_12_uxn_c_l294_c15_9d37_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_left := VAR_CONST_SR_2_uxn_c_l297_c28_1b00_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_is_booted_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_ram_address_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_vram_address_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_vram_value_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond := VAR_UNARY_OP_NOT_uxn_c_l300_c7_6456_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond := VAR_UNARY_OP_NOT_uxn_c_l306_c14_2195_return_output;
     VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_left := VAR_input_code_uxn_c_l294_c2_38f9;
     REG_VAR_input_code := VAR_input_code_uxn_c_l294_c2_38f9;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l335_c2_b5a5;
     -- BIN_OP_EQ[uxn_c_l296_c6_a387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l296_c6_a387_left <= VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_left;
     BIN_OP_EQ_uxn_c_l296_c6_a387_right <= VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_return_output := BIN_OP_EQ_uxn_c_l296_c6_a387_return_output;

     -- BIN_OP_AND[uxn_c_l297_c28_fe28] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l297_c28_fe28_left <= VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_left;
     BIN_OP_AND_uxn_c_l297_c28_fe28_right <= VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_return_output := BIN_OP_AND_uxn_c_l297_c28_fe28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l300_c1_0de4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l297_c3_eb2a := resize(VAR_BIN_OP_AND_uxn_c_l297_c28_fe28_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond := VAR_BIN_OP_EQ_uxn_c_l296_c6_a387_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l300_c1_0de4_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue := VAR_is_active_drawing_area_uxn_c_l297_c3_eb2a;
     -- step_boot[uxn_c_l301_c41_62de] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l301_c41_62de_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l301_c41_62de_return_output := step_boot_uxn_c_l301_c41_62de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l306_c1_3a5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output;

     -- is_active_drawing_area_MUX[uxn_c_l296_c2_c433] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_cond;
     is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iftrue;
     is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output := is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l306_c1_3a5d_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output;
     VAR_step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l296_c2_c433_return_output;
     -- step_cpu[uxn_c_l307_c39_f5d8] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l307_c39_f5d8_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value <= VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_ram_read_value;
     step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read <= VAR_step_cpu_uxn_c_l307_c39_f5d8_previous_device_ram_read;
     -- Outputs
     VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output := step_cpu_uxn_c_l307_c39_f5d8_return_output;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l303_c17_a9f6] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l303_c17_a9f6_return_output := VAR_step_boot_uxn_c_l301_c41_62de_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l302_c18_3b74] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l302_c18_3b74_return_output := VAR_step_boot_uxn_c_l301_c41_62de_return_output.is_valid_byte;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l304_c21_de0b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l304_c21_de0b_return_output := VAR_step_boot_uxn_c_l301_c41_62de_return_output.rom_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l305_c15_7a14] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l305_c15_7a14_return_output := VAR_step_boot_uxn_c_l301_c41_62de_return_output.is_finished;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l303_c17_a9f6_return_output;
     VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l305_c15_7a14_return_output;
     VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l302_c18_3b74_return_output;
     VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l304_c21_de0b_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l308_c18_441d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l308_c18_441d_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.is_ram_write;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l315_c18_c428] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l315_c18_c428_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l312_l316_DUPLICATE_eb92 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l312_l316_DUPLICATE_eb92_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.u8_value;

     -- is_booted_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l300_c2_8c05_cond <= VAR_is_booted_MUX_uxn_c_l300_c2_8c05_cond;
     is_booted_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iftrue;
     is_booted_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_is_booted_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l300_c2_8c05_return_output := is_booted_MUX_uxn_c_l300_c2_8c05_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l311_c25_761b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l311_c25_761b_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l314_c22_1aa3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l314_c22_1aa3_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l310_c24_780a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l310_c24_780a_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l309_c17_b4f0] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l309_c17_b4f0_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l313_c19_2302] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l313_c19_2302_return_output := VAR_step_cpu_uxn_c_l307_c39_f5d8_return_output.is_vram_write;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l309_c17_b4f0_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l311_c25_761b_return_output;
     VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l308_c18_441d_return_output;
     VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l313_c19_2302_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l314_c22_1aa3_return_output;
     VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l315_c18_c428_return_output;
     VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l310_c24_780a_return_output;
     VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l312_l316_DUPLICATE_eb92_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l300_c2_8c05_return_output;
     -- vram_address_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_cond;
     vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iftrue;
     vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_return_output := vram_address_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- ram_address_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_cond;
     ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue;
     ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output := ram_address_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- is_device_ram_write_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_cond;
     is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue;
     is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output := is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- device_ram_address_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_cond;
     device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iftrue;
     device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output := device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- ram_write_value_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_cond;
     ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iftrue;
     ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output := ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- is_ram_write_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_cond;
     is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iftrue;
     is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output := is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- is_vram_write_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_cond;
     is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iftrue;
     is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output := is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- vram_write_layer_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_cond;
     vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iftrue;
     vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output := vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- CAST_TO_uint2_t[uxn_c_l316_c16_bbc5] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l316_c16_bbc5_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l312_l316_DUPLICATE_eb92_return_output);

     -- Submodule level 6
     VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l316_c16_bbc5_return_output;
     VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_device_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_is_ram_write_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_is_vram_write_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_ram_address_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_ram_write_value_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_vram_address_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_vram_write_layer_MUX_uxn_c_l306_c9_dc6f_return_output;
     -- ram_address_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l300_c2_8c05_cond <= VAR_ram_address_MUX_uxn_c_l300_c2_8c05_cond;
     ram_address_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue;
     ram_address_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l300_c2_8c05_return_output := ram_address_MUX_uxn_c_l300_c2_8c05_return_output;

     -- is_ram_write_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l300_c2_8c05_cond <= VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_cond;
     is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue;
     is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output := is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;

     -- is_device_ram_write_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond <= VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_cond;
     is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iftrue;
     is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output := is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;

     -- ram_write_value_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l300_c2_8c05_cond <= VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_cond;
     ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iftrue;
     ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output := ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output;

     -- is_vram_write_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l300_c2_8c05_cond <= VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_cond;
     is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iftrue;
     is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output := is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output;

     -- device_ram_address_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l300_c2_8c05_cond <= VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_cond;
     device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iftrue;
     device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output := device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;

     -- vram_address_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l300_c2_8c05_cond <= VAR_vram_address_MUX_uxn_c_l300_c2_8c05_cond;
     vram_address_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iftrue;
     vram_address_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_vram_address_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l300_c2_8c05_return_output := vram_address_MUX_uxn_c_l300_c2_8c05_return_output;

     -- vram_value_MUX[uxn_c_l306_c9_dc6f] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l306_c9_dc6f_cond <= VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_cond;
     vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue <= VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iftrue;
     vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse <= VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_return_output := vram_value_MUX_uxn_c_l306_c9_dc6f_return_output;

     -- vram_write_layer_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond <= VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_cond;
     vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iftrue;
     vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output := vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output;

     -- Submodule level 7
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_device_ram_update_uxn_c_l325_c26_e94a_device_address := VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_device_ram_update_uxn_c_l325_c26_e94a_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_main_ram_update_uxn_c_l319_c19_d029_write_enable := VAR_is_ram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_step_gpu_uxn_c_l331_c20_fae7_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_main_ram_update_uxn_c_l319_c19_d029_ram_address := VAR_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_device_ram_update_uxn_c_l325_c26_e94a_value := VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_main_ram_update_uxn_c_l319_c19_d029_value := VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_step_gpu_uxn_c_l331_c20_fae7_vram_address := VAR_vram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l300_c2_8c05_return_output;
     VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iffalse := VAR_vram_value_MUX_uxn_c_l306_c9_dc6f_return_output;
     VAR_step_gpu_uxn_c_l331_c20_fae7_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l300_c2_8c05_return_output;
     -- vram_value_MUX[uxn_c_l300_c2_8c05] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l300_c2_8c05_cond <= VAR_vram_value_MUX_uxn_c_l300_c2_8c05_cond;
     vram_value_MUX_uxn_c_l300_c2_8c05_iftrue <= VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iftrue;
     vram_value_MUX_uxn_c_l300_c2_8c05_iffalse <= VAR_vram_value_MUX_uxn_c_l300_c2_8c05_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l300_c2_8c05_return_output := vram_value_MUX_uxn_c_l300_c2_8c05_return_output;

     -- device_ram_update[uxn_c_l325_c26_e94a] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l325_c26_e94a_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l325_c26_e94a_device_address <= VAR_device_ram_update_uxn_c_l325_c26_e94a_device_address;
     device_ram_update_uxn_c_l325_c26_e94a_value <= VAR_device_ram_update_uxn_c_l325_c26_e94a_value;
     device_ram_update_uxn_c_l325_c26_e94a_write_enable <= VAR_device_ram_update_uxn_c_l325_c26_e94a_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l325_c26_e94a_return_output := device_ram_update_uxn_c_l325_c26_e94a_return_output;

     -- main_ram_update[uxn_c_l319_c19_d029] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l319_c19_d029_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l319_c19_d029_ram_address <= VAR_main_ram_update_uxn_c_l319_c19_d029_ram_address;
     main_ram_update_uxn_c_l319_c19_d029_value <= VAR_main_ram_update_uxn_c_l319_c19_d029_value;
     main_ram_update_uxn_c_l319_c19_d029_write_enable <= VAR_main_ram_update_uxn_c_l319_c19_d029_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l319_c19_d029_return_output := main_ram_update_uxn_c_l319_c19_d029_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l325_c26_e94a_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l319_c19_d029_return_output;
     VAR_step_gpu_uxn_c_l331_c20_fae7_vram_value := VAR_vram_value_MUX_uxn_c_l300_c2_8c05_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l300_c2_8c05_return_output;
     -- step_gpu[uxn_c_l331_c20_fae7] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l331_c20_fae7_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area <= VAR_step_gpu_uxn_c_l331_c20_fae7_is_active_drawing_area;
     step_gpu_uxn_c_l331_c20_fae7_is_vram_write <= VAR_step_gpu_uxn_c_l331_c20_fae7_is_vram_write;
     step_gpu_uxn_c_l331_c20_fae7_vram_write_layer <= VAR_step_gpu_uxn_c_l331_c20_fae7_vram_write_layer;
     step_gpu_uxn_c_l331_c20_fae7_vram_address <= VAR_step_gpu_uxn_c_l331_c20_fae7_vram_address;
     step_gpu_uxn_c_l331_c20_fae7_vram_value <= VAR_step_gpu_uxn_c_l331_c20_fae7_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l331_c20_fae7_return_output := step_gpu_uxn_c_l331_c20_fae7_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l331_c20_fae7_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l333_c92_782b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l333_c92_782b_return_output := VAR_step_gpu_uxn_c_l331_c20_fae7_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l332_c19_224b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l332_c19_224b_return_output := VAR_step_gpu_uxn_c_l331_c20_fae7_return_output.is_active_fill;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l332_c19_224b_return_output;
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l333_c92_782b_return_output;
     -- palette_snoop[uxn_c_l333_c20_b5aa] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l333_c20_b5aa_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address <= VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_address;
     palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value <= VAR_palette_snoop_uxn_c_l333_c20_b5aa_device_ram_value;
     palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write <= VAR_palette_snoop_uxn_c_l333_c20_b5aa_is_device_ram_write;
     palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color <= VAR_palette_snoop_uxn_c_l333_c20_b5aa_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l333_c20_b5aa_return_output := palette_snoop_uxn_c_l333_c20_b5aa_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l333_c20_b5aa_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l333_c20_b5aa_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_main_clock_cycle <= REG_VAR_main_clock_cycle;
REG_COMB_input_code <= REG_VAR_input_code;
REG_COMB_uxn_eval_result <= REG_VAR_uxn_eval_result;
REG_COMB_is_active_drawing_area <= REG_VAR_is_active_drawing_area;
REG_COMB_is_booted <= REG_VAR_is_booted;
REG_COMB_gpu_step_result <= REG_VAR_gpu_step_result;
REG_COMB_is_active_fill <= REG_VAR_is_active_fill;
REG_COMB_is_ram_write <= REG_VAR_is_ram_write;
REG_COMB_ram_address <= REG_VAR_ram_address;
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
     input_code <= REG_COMB_input_code;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     is_active_drawing_area <= REG_COMB_is_active_drawing_area;
     is_booted <= REG_COMB_is_booted;
     gpu_step_result <= REG_COMB_gpu_step_result;
     is_active_fill <= REG_COMB_is_active_fill;
     is_ram_write <= REG_COMB_is_ram_write;
     ram_address <= REG_COMB_ram_address;
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
