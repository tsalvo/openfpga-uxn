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
entity uxn_eval_0CLK_0d1a228e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 input : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_eval_0CLK_0d1a228e;
architecture arch of uxn_eval_0CLK_0d1a228e is
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
-- CONST_SR_12[uxn_c_l325_c15_8736]
signal CONST_SR_12_uxn_c_l325_c15_8736_x : unsigned(15 downto 0);
signal CONST_SR_12_uxn_c_l325_c15_8736_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l327_c6_fcca]
signal BIN_OP_EQ_uxn_c_l327_c6_fcca_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c6_fcca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output : unsigned(0 downto 0);

-- is_active_drawing_area_MUX[uxn_c_l327_c2_3986]
signal is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse : unsigned(0 downto 0);
signal is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output : unsigned(0 downto 0);

-- CONST_SR_2[uxn_c_l328_c28_3293]
signal CONST_SR_2_uxn_c_l328_c28_3293_x : unsigned(15 downto 0);
signal CONST_SR_2_uxn_c_l328_c28_3293_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l328_c28_b9f1]
signal BIN_OP_AND_uxn_c_l328_c28_b9f1_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l328_c28_b9f1_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output : unsigned(15 downto 0);

-- UNARY_OP_NOT[uxn_c_l331_c7_eead]
signal UNARY_OP_NOT_uxn_c_l331_c7_eead_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_6630]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l337_c9_add5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l331_c2_fffb]
signal vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l331_c2_fffb]
signal device_ram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l331_c2_fffb]
signal vram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(31 downto 0);

-- ram_address_MUX[uxn_c_l331_c2_fffb]
signal ram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(15 downto 0);

-- ram_write_value_MUX[uxn_c_l331_c2_fffb]
signal ram_write_value_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(7 downto 0);

-- is_device_ram_write_MUX[uxn_c_l331_c2_fffb]
signal is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l331_c2_fffb]
signal is_vram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);

-- is_booted_MUX[uxn_c_l331_c2_fffb]
signal is_booted_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l331_c2_fffb]
signal vram_value_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(1 downto 0);

-- is_ram_write_MUX[uxn_c_l331_c2_fffb]
signal is_ram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);

-- step_boot[uxn_c_l332_c41_5a4b]
signal step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_boot_uxn_c_l332_c41_5a4b_return_output : boot_step_result_t;

-- UNARY_OP_NOT[uxn_c_l337_c14_e5b4]
signal UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l337_c1_d21b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output : unsigned(0 downto 0);

-- vram_write_layer_MUX[uxn_c_l337_c9_add5]
signal vram_write_layer_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);

-- device_ram_address_MUX[uxn_c_l337_c9_add5]
signal device_ram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(7 downto 0);

-- vram_address_MUX[uxn_c_l337_c9_add5]
signal vram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(31 downto 0);
signal vram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(31 downto 0);

-- ram_address_MUX[uxn_c_l337_c9_add5]
signal ram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(15 downto 0);

-- ram_write_value_MUX[uxn_c_l337_c9_add5]
signal ram_write_value_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l337_c9_add5_return_output : unsigned(7 downto 0);

-- is_device_ram_write_MUX[uxn_c_l337_c9_add5]
signal is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);

-- is_vram_write_MUX[uxn_c_l337_c9_add5]
signal is_vram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l337_c9_add5]
signal vram_value_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(1 downto 0);
signal vram_value_MUX_uxn_c_l337_c9_add5_return_output : unsigned(1 downto 0);

-- is_ram_write_MUX[uxn_c_l337_c9_add5]
signal is_ram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l338_c39_e193]
signal step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l338_c39_e193_use_vector : unsigned(0 downto 0);
signal step_cpu_uxn_c_l338_c39_e193_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l338_c39_e193_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l350_c19_9ed3]
signal main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l350_c19_9ed3_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l350_c19_9ed3_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l350_c19_9ed3_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l350_c19_9ed3_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l356_c26_595e]
signal device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l356_c26_595e_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l356_c26_595e_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l356_c26_595e_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l356_c26_595e_return_output : unsigned(7 downto 0);

-- step_gpu[uxn_c_l362_c20_8138]
signal step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_vram_address : unsigned(31 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_vram_value : unsigned(1 downto 0);
signal step_gpu_uxn_c_l362_c20_8138_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l364_c20_dfc3]
signal palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l364_c20_dfc3_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l365_c18_25fc]
signal vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l365_c18_25fc_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l365_c18_25fc_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l365_c18_25fc_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_c_l367_c2_6c26]
signal BIN_OP_PLUS_uxn_c_l367_c2_6c26_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l367_c2_6c26_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_12_uxn_c_l325_c15_8736
CONST_SR_12_uxn_c_l325_c15_8736 : entity work.CONST_SR_12_uint16_t_0CLK_de264c78 port map (
CONST_SR_12_uxn_c_l325_c15_8736_x,
CONST_SR_12_uxn_c_l325_c15_8736_return_output);

-- BIN_OP_EQ_uxn_c_l327_c6_fcca
BIN_OP_EQ_uxn_c_l327_c6_fcca : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l327_c6_fcca_left,
BIN_OP_EQ_uxn_c_l327_c6_fcca_right,
BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output);

-- is_active_drawing_area_MUX_uxn_c_l327_c2_3986
is_active_drawing_area_MUX_uxn_c_l327_c2_3986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond,
is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue,
is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse,
is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output);

-- CONST_SR_2_uxn_c_l328_c28_3293
CONST_SR_2_uxn_c_l328_c28_3293 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_uxn_c_l328_c28_3293_x,
CONST_SR_2_uxn_c_l328_c28_3293_return_output);

-- BIN_OP_AND_uxn_c_l328_c28_b9f1
BIN_OP_AND_uxn_c_l328_c28_b9f1 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l328_c28_b9f1_left,
BIN_OP_AND_uxn_c_l328_c28_b9f1_right,
BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output);

-- UNARY_OP_NOT_uxn_c_l331_c7_eead
UNARY_OP_NOT_uxn_c_l331_c7_eead : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l331_c7_eead_expr,
UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output);

-- vram_write_layer_MUX_uxn_c_l331_c2_fffb
vram_write_layer_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond,
vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue,
vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse,
vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output);

-- device_ram_address_MUX_uxn_c_l331_c2_fffb
device_ram_address_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l331_c2_fffb_cond,
device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue,
device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse,
device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output);

-- vram_address_MUX_uxn_c_l331_c2_fffb
vram_address_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l331_c2_fffb_cond,
vram_address_MUX_uxn_c_l331_c2_fffb_iftrue,
vram_address_MUX_uxn_c_l331_c2_fffb_iffalse,
vram_address_MUX_uxn_c_l331_c2_fffb_return_output);

-- ram_address_MUX_uxn_c_l331_c2_fffb
ram_address_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l331_c2_fffb_cond,
ram_address_MUX_uxn_c_l331_c2_fffb_iftrue,
ram_address_MUX_uxn_c_l331_c2_fffb_iffalse,
ram_address_MUX_uxn_c_l331_c2_fffb_return_output);

-- ram_write_value_MUX_uxn_c_l331_c2_fffb
ram_write_value_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l331_c2_fffb_cond,
ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue,
ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse,
ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output);

-- is_device_ram_write_MUX_uxn_c_l331_c2_fffb
is_device_ram_write_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond,
is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue,
is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse,
is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output);

-- is_vram_write_MUX_uxn_c_l331_c2_fffb
is_vram_write_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l331_c2_fffb_cond,
is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue,
is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse,
is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output);

-- is_booted_MUX_uxn_c_l331_c2_fffb
is_booted_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l331_c2_fffb_cond,
is_booted_MUX_uxn_c_l331_c2_fffb_iftrue,
is_booted_MUX_uxn_c_l331_c2_fffb_iffalse,
is_booted_MUX_uxn_c_l331_c2_fffb_return_output);

-- vram_value_MUX_uxn_c_l331_c2_fffb
vram_value_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l331_c2_fffb_cond,
vram_value_MUX_uxn_c_l331_c2_fffb_iftrue,
vram_value_MUX_uxn_c_l331_c2_fffb_iffalse,
vram_value_MUX_uxn_c_l331_c2_fffb_return_output);

-- is_ram_write_MUX_uxn_c_l331_c2_fffb
is_ram_write_MUX_uxn_c_l331_c2_fffb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l331_c2_fffb_cond,
is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue,
is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse,
is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output);

-- step_boot_uxn_c_l332_c41_5a4b
step_boot_uxn_c_l332_c41_5a4b : entity work.step_boot_0CLK_e08689a7 port map (
clk,
step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE,
step_boot_uxn_c_l332_c41_5a4b_return_output);

-- UNARY_OP_NOT_uxn_c_l337_c14_e5b4
UNARY_OP_NOT_uxn_c_l337_c14_e5b4 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr,
UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output);

-- vram_write_layer_MUX_uxn_c_l337_c9_add5
vram_write_layer_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l337_c9_add5_cond,
vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue,
vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse,
vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output);

-- device_ram_address_MUX_uxn_c_l337_c9_add5
device_ram_address_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l337_c9_add5_cond,
device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue,
device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse,
device_ram_address_MUX_uxn_c_l337_c9_add5_return_output);

-- vram_address_MUX_uxn_c_l337_c9_add5
vram_address_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_address_MUX_uxn_c_l337_c9_add5_cond,
vram_address_MUX_uxn_c_l337_c9_add5_iftrue,
vram_address_MUX_uxn_c_l337_c9_add5_iffalse,
vram_address_MUX_uxn_c_l337_c9_add5_return_output);

-- ram_address_MUX_uxn_c_l337_c9_add5
ram_address_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l337_c9_add5_cond,
ram_address_MUX_uxn_c_l337_c9_add5_iftrue,
ram_address_MUX_uxn_c_l337_c9_add5_iffalse,
ram_address_MUX_uxn_c_l337_c9_add5_return_output);

-- ram_write_value_MUX_uxn_c_l337_c9_add5
ram_write_value_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l337_c9_add5_cond,
ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue,
ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse,
ram_write_value_MUX_uxn_c_l337_c9_add5_return_output);

-- is_device_ram_write_MUX_uxn_c_l337_c9_add5
is_device_ram_write_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond,
is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue,
is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse,
is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output);

-- is_vram_write_MUX_uxn_c_l337_c9_add5
is_vram_write_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l337_c9_add5_cond,
is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue,
is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse,
is_vram_write_MUX_uxn_c_l337_c9_add5_return_output);

-- vram_value_MUX_uxn_c_l337_c9_add5
vram_value_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l337_c9_add5_cond,
vram_value_MUX_uxn_c_l337_c9_add5_iftrue,
vram_value_MUX_uxn_c_l337_c9_add5_iffalse,
vram_value_MUX_uxn_c_l337_c9_add5_return_output);

-- is_ram_write_MUX_uxn_c_l337_c9_add5
is_ram_write_MUX_uxn_c_l337_c9_add5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l337_c9_add5_cond,
is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue,
is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse,
is_ram_write_MUX_uxn_c_l337_c9_add5_return_output);

-- step_cpu_uxn_c_l338_c39_e193
step_cpu_uxn_c_l338_c39_e193 : entity work.step_cpu_0CLK_fa86bd3f port map (
clk,
step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE,
step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value,
step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read,
step_cpu_uxn_c_l338_c39_e193_use_vector,
step_cpu_uxn_c_l338_c39_e193_vector,
step_cpu_uxn_c_l338_c39_e193_return_output);

-- main_ram_update_uxn_c_l350_c19_9ed3
main_ram_update_uxn_c_l350_c19_9ed3 : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE,
main_ram_update_uxn_c_l350_c19_9ed3_ram_address,
main_ram_update_uxn_c_l350_c19_9ed3_value,
main_ram_update_uxn_c_l350_c19_9ed3_write_enable,
main_ram_update_uxn_c_l350_c19_9ed3_return_output);

-- device_ram_update_uxn_c_l356_c26_595e
device_ram_update_uxn_c_l356_c26_595e : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE,
device_ram_update_uxn_c_l356_c26_595e_device_address,
device_ram_update_uxn_c_l356_c26_595e_value,
device_ram_update_uxn_c_l356_c26_595e_write_enable,
device_ram_update_uxn_c_l356_c26_595e_return_output);

-- step_gpu_uxn_c_l362_c20_8138
step_gpu_uxn_c_l362_c20_8138 : entity work.step_gpu_0CLK_57cf448f port map (
clk,
step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE,
step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area,
step_gpu_uxn_c_l362_c20_8138_is_vram_write,
step_gpu_uxn_c_l362_c20_8138_vram_write_layer,
step_gpu_uxn_c_l362_c20_8138_vram_address,
step_gpu_uxn_c_l362_c20_8138_vram_value,
step_gpu_uxn_c_l362_c20_8138_return_output);

-- palette_snoop_uxn_c_l364_c20_dfc3
palette_snoop_uxn_c_l364_c20_dfc3 : entity work.palette_snoop_0CLK_26f67814 port map (
clk,
palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE,
palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address,
palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value,
palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write,
palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color,
palette_snoop_uxn_c_l364_c20_dfc3_return_output);

-- vector_snoop_uxn_c_l365_c18_25fc
vector_snoop_uxn_c_l365_c18_25fc : entity work.vector_snoop_0CLK_9d359dd9 port map (
clk,
vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE,
vector_snoop_uxn_c_l365_c18_25fc_device_ram_address,
vector_snoop_uxn_c_l365_c18_25fc_device_ram_value,
vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write,
vector_snoop_uxn_c_l365_c18_25fc_return_output);

-- BIN_OP_PLUS_uxn_c_l367_c2_6c26
BIN_OP_PLUS_uxn_c_l367_c2_6c26 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l367_c2_6c26_left,
BIN_OP_PLUS_uxn_c_l367_c2_6c26_right,
BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output);



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
 CONST_SR_12_uxn_c_l325_c15_8736_return_output,
 BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output,
 is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output,
 CONST_SR_2_uxn_c_l328_c28_3293_return_output,
 BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output,
 UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output,
 vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output,
 device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output,
 vram_address_MUX_uxn_c_l331_c2_fffb_return_output,
 ram_address_MUX_uxn_c_l331_c2_fffb_return_output,
 ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output,
 is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output,
 is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output,
 is_booted_MUX_uxn_c_l331_c2_fffb_return_output,
 vram_value_MUX_uxn_c_l331_c2_fffb_return_output,
 is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output,
 step_boot_uxn_c_l332_c41_5a4b_return_output,
 UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output,
 vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output,
 device_ram_address_MUX_uxn_c_l337_c9_add5_return_output,
 vram_address_MUX_uxn_c_l337_c9_add5_return_output,
 ram_address_MUX_uxn_c_l337_c9_add5_return_output,
 ram_write_value_MUX_uxn_c_l337_c9_add5_return_output,
 is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output,
 is_vram_write_MUX_uxn_c_l337_c9_add5_return_output,
 vram_value_MUX_uxn_c_l337_c9_add5_return_output,
 is_ram_write_MUX_uxn_c_l337_c9_add5_return_output,
 step_cpu_uxn_c_l338_c39_e193_return_output,
 main_ram_update_uxn_c_l350_c19_9ed3_return_output,
 device_ram_update_uxn_c_l356_c26_595e_return_output,
 step_gpu_uxn_c_l362_c20_8138_return_output,
 palette_snoop_uxn_c_l364_c20_dfc3_return_output,
 vector_snoop_uxn_c_l365_c18_25fc_return_output,
 BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_input : unsigned(15 downto 0);
 variable VAR_input_code_uxn_c_l325_c2_34df : unsigned(3 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l325_c15_8736_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_12_uxn_c_l325_c15_8736_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_uxn_c_l328_c3_8ce9 : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output : unsigned(0 downto 0);
 variable VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l328_c28_3293_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_uxn_c_l328_c28_3293_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output : unsigned(15 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_add5_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_add5_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_cond : unsigned(0 downto 0);
 variable VAR_boot_step_result : boot_step_result_t;
 variable VAR_step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_boot_uxn_c_l332_c41_5a4b_return_output : boot_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_0f6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_f0a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_a540_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_e586_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(31 downto 0);
 variable VAR_vram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(1 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result : cpu_step_result_t;
 variable VAR_step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_e193_use_vector : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_e193_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_b708_return_output : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l338_c39_e193_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_24a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_a03c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_2fa1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_3bdd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_5d77_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_0e0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_d3cf_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l347_c16_2fae_return_output : unsigned(1 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_9ed3_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_9ed3_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_9ed3_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l350_c19_9ed3_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_595e_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_595e_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_595e_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l356_c26_595e_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_vram_address : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l362_c20_8138_return_output : gpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_cea6_return_output : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_1d6a_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l364_c20_dfc3_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l365_c18_25fc_return_output : unsigned(15 downto 0);
 variable VAR_main_clock_cycle_uxn_c_l367_c2_d297 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_c25c_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_input := input;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue := device_ram_address;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse := device_ram_address;
     VAR_step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read := device_ram_read_value;
     VAR_CONST_SR_12_uxn_c_l325_c15_8736_x := VAR_input;
     VAR_CONST_SR_2_uxn_c_l328_c28_3293_x := VAR_input;
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse := is_active_drawing_area;
     VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr := is_active_fill;
     VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue := is_device_ram_write;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse := is_device_ram_write;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse := is_ram_write;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue := is_vram_write;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse := is_vram_write;
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_left := main_clock_cycle;
     VAR_ram_address_MUX_uxn_c_l337_c9_add5_iffalse := ram_address;
     VAR_step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value := ram_read_value;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse := ram_write_value;
     VAR_step_cpu_uxn_c_l338_c39_e193_vector := screen_vector;
     VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iftrue := vram_address;
     VAR_vram_address_MUX_uxn_c_l337_c9_add5_iffalse := vram_address;
     VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iftrue := vram_value;
     VAR_vram_value_MUX_uxn_c_l337_c9_add5_iffalse := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue := vram_write_layer;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l367_c2_6c26] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l367_c2_6c26_left <= VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_left;
     BIN_OP_PLUS_uxn_c_l367_c2_6c26_right <= VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output := BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output;

     -- UNARY_OP_NOT[uxn_c_l337_c14_e5b4] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr <= VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output := UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;

     -- CONST_SR_2[uxn_c_l328_c28_3293] LATENCY=0
     -- Inputs
     CONST_SR_2_uxn_c_l328_c28_3293_x <= VAR_CONST_SR_2_uxn_c_l328_c28_3293_x;
     -- Outputs
     VAR_CONST_SR_2_uxn_c_l328_c28_3293_return_output := CONST_SR_2_uxn_c_l328_c28_3293_return_output;

     -- UNARY_OP_NOT[uxn_c_l331_c7_eead] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l331_c7_eead_expr <= VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output := UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;

     -- CONST_SR_12[uxn_c_l325_c15_8736] LATENCY=0
     -- Inputs
     CONST_SR_12_uxn_c_l325_c15_8736_x <= VAR_CONST_SR_12_uxn_c_l325_c15_8736_x;
     -- Outputs
     VAR_CONST_SR_12_uxn_c_l325_c15_8736_return_output := CONST_SR_12_uxn_c_l325_c15_8736_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l338_c87_b708] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_b708_return_output := gpu_step_result.is_new_frame;

     -- Submodule level 1
     VAR_main_clock_cycle_uxn_c_l367_c2_d297 := resize(VAR_BIN_OP_PLUS_uxn_c_l367_c2_6c26_return_output, 32);
     VAR_step_cpu_uxn_c_l338_c39_e193_use_vector := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l338_c87_b708_return_output;
     VAR_input_code_uxn_c_l325_c2_34df := resize(VAR_CONST_SR_12_uxn_c_l325_c15_8736_return_output, 4);
     VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_left := VAR_CONST_SR_2_uxn_c_l328_c28_3293_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_is_booted_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_ram_address_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond := VAR_UNARY_OP_NOT_uxn_c_l331_c7_eead_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_ram_address_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_vram_address_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_vram_value_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_cond := VAR_UNARY_OP_NOT_uxn_c_l337_c14_e5b4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_left := VAR_input_code_uxn_c_l325_c2_34df;
     REG_VAR_input_code := VAR_input_code_uxn_c_l325_c2_34df;
     REG_VAR_main_clock_cycle := VAR_main_clock_cycle_uxn_c_l367_c2_d297;
     -- BIN_OP_AND[uxn_c_l328_c28_b9f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l328_c28_b9f1_left <= VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_left;
     BIN_OP_AND_uxn_c_l328_c28_b9f1_right <= VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output := BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output;

     -- BIN_OP_EQ[uxn_c_l327_c6_fcca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l327_c6_fcca_left <= VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_left;
     BIN_OP_EQ_uxn_c_l327_c6_fcca_right <= VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output := BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l331_c1_6630] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output;

     -- Submodule level 2
     VAR_is_active_drawing_area_uxn_c_l328_c3_8ce9 := resize(VAR_BIN_OP_AND_uxn_c_l328_c28_b9f1_return_output, 1);
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond := VAR_BIN_OP_EQ_uxn_c_l327_c6_fcca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l331_c1_6630_return_output;
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue := VAR_is_active_drawing_area_uxn_c_l328_c3_8ce9;
     -- is_active_drawing_area_MUX[uxn_c_l327_c2_3986] LATENCY=0
     -- Inputs
     is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_cond;
     is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iftrue;
     is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse <= VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_iffalse;
     -- Outputs
     VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output := is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output;

     -- step_boot[uxn_c_l332_c41_5a4b] LATENCY=0
     -- Clock enable
     step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE <= VAR_step_boot_uxn_c_l332_c41_5a4b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_step_boot_uxn_c_l332_c41_5a4b_return_output := step_boot_uxn_c_l332_c41_5a4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l337_c1_d21b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output;

     -- Submodule level 3
     VAR_step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l337_c1_d21b_return_output;
     REG_VAR_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output;
     VAR_step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area := VAR_is_active_drawing_area_MUX_uxn_c_l327_c2_3986_return_output;
     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d[uxn_c_l333_c18_0f6e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_0f6e_return_output := VAR_step_boot_uxn_c_l332_c41_5a4b_return_output.is_valid_byte;

     -- CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d[uxn_c_l336_c15_e586] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_e586_return_output := VAR_step_boot_uxn_c_l332_c41_5a4b_return_output.is_finished;

     -- step_cpu[uxn_c_l338_c39_e193] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l338_c39_e193_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value <= VAR_step_cpu_uxn_c_l338_c39_e193_previous_ram_read_value;
     step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read <= VAR_step_cpu_uxn_c_l338_c39_e193_previous_device_ram_read;
     step_cpu_uxn_c_l338_c39_e193_use_vector <= VAR_step_cpu_uxn_c_l338_c39_e193_use_vector;
     step_cpu_uxn_c_l338_c39_e193_vector <= VAR_step_cpu_uxn_c_l338_c39_e193_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l338_c39_e193_return_output := step_cpu_uxn_c_l338_c39_e193_return_output;

     -- CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d[uxn_c_l335_c21_a540] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_a540_return_output := VAR_step_boot_uxn_c_l332_c41_5a4b_return_output.rom_byte;

     -- CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d[uxn_c_l334_c17_f0a5] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_f0a5_return_output := VAR_step_boot_uxn_c_l332_c41_5a4b_return_output.ram_address;

     -- Submodule level 4
     VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue := VAR_CONST_REF_RD_uint16_t_boot_step_result_t_ram_address_d41d_uxn_c_l334_c17_f0a5_return_output;
     VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_finished_d41d_uxn_c_l336_c15_e586_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue := VAR_CONST_REF_RD_uint1_t_boot_step_result_t_is_valid_byte_d41d_uxn_c_l333_c18_0f6e_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue := VAR_CONST_REF_RD_uint8_t_boot_step_result_t_rom_byte_d41d_uxn_c_l335_c21_a540_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l344_c19_5d77] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_5d77_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.is_vram_write;

     -- is_booted_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l331_c2_fffb_cond <= VAR_is_booted_MUX_uxn_c_l331_c2_fffb_cond;
     is_booted_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iftrue;
     is_booted_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_is_booted_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l331_c2_fffb_return_output := is_booted_MUX_uxn_c_l331_c2_fffb_return_output;

     -- CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d[uxn_c_l346_c18_d3cf] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_d3cf_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l342_c25_3bdd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_3bdd_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d[uxn_c_l340_c17_a03c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_a03c_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l345_c22_0e0e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_0e0e_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l339_c18_24a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_24a8_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_c25c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_c25c_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l341_c24_2fa1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_2fa1_return_output := VAR_step_cpu_uxn_c_l338_c39_e193_return_output.device_ram_address;

     -- Submodule level 5
     VAR_ram_address_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_ram_address_d41d_uxn_c_l340_c17_a03c_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l342_c25_3bdd_return_output;
     VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l339_c18_24a8_return_output;
     VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l344_c19_5d77_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l345_c22_0e0e_return_output;
     VAR_vram_address_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint32_t_cpu_step_result_t_vram_address_d41d_uxn_c_l346_c18_d3cf_return_output;
     VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l341_c24_2fa1_return_output;
     VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_c25c_return_output;
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l331_c2_fffb_return_output;
     -- CAST_TO_uint2_t[uxn_c_l347_c16_2fae] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l347_c16_2fae_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l343_l347_DUPLICATE_c25c_return_output);

     -- ram_address_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l337_c9_add5_cond <= VAR_ram_address_MUX_uxn_c_l337_c9_add5_cond;
     ram_address_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_ram_address_MUX_uxn_c_l337_c9_add5_iftrue;
     ram_address_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_ram_address_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l337_c9_add5_return_output := ram_address_MUX_uxn_c_l337_c9_add5_return_output;

     -- vram_address_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l337_c9_add5_cond <= VAR_vram_address_MUX_uxn_c_l337_c9_add5_cond;
     vram_address_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_vram_address_MUX_uxn_c_l337_c9_add5_iftrue;
     vram_address_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_vram_address_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l337_c9_add5_return_output := vram_address_MUX_uxn_c_l337_c9_add5_return_output;

     -- vram_write_layer_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l337_c9_add5_cond <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_cond;
     vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iftrue;
     vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output := vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output;

     -- is_device_ram_write_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_cond;
     is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iftrue;
     is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output := is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output;

     -- is_ram_write_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l337_c9_add5_cond <= VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_cond;
     is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iftrue;
     is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_return_output := is_ram_write_MUX_uxn_c_l337_c9_add5_return_output;

     -- ram_write_value_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l337_c9_add5_cond <= VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_cond;
     ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iftrue;
     ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_return_output := ram_write_value_MUX_uxn_c_l337_c9_add5_return_output;

     -- is_vram_write_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l337_c9_add5_cond <= VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_cond;
     is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iftrue;
     is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_return_output := is_vram_write_MUX_uxn_c_l337_c9_add5_return_output;

     -- device_ram_address_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l337_c9_add5_cond <= VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_cond;
     device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iftrue;
     device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_return_output := device_ram_address_MUX_uxn_c_l337_c9_add5_return_output;

     -- Submodule level 6
     VAR_vram_value_MUX_uxn_c_l337_c9_add5_iftrue := VAR_CAST_TO_uint2_t_uxn_c_l347_c16_2fae_return_output;
     VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_device_ram_address_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_is_device_ram_write_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_is_ram_write_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_is_vram_write_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_ram_address_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_ram_write_value_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_vram_address_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_vram_write_layer_MUX_uxn_c_l337_c9_add5_return_output;
     -- ram_write_value_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l331_c2_fffb_cond <= VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_cond;
     ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iftrue;
     ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output := ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;

     -- device_ram_address_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l331_c2_fffb_cond <= VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_cond;
     device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue;
     device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output := device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;

     -- ram_address_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l331_c2_fffb_cond <= VAR_ram_address_MUX_uxn_c_l331_c2_fffb_cond;
     ram_address_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iftrue;
     ram_address_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_ram_address_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l331_c2_fffb_return_output := ram_address_MUX_uxn_c_l331_c2_fffb_return_output;

     -- vram_write_layer_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_cond;
     vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iftrue;
     vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output := vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output;

     -- is_device_ram_write_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_cond;
     is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue;
     is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output := is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;

     -- vram_address_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     vram_address_MUX_uxn_c_l331_c2_fffb_cond <= VAR_vram_address_MUX_uxn_c_l331_c2_fffb_cond;
     vram_address_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iftrue;
     vram_address_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_vram_address_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_vram_address_MUX_uxn_c_l331_c2_fffb_return_output := vram_address_MUX_uxn_c_l331_c2_fffb_return_output;

     -- is_ram_write_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l331_c2_fffb_cond <= VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_cond;
     is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iftrue;
     is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output := is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;

     -- is_vram_write_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l331_c2_fffb_cond <= VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_cond;
     is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iftrue;
     is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output := is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output;

     -- vram_value_MUX[uxn_c_l337_c9_add5] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l337_c9_add5_cond <= VAR_vram_value_MUX_uxn_c_l337_c9_add5_cond;
     vram_value_MUX_uxn_c_l337_c9_add5_iftrue <= VAR_vram_value_MUX_uxn_c_l337_c9_add5_iftrue;
     vram_value_MUX_uxn_c_l337_c9_add5_iffalse <= VAR_vram_value_MUX_uxn_c_l337_c9_add5_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l337_c9_add5_return_output := vram_value_MUX_uxn_c_l337_c9_add5_return_output;

     -- Submodule level 7
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_595e_device_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_595e_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_9ed3_write_enable := VAR_is_ram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_step_gpu_uxn_c_l362_c20_8138_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_9ed3_ram_address := VAR_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_device_ram_update_uxn_c_l356_c26_595e_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_main_ram_update_uxn_c_l350_c19_9ed3_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_step_gpu_uxn_c_l362_c20_8138_vram_address := VAR_vram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_vram_address := VAR_vram_address_MUX_uxn_c_l331_c2_fffb_return_output;
     VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iffalse := VAR_vram_value_MUX_uxn_c_l337_c9_add5_return_output;
     VAR_step_gpu_uxn_c_l362_c20_8138_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l331_c2_fffb_return_output;
     -- vector_snoop[uxn_c_l365_c18_25fc] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l365_c18_25fc_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l365_c18_25fc_device_ram_address <= VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_address;
     vector_snoop_uxn_c_l365_c18_25fc_device_ram_value <= VAR_vector_snoop_uxn_c_l365_c18_25fc_device_ram_value;
     vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write <= VAR_vector_snoop_uxn_c_l365_c18_25fc_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l365_c18_25fc_return_output := vector_snoop_uxn_c_l365_c18_25fc_return_output;

     -- vram_value_MUX[uxn_c_l331_c2_fffb] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l331_c2_fffb_cond <= VAR_vram_value_MUX_uxn_c_l331_c2_fffb_cond;
     vram_value_MUX_uxn_c_l331_c2_fffb_iftrue <= VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iftrue;
     vram_value_MUX_uxn_c_l331_c2_fffb_iffalse <= VAR_vram_value_MUX_uxn_c_l331_c2_fffb_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l331_c2_fffb_return_output := vram_value_MUX_uxn_c_l331_c2_fffb_return_output;

     -- main_ram_update[uxn_c_l350_c19_9ed3] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l350_c19_9ed3_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l350_c19_9ed3_ram_address <= VAR_main_ram_update_uxn_c_l350_c19_9ed3_ram_address;
     main_ram_update_uxn_c_l350_c19_9ed3_value <= VAR_main_ram_update_uxn_c_l350_c19_9ed3_value;
     main_ram_update_uxn_c_l350_c19_9ed3_write_enable <= VAR_main_ram_update_uxn_c_l350_c19_9ed3_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l350_c19_9ed3_return_output := main_ram_update_uxn_c_l350_c19_9ed3_return_output;

     -- device_ram_update[uxn_c_l356_c26_595e] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l356_c26_595e_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l356_c26_595e_device_address <= VAR_device_ram_update_uxn_c_l356_c26_595e_device_address;
     device_ram_update_uxn_c_l356_c26_595e_value <= VAR_device_ram_update_uxn_c_l356_c26_595e_value;
     device_ram_update_uxn_c_l356_c26_595e_write_enable <= VAR_device_ram_update_uxn_c_l356_c26_595e_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l356_c26_595e_return_output := device_ram_update_uxn_c_l356_c26_595e_return_output;

     -- Submodule level 8
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l356_c26_595e_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l350_c19_9ed3_return_output;
     REG_VAR_screen_vector := VAR_vector_snoop_uxn_c_l365_c18_25fc_return_output;
     VAR_step_gpu_uxn_c_l362_c20_8138_vram_value := VAR_vram_value_MUX_uxn_c_l331_c2_fffb_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l331_c2_fffb_return_output;
     -- step_gpu[uxn_c_l362_c20_8138] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l362_c20_8138_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area <= VAR_step_gpu_uxn_c_l362_c20_8138_is_active_drawing_area;
     step_gpu_uxn_c_l362_c20_8138_is_vram_write <= VAR_step_gpu_uxn_c_l362_c20_8138_is_vram_write;
     step_gpu_uxn_c_l362_c20_8138_vram_write_layer <= VAR_step_gpu_uxn_c_l362_c20_8138_vram_write_layer;
     step_gpu_uxn_c_l362_c20_8138_vram_address <= VAR_step_gpu_uxn_c_l362_c20_8138_vram_address;
     step_gpu_uxn_c_l362_c20_8138_vram_value <= VAR_step_gpu_uxn_c_l362_c20_8138_vram_value;
     -- Outputs
     VAR_step_gpu_uxn_c_l362_c20_8138_return_output := step_gpu_uxn_c_l362_c20_8138_return_output;

     -- Submodule level 9
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l362_c20_8138_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l364_c92_1d6a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_1d6a_return_output := VAR_step_gpu_uxn_c_l362_c20_8138_return_output.color;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d[uxn_c_l363_c19_cea6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_cea6_return_output := VAR_step_gpu_uxn_c_l362_c20_8138_return_output.is_active_fill;

     -- Submodule level 10
     REG_VAR_is_active_fill := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_active_fill_d41d_uxn_c_l363_c19_cea6_return_output;
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l364_c92_1d6a_return_output;
     -- palette_snoop[uxn_c_l364_c20_dfc3] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l364_c20_dfc3_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address <= VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_address;
     palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value <= VAR_palette_snoop_uxn_c_l364_c20_dfc3_device_ram_value;
     palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write <= VAR_palette_snoop_uxn_c_l364_c20_dfc3_is_device_ram_write;
     palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color <= VAR_palette_snoop_uxn_c_l364_c20_dfc3_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l364_c20_dfc3_return_output := palette_snoop_uxn_c_l364_c20_dfc3_return_output;

     -- Submodule level 11
     VAR_return_output := VAR_palette_snoop_uxn_c_l364_c20_dfc3_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l364_c20_dfc3_return_output;
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
