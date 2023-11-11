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
-- Submodules: 38
entity uxn_eval_0CLK_e5e8168e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_e5e8168e;
architecture arch of uxn_eval_0CLK_e5e8168e is
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
signal REG_COMB_input_code : unsigned(3 downto 0);
signal REG_COMB_uxn_eval_result : unsigned(15 downto 0);
signal REG_COMB_is_active_drawing_area : unsigned(0 downto 0);
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
-- CONST_SR_12[uxn_c_l325_c15_b587]
signal CONST_SR_12_uxn_c_l325_c15_b587_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l325_c15_b587_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l327_c6_9c7d]
signal BIN_OP_EQ_uxn_c_l327_c6_9c7d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c6_9c7d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l327_c2_fbe7]
signal is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l328_c28_e0b8]
signal CONST_SR_2_uxn_c_l328_c28_e0b8_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l328_c28_e0b8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l328_c28_d88a]
signal BIN_OP_AND_uxn_c_l328_c28_d88a_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l328_c28_d88a_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l328_c28_d88a_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l331_c7_4c0c]
signal UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_2df9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l337_c9_067e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l331_c2_3575]
signal is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l331_c2_3575]
signal vram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(31 downto 0);

-- is_ram_write_MUX[uxn_c_l331_c2_3575]
signal is_ram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l331_c2_3575]
signal ram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(15 downto 0);

-- device_ram_address_MUX[uxn_c_l331_c2_3575]
signal device_ram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l331_c2_3575]
signal is_vram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l331_c2_3575]
signal is_booted_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l331_c2_3575]
signal vram_write_layer_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l331_c2_3575]
signal vram_value_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_3575_return_output : unsigned(1 downto 0);

-- ram_write_value_MUX[uxn_c_l331_c2_3575]
signal ram_write_value_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_3575_return_output : unsigned(7 downto 0);

-- step_boot[uxn_c_l332_c41_9d3a]
signal step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l332_c41_9d3a_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l337_c14_b0aa]
signal UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l337_c1_2b1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l337_c9_067e]
signal is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);

-- vram_address_MUX[uxn_c_l337_c9_067e]
signal vram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(31 downto 0);

-- is_ram_write_MUX[uxn_c_l337_c9_067e]
signal is_ram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l337_c9_067e]
signal ram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(15 downto 0);

-- device_ram_address_MUX[uxn_c_l337_c9_067e]
signal device_ram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l337_c9_067e]
signal is_vram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l337_c9_067e]
signal vram_write_layer_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l337_c9_067e]
signal vram_value_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_067e_return_output : unsigned(1 downto 0);

-- ram_write_value_MUX[uxn_c_l337_c9_067e]
signal ram_write_value_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_067e_return_output : unsigned(7 downto 0);

-- step_cpu[uxn_c_l338_c39_6ee5]
signal step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l338_c39_6ee5_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l338_c39_6ee5_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l338_c39_6ee5_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l350_c19_d91b]
signal main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l350_c19_d91b_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l350_c19_d91b_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l350_c19_d91b_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l350_c19_d91b_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l356_c26_5f97]
signal device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l356_c26_5f97_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l356_c26_5f97_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l356_c26_5f97_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l356_c26_5f97_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l362_c20_dbb1]
signal step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l362_c20_dbb1_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l364_c20_165b]
signal palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l364_c20_165b_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l364_c20_165b_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l364_c20_165b_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l364_c20_165b_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l365_c18_ee93]
signal vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l365_c18_ee93_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l365_c18_ee93_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l365_c18_ee93_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l367_c2_3e34]
signal BIN_OP_PLUS_uxn_c_l367_c2_3e34_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l367_c2_3e34_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l325_c15_b587
CONST_SR_12_uxn_c_l325_c15_b587 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l325_c15_b587_x,
CONST_SR_12_uxn_c_l325_c15_b587_return_output);

-- BIN_OP_EQ_uxn_c_l327_c6_9c7d
BIN_OP_EQ_uxn_c_l327_c6_9c7d : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l327_c6_9c7d_left,
BIN_OP_EQ_uxn_c_l327_c6_9c7d_right,
BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output);

-- is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7
is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond,
is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue,
is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse,
is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output);

-- CONST_SR_2_uxn_c_l328_c28_e0b8
CONST_SR_2_uxn_c_l328_c28_e0b8 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l328_c28_e0b8_x,
CONST_SR_2_uxn_c_l328_c28_e0b8_return_output);

-- BIN_OP_AND_uxn_c_l328_c28_d88a
BIN_OP_AND_uxn_c_l328_c28_d88a : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l328_c28_d88a_left,
BIN_OP_AND_uxn_c_l328_c28_d88a_right,
BIN_OP_AND_uxn_c_l328_c28_d88a_return_output);

-- UNARY_OP_NOT_uxn_c_l331_c7_4c0c
UNARY_OP_NOT_uxn_c_l331_c7_4c0c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr,
UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output);

-- is_device_ram_write_MUX_uxn_c_l331_c2_3575
is_device_ram_write_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond,
is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue,
is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse,
is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output);

-- vram_address_MUX_uxn_c_l331_c2_3575
vram_address_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l331_c2_3575_cond,
vram_address_MUX_uxn_c_l331_c2_3575_iftrue,
vram_address_MUX_uxn_c_l331_c2_3575_iffalse,
vram_address_MUX_uxn_c_l331_c2_3575_return_output);

-- is_ram_write_MUX_uxn_c_l331_c2_3575
is_ram_write_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l331_c2_3575_cond,
is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue,
is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse,
is_ram_write_MUX_uxn_c_l331_c2_3575_return_output);

-- ram_address_MUX_uxn_c_l331_c2_3575
ram_address_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l331_c2_3575_cond,
ram_address_MUX_uxn_c_l331_c2_3575_iftrue,
ram_address_MUX_uxn_c_l331_c2_3575_iffalse,
ram_address_MUX_uxn_c_l331_c2_3575_return_output);

-- device_ram_address_MUX_uxn_c_l331_c2_3575
device_ram_address_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l331_c2_3575_cond,
device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue,
device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse,
device_ram_address_MUX_uxn_c_l331_c2_3575_return_output);

-- is_vram_write_MUX_uxn_c_l331_c2_3575
is_vram_write_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l331_c2_3575_cond,
is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue,
is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse,
is_vram_write_MUX_uxn_c_l331_c2_3575_return_output);

-- is_booted_MUX_uxn_c_l331_c2_3575
is_booted_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l331_c2_3575_cond,
is_booted_MUX_uxn_c_l331_c2_3575_iftrue,
is_booted_MUX_uxn_c_l331_c2_3575_iffalse,
is_booted_MUX_uxn_c_l331_c2_3575_return_output);

-- vram_write_layer_MUX_uxn_c_l331_c2_3575
vram_write_layer_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l331_c2_3575_cond,
vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue,
vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse,
vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output);

-- vram_value_MUX_uxn_c_l331_c2_3575
vram_value_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l331_c2_3575_cond,
vram_value_MUX_uxn_c_l331_c2_3575_iftrue,
vram_value_MUX_uxn_c_l331_c2_3575_iffalse,
vram_value_MUX_uxn_c_l331_c2_3575_return_output);

-- ram_write_value_MUX_uxn_c_l331_c2_3575
ram_write_value_MUX_uxn_c_l331_c2_3575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l331_c2_3575_cond,
ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue,
ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse,
ram_write_value_MUX_uxn_c_l331_c2_3575_return_output);

-- step_boot_uxn_c_l332_c41_9d3a
step_boot_uxn_c_l332_c41_9d3a : entity work.step_boot_0CLK_e08689a7 port map (
clk,
step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE,
step_boot_uxn_c_l332_c41_9d3a_return_output);

-- UNARY_OP_NOT_uxn_c_l337_c14_b0aa
UNARY_OP_NOT_uxn_c_l337_c14_b0aa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr,
UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output);

-- is_device_ram_write_MUX_uxn_c_l337_c9_067e
is_device_ram_write_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond,
is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue,
is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse,
is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output);

-- vram_address_MUX_uxn_c_l337_c9_067e
vram_address_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l337_c9_067e_cond,
vram_address_MUX_uxn_c_l337_c9_067e_iftrue,
vram_address_MUX_uxn_c_l337_c9_067e_iffalse,
vram_address_MUX_uxn_c_l337_c9_067e_return_output);

-- is_ram_write_MUX_uxn_c_l337_c9_067e
is_ram_write_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l337_c9_067e_cond,
is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue,
is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse,
is_ram_write_MUX_uxn_c_l337_c9_067e_return_output);

-- ram_address_MUX_uxn_c_l337_c9_067e
ram_address_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l337_c9_067e_cond,
ram_address_MUX_uxn_c_l337_c9_067e_iftrue,
ram_address_MUX_uxn_c_l337_c9_067e_iffalse,
ram_address_MUX_uxn_c_l337_c9_067e_return_output);

-- device_ram_address_MUX_uxn_c_l337_c9_067e
device_ram_address_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l337_c9_067e_cond,
device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue,
device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse,
device_ram_address_MUX_uxn_c_l337_c9_067e_return_output);

-- is_vram_write_MUX_uxn_c_l337_c9_067e
is_vram_write_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l337_c9_067e_cond,
is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue,
is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse,
is_vram_write_MUX_uxn_c_l337_c9_067e_return_output);

-- vram_write_layer_MUX_uxn_c_l337_c9_067e
vram_write_layer_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l337_c9_067e_cond,
vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue,
vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse,
vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output);

-- vram_value_MUX_uxn_c_l337_c9_067e
vram_value_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l337_c9_067e_cond,
vram_value_MUX_uxn_c_l337_c9_067e_iftrue,
vram_value_MUX_uxn_c_l337_c9_067e_iffalse,
vram_value_MUX_uxn_c_l337_c9_067e_return_output);

-- ram_write_value_MUX_uxn_c_l337_c9_067e
ram_write_value_MUX_uxn_c_l337_c9_067e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l337_c9_067e_cond,
ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue,
ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse,
ram_write_value_MUX_uxn_c_l337_c9_067e_return_output);

-- step_cpu_uxn_c_l338_c39_6ee5
step_cpu_uxn_c_l338_c39_6ee5 : entity work.step_cpu_0CLK_7e70f4df port map (
clk,
step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE,
step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value,
step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read,
step_cpu_uxn_c_l338_c39_6ee5_use_vector,
step_cpu_uxn_c_l338_c39_6ee5_vector,
step_cpu_uxn_c_l338_c39_6ee5_return_output);

-- main_ram_update_uxn_c_l350_c19_d91b
main_ram_update_uxn_c_l350_c19_d91b : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE,
main_ram_update_uxn_c_l350_c19_d91b_ram_address,
main_ram_update_uxn_c_l350_c19_d91b_value,
main_ram_update_uxn_c_l350_c19_d91b_write_enable,
main_ram_update_uxn_c_l350_c19_d91b_return_output);

-- device_ram_update_uxn_c_l356_c26_5f97
device_ram_update_uxn_c_l356_c26_5f97 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE,
device_ram_update_uxn_c_l356_c26_5f97_device_address,
device_ram_update_uxn_c_l356_c26_5f97_value,
device_ram_update_uxn_c_l356_c26_5f97_write_enable,
device_ram_update_uxn_c_l356_c26_5f97_return_output);

-- step_gpu_uxn_c_l362_c20_dbb1
step_gpu_uxn_c_l362_c20_dbb1 : entity work.step_gpu_0CLK_57cf448f port map (
clk,
step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE,
step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area,
step_gpu_uxn_c_l362_c20_dbb1_is_vram_write,
step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer,
step_gpu_uxn_c_l362_c20_dbb1_vram_address,
step_gpu_uxn_c_l362_c20_dbb1_vram_value,
step_gpu_uxn_c_l362_c20_dbb1_return_output);

-- palette_snoop_uxn_c_l364_c20_165b
palette_snoop_uxn_c_l364_c20_165b : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE,
palette_snoop_uxn_c_l364_c20_165b_device_ram_address,
palette_snoop_uxn_c_l364_c20_165b_device_ram_value,
palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write,
palette_snoop_uxn_c_l364_c20_165b_gpu_step_color,
palette_snoop_uxn_c_l364_c20_165b_return_output);

-- vector_snoop_uxn_c_l365_c18_ee93
vector_snoop_uxn_c_l365_c18_ee93 : entity work.vector_snoop_0CLK_9d359dd9 port map (
clk,
vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE,
vector_snoop_uxn_c_l365_c18_ee93_device_ram_address,
vector_snoop_uxn_c_l365_c18_ee93_device_ram_value,
vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write,
vector_snoop_uxn_c_l365_c18_ee93_return_output);

-- BIN_OP_PLUS_uxn_c_l367_c2_3e34
BIN_OP_PLUS_uxn_c_l367_c2_3e34 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l367_c2_3e34_left,
BIN_OP_PLUS_uxn_c_l367_c2_3e34_right,
BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output);



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
 CONST_SR_12_uxn_c_l325_c15_b587_return_output,
 BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output,
 is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output,
 CONST_SR_2_uxn_c_l328_c28_e0b8_return_output,
 BIN_OP_AND_uxn_c_l328_c28_d88a_return_output,
 UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output,
 is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output,
 vram_address_MUX_uxn_c_l331_c2_3575_return_output,
 is_ram_write_MUX_uxn_c_l331_c2_3575_return_output,
 ram_address_MUX_uxn_c_l331_c2_3575_return_output,
 device_ram_address_MUX_uxn_c_l331_c2_3575_return_output,
 is_vram_write_MUX_uxn_c_l331_c2_3575_return_output,
 is_booted_MUX_uxn_c_l331_c2_3575_return_output,
 vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output,
 vram_value_MUX_uxn_c_l331_c2_3575_return_output,
 ram_write_value_MUX_uxn_c_l331_c2_3575_return_output,
 step_boot_uxn_c_l332_c41_9d3a_return_output,
 UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output,
 is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output,
 vram_address_MUX_uxn_c_l337_c9_067e_return_output,
 is_ram_write_MUX_uxn_c_l337_c9_067e_return_output,
 ram_address_MUX_uxn_c_l337_c9_067e_return_output,
 device_ram_address_MUX_uxn_c_l337_c9_067e_return_output,
 is_vram_write_MUX_uxn_c_l337_c9_067e_return_output,
 vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output,
 vram_value_MUX_uxn_c_l337_c9_067e_return_output,
 ram_write_value_MUX_uxn_c_l337_c9_067e_return_output,
 step_cpu_uxn_c_l338_c39_6ee5_return_output,
 main_ram_update_uxn_c_l350_c19_d91b_return_output,
 device_ram_update_uxn_c_l356_c26_5f97_return_output,
 step_gpu_uxn_c_l362_c20_dbb1_return_output,
 palette_snoop_uxn_c_l364_c20_165b_return_output,
 vector_snoop_uxn_c_l365_c18_ee93_return_output,
 BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l325_c2_6a1e : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l325_c15_b587_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l325_c15_b587_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l328_c3_9644 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_067e_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_3575_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l332_c41_9d3a_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_bb08_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_858f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_133b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_cbfb_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_5e06_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_572f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_772e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_fc3c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_0b77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_f59d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_d78b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_0042_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l347_c16_cb65_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_d91b_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_d91b_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_d91b_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_d91b_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_5f97_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_5f97_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_5f97_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_5f97_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_dbb1_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_1e9b_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_a841_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_165b_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_ee93_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l367_c2_0cc9 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_1a65_return_output : unsigned(7 downto 0);
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
  REG_VAR_input_code := input_code;
  REG_VAR_uxn_eval_result := uxn_eval_result;
  REG_VAR_is_active_drawing_area := is_active_drawing_area;
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
     VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read := device_ram_read_value;
     VAR_CONST_SR_12_uxn_c_l325_c15_b587_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l331_c2_3575_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_left := main_clock_cycle;
     VAR_ram_address_MUX_uxn_c_l337_c9_067e_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse := ram_write_value;
     VAR_step_cpu_uxn_c_l338_c39_6ee5_vector := screen_vector;
     VAR_vram_address_MUX_uxn_c_l331_c2_3575_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l337_c9_067e_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l331_c2_3575_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l337_c9_067e_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse := vram_write_layer;
     -- CONST_SR_12[uxn_c_l325_c15_b587] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l325_c15_b587_x <= VAR_CONST_SR_12_uxn_c_l325_c15_b587_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l325_c15_b587_return_output := CONST_SR_12_uxn_c_l325_c15_b587_return_output;

     -- UNARY_OP_NOT[uxn_c_l337_c14_b0aa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr <= VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output := UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l338_c87_5e06] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_5e06_return_output := gpu_step_result.is_new_frame;

     -- UNARY_OP_NOT[uxn_c_l331_c7_4c0c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr <= VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output := UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;

     -- CONST_SR_2[uxn_c_l328_c28_e0b8] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l328_c28_e0b8_x <= VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_return_output := CONST_SR_2_uxn_c_l328_c28_e0b8_return_output;

     -- BIN_OP_PLUS[uxn_c_l367_c2_3e34] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l367_c2_3e34_left <= VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_left;
     BIN_OP_PLUS_uxn_c_l367_c2_3e34_right <= VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output := BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l367_c2_0cc9 := resize(VAR_BIN_OP_PLUS_uxn_c_l367_c2_3e34_return_output, 32);
     VAR_step_cpu_uxn_c_l338_c39_6ee5_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_5e06_return_output;
     VAR_input_code_uxn_c_l325_c2_6a1e := resize(VAR_CONST_SR_12_uxn_c_l325_c15_b587_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_left := VAR_CONST_SR_2_uxn_c_l328_c28_e0b8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_is_booted_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_ram_address_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_4c0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_ram_address_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_vram_address_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_vram_value_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_b0aa_return_output;
     VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_left := VAR_input_code_uxn_c_l325_c2_6a1e;
     REG_VAR_input_code := VAR_input_code_uxn_c_l325_c2_6a1e;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l367_c2_0cc9;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_2df9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output;

     -- BIN_OP_AND[uxn_c_l328_c28_d88a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l328_c28_d88a_left <= VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_left;
     BIN_OP_AND_uxn_c_l328_c28_d88a_right <= VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_return_output := BIN_OP_AND_uxn_c_l328_c28_d88a_return_output;

     -- BIN_OP_EQ[uxn_c_l327_c6_9c7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l327_c6_9c7d_left <= VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_left;
     BIN_OP_EQ_uxn_c_l327_c6_9c7d_right <= VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output := BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l328_c3_9644 := resize(VAR_BIN_OP_AND_uxn_c_l328_c28_d88a_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond := VAR_BIN_OP_EQ_uxn_c_l327_c6_9c7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_2df9_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue := VAR_is_active_drawing_area_uxn_c_l328_c3_9644;
     -- is_active_drawing_area_MUX[uxn_c_l327_c2_fbe7] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_cond;
     is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iftrue;
     is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output := is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output;

     -- step_boot[uxn_c_l332_c41_9d3a] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l332_c41_9d3a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l332_c41_9d3a_return_output := step_boot_uxn_c_l332_c41_9d3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l337_c1_2b1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_2b1a_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_fbe7_return_output;
     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l335_c21_133b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_133b_return_output := VAR_step_boot_uxn_c_l332_c41_9d3a_return_output.rom_byte;

     -- step_cpu[uxn_c_l338_c39_6ee5] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l338_c39_6ee5_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value <= VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_ram_read_value;
     step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read <= VAR_step_cpu_uxn_c_l338_c39_6ee5_previous_device_ram_read;
     step_cpu_uxn_c_l338_c39_6ee5_use_vector <= VAR_step_cpu_uxn_c_l338_c39_6ee5_use_vector;
     step_cpu_uxn_c_l338_c39_6ee5_vector <= VAR_step_cpu_uxn_c_l338_c39_6ee5_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output := step_cpu_uxn_c_l338_c39_6ee5_return_output;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l333_c18_bb08] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_bb08_return_output := VAR_step_boot_uxn_c_l332_c41_9d3a_return_output.is_valid_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l336_c15_cbfb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_cbfb_return_output := VAR_step_boot_uxn_c_l332_c41_9d3a_return_output.is_finished;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l334_c17_858f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_858f_return_output := VAR_step_boot_uxn_c_l332_c41_9d3a_return_output.ram_address;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l331_c2_3575_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_858f_return_output;
     VAR_is_booted_MUX_uxn_c_l331_c2_3575_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_cbfb_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_bb08_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_133b_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l344_c19_f59d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_f59d_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l345_c22_d78b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_d78b_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.vram_write_layer;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l346_c18_0042] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_0042_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l342_c25_0b77] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_0b77_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l339_c18_572f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_572f_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l341_c24_fc3c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_fc3c_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_1a65 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_1a65_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l340_c17_772e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_772e_return_output := VAR_step_cpu_uxn_c_l338_c39_6ee5_return_output.ram_address;

     -- is_booted_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l331_c2_3575_cond <= VAR_is_booted_MUX_uxn_c_l331_c2_3575_cond;
     is_booted_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_is_booted_MUX_uxn_c_l331_c2_3575_iftrue;
     is_booted_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_is_booted_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l331_c2_3575_return_output := is_booted_MUX_uxn_c_l331_c2_3575_return_output;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_772e_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_0b77_return_output;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_572f_return_output;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_f59d_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_d78b_return_output;
     VAR_vram_address_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_0042_return_output;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_fc3c_return_output;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_1a65_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l331_c2_3575_return_output;
     -- ram_address_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l337_c9_067e_cond <= VAR_ram_address_MUX_uxn_c_l337_c9_067e_cond;
     ram_address_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_ram_address_MUX_uxn_c_l337_c9_067e_iftrue;
     ram_address_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_ram_address_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l337_c9_067e_return_output := ram_address_MUX_uxn_c_l337_c9_067e_return_output;

     -- ram_write_value_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l337_c9_067e_cond <= VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_cond;
     ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iftrue;
     ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_return_output := ram_write_value_MUX_uxn_c_l337_c9_067e_return_output;

     -- is_device_ram_write_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_cond;
     is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iftrue;
     is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output := is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output;

     -- vram_write_layer_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l337_c9_067e_cond <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_cond;
     vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iftrue;
     vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output := vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output;

     -- is_vram_write_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l337_c9_067e_cond <= VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_cond;
     is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iftrue;
     is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_return_output := is_vram_write_MUX_uxn_c_l337_c9_067e_return_output;

     -- vram_address_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l337_c9_067e_cond <= VAR_vram_address_MUX_uxn_c_l337_c9_067e_cond;
     vram_address_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_vram_address_MUX_uxn_c_l337_c9_067e_iftrue;
     vram_address_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_vram_address_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l337_c9_067e_return_output := vram_address_MUX_uxn_c_l337_c9_067e_return_output;

     -- device_ram_address_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l337_c9_067e_cond <= VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_cond;
     device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iftrue;
     device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_return_output := device_ram_address_MUX_uxn_c_l337_c9_067e_return_output;

     -- is_ram_write_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l337_c9_067e_cond <= VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_cond;
     is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iftrue;
     is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_return_output := is_ram_write_MUX_uxn_c_l337_c9_067e_return_output;

     -- CAST_TO_uint2_t[uxn_c_l347_c16_cb65] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l347_c16_cb65_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_1a65_return_output);

     -- Submodule level 6
     VAR_vram_value_MUX_uxn_c_l337_c9_067e_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l347_c16_cb65_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse := VAR_device_ram_address_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse := VAR_is_ram_write_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse := VAR_is_vram_write_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_ram_address_MUX_uxn_c_l331_c2_3575_iffalse := VAR_ram_address_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse := VAR_ram_write_value_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c2_3575_iffalse := VAR_vram_address_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse := VAR_vram_write_layer_MUX_uxn_c_l337_c9_067e_return_output;
     -- ram_write_value_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l331_c2_3575_cond <= VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_cond;
     ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iftrue;
     ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output := ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;

     -- is_ram_write_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l331_c2_3575_cond <= VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_cond;
     is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iftrue;
     is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_return_output := is_ram_write_MUX_uxn_c_l331_c2_3575_return_output;

     -- device_ram_address_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l331_c2_3575_cond <= VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_cond;
     device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iftrue;
     device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output := device_ram_address_MUX_uxn_c_l331_c2_3575_return_output;

     -- is_vram_write_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l331_c2_3575_cond <= VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_cond;
     is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iftrue;
     is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_return_output := is_vram_write_MUX_uxn_c_l331_c2_3575_return_output;

     -- vram_value_MUX[uxn_c_l337_c9_067e] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l337_c9_067e_cond <= VAR_vram_value_MUX_uxn_c_l337_c9_067e_cond;
     vram_value_MUX_uxn_c_l337_c9_067e_iftrue <= VAR_vram_value_MUX_uxn_c_l337_c9_067e_iftrue;
     vram_value_MUX_uxn_c_l337_c9_067e_iffalse <= VAR_vram_value_MUX_uxn_c_l337_c9_067e_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l337_c9_067e_return_output := vram_value_MUX_uxn_c_l337_c9_067e_return_output;

     -- vram_write_layer_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l331_c2_3575_cond <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_cond;
     vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iftrue;
     vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output := vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output;

     -- vram_address_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l331_c2_3575_cond <= VAR_vram_address_MUX_uxn_c_l331_c2_3575_cond;
     vram_address_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_vram_address_MUX_uxn_c_l331_c2_3575_iftrue;
     vram_address_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_vram_address_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l331_c2_3575_return_output := vram_address_MUX_uxn_c_l331_c2_3575_return_output;

     -- ram_address_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l331_c2_3575_cond <= VAR_ram_address_MUX_uxn_c_l331_c2_3575_cond;
     ram_address_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_ram_address_MUX_uxn_c_l331_c2_3575_iftrue;
     ram_address_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_ram_address_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l331_c2_3575_return_output := ram_address_MUX_uxn_c_l331_c2_3575_return_output;

     -- is_device_ram_write_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_cond;
     is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iftrue;
     is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output := is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output;

     -- Submodule level 7
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_5f97_device_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_5f97_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_d91b_write_enable := VAR_is_ram_write_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_d91b_ram_address := VAR_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_5f97_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_d91b_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_address := VAR_vram_address_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l331_c2_3575_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c2_3575_iffalse := VAR_vram_value_MUX_uxn_c_l337_c9_067e_return_output;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l331_c2_3575_return_output;
     -- main_ram_update[uxn_c_l350_c19_d91b] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l350_c19_d91b_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l350_c19_d91b_ram_address <= VAR_main_ram_update_uxn_c_l350_c19_d91b_ram_address;
     main_ram_update_uxn_c_l350_c19_d91b_value <= VAR_main_ram_update_uxn_c_l350_c19_d91b_value;
     main_ram_update_uxn_c_l350_c19_d91b_write_enable <= VAR_main_ram_update_uxn_c_l350_c19_d91b_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l350_c19_d91b_return_output := main_ram_update_uxn_c_l350_c19_d91b_return_output;

     -- device_ram_update[uxn_c_l356_c26_5f97] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l356_c26_5f97_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l356_c26_5f97_device_address <= VAR_device_ram_update_uxn_c_l356_c26_5f97_device_address;
     device_ram_update_uxn_c_l356_c26_5f97_value <= VAR_device_ram_update_uxn_c_l356_c26_5f97_value;
     device_ram_update_uxn_c_l356_c26_5f97_write_enable <= VAR_device_ram_update_uxn_c_l356_c26_5f97_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l356_c26_5f97_return_output := device_ram_update_uxn_c_l356_c26_5f97_return_output;

     -- vector_snoop[uxn_c_l365_c18_ee93] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l365_c18_ee93_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l365_c18_ee93_device_ram_address <= VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_address;
     vector_snoop_uxn_c_l365_c18_ee93_device_ram_value <= VAR_vector_snoop_uxn_c_l365_c18_ee93_device_ram_value;
     vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write <= VAR_vector_snoop_uxn_c_l365_c18_ee93_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l365_c18_ee93_return_output := vector_snoop_uxn_c_l365_c18_ee93_return_output;

     -- vram_value_MUX[uxn_c_l331_c2_3575] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l331_c2_3575_cond <= VAR_vram_value_MUX_uxn_c_l331_c2_3575_cond;
     vram_value_MUX_uxn_c_l331_c2_3575_iftrue <= VAR_vram_value_MUX_uxn_c_l331_c2_3575_iftrue;
     vram_value_MUX_uxn_c_l331_c2_3575_iffalse <= VAR_vram_value_MUX_uxn_c_l331_c2_3575_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l331_c2_3575_return_output := vram_value_MUX_uxn_c_l331_c2_3575_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l356_c26_5f97_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l350_c19_d91b_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l365_c18_ee93_return_output;
     VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_value := VAR_vram_value_MUX_uxn_c_l331_c2_3575_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l331_c2_3575_return_output;
     -- step_gpu[uxn_c_l362_c20_dbb1] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l362_c20_dbb1_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area <= VAR_step_gpu_uxn_c_l362_c20_dbb1_is_active_drawing_area;
     step_gpu_uxn_c_l362_c20_dbb1_is_vram_write <= VAR_step_gpu_uxn_c_l362_c20_dbb1_is_vram_write;
     step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer <= VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_write_layer;
     step_gpu_uxn_c_l362_c20_dbb1_vram_address <= VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_address;
     step_gpu_uxn_c_l362_c20_dbb1_vram_value <= VAR_step_gpu_uxn_c_l362_c20_dbb1_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l362_c20_dbb1_return_output := step_gpu_uxn_c_l362_c20_dbb1_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l362_c20_dbb1_return_output;
     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l363_c19_1e9b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_1e9b_return_output := VAR_step_gpu_uxn_c_l362_c20_dbb1_return_output.is_active_fill;

     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l364_c92_a841] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_a841_return_output := VAR_step_gpu_uxn_c_l362_c20_dbb1_return_output.color;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_1e9b_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_165b_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_a841_return_output;
     -- palette_snoop[uxn_c_l364_c20_165b] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l364_c20_165b_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l364_c20_165b_device_ram_address <= VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_address;
     palette_snoop_uxn_c_l364_c20_165b_device_ram_value <= VAR_palette_snoop_uxn_c_l364_c20_165b_device_ram_value;
     palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write <= VAR_palette_snoop_uxn_c_l364_c20_165b_is_device_ram_write;
     palette_snoop_uxn_c_l364_c20_165b_gpu_step_color <= VAR_palette_snoop_uxn_c_l364_c20_165b_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l364_c20_165b_return_output := palette_snoop_uxn_c_l364_c20_165b_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l364_c20_165b_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l364_c20_165b_return_output;
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
     input_code <= REG_COMB_input_code;
     uxn_eval_result <= REG_COMB_uxn_eval_result;
     is_active_drawing_area <= REG_COMB_is_active_drawing_area;
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
