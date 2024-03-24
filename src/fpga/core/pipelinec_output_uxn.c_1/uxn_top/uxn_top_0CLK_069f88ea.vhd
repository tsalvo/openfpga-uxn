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
entity uxn_top_0CLK_069f88ea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 controller0_up : in unsigned(0 downto 0);
 controller0_down : in unsigned(0 downto 0);
 controller0_left : in unsigned(0 downto 0);
 controller0_right : in unsigned(0 downto 0);
 controller0_a : in unsigned(0 downto 0);
 controller0_b : in unsigned(0 downto 0);
 controller0_x : in unsigned(0 downto 0);
 controller0_y : in unsigned(0 downto 0);
 controller0_l : in unsigned(0 downto 0);
 controller0_r : in unsigned(0 downto 0);
 controller0_select : in unsigned(0 downto 0);
 controller0_start : in unsigned(0 downto 0);
 is_visible_pixel : in unsigned(0 downto 0);
 is_double_buffer_enabled : in unsigned(0 downto 0);
 rom_load_valid_byte : in unsigned(0 downto 0);
 rom_load_address : in unsigned(15 downto 0);
 rom_load_value : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end uxn_top_0CLK_069f88ea;
architecture arch of uxn_top_0CLK_069f88ea is
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
signal controller0_buttons : unsigned(7 downto 0) := to_unsigned(0, 8);
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
signal REG_COMB_controller0_buttons : unsigned(7 downto 0);
signal REG_COMB_cycle_count : unsigned(31 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l352_c7_e16f]
signal UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l367_c1_f4ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output : unsigned(0 downto 0);

-- u16_addr_MUX[uxn_c_l352_c2_a105]
signal u16_addr_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(15 downto 0);
signal u16_addr_MUX_uxn_c_l352_c2_a105_return_output : unsigned(15 downto 0);

-- vram_write_layer_MUX[uxn_c_l352_c2_a105]
signal vram_write_layer_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
signal vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);

-- ram_write_value_MUX[uxn_c_l352_c2_a105]
signal ram_write_value_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
signal ram_write_value_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);

-- is_vram_write_MUX[uxn_c_l352_c2_a105]
signal is_vram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
signal is_vram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);

-- controller0_buttons_MUX[uxn_c_l352_c2_a105]
signal controller0_buttons_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
signal controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
signal controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);

-- is_ram_write_MUX[uxn_c_l352_c2_a105]
signal is_ram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
signal is_ram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);

-- vram_value_MUX[uxn_c_l352_c2_a105]
signal vram_value_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
signal vram_value_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);

-- is_booted_MUX[uxn_c_l352_c2_a105]
signal is_booted_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
signal is_booted_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);

-- is_device_ram_write_MUX[uxn_c_l352_c2_a105]
signal is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
signal is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);

-- cpu_step_result_MUX[uxn_c_l352_c2_a105]
signal cpu_step_result_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse : cpu_step_result_t;
signal cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output : cpu_step_result_t;

-- device_ram_address_MUX[uxn_c_l352_c2_a105]
signal device_ram_address_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
signal device_ram_address_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);

-- boot_check_MUX[uxn_c_l352_c2_a105]
signal boot_check_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(23 downto 0);
signal boot_check_MUX_uxn_c_l352_c2_a105_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l361_c42_37d8]
signal BIN_OP_PLUS_uxn_c_l361_c42_37d8_left : unsigned(23 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c42_37d8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output : unsigned(24 downto 0);

-- MUX[uxn_c_l361_c16_742b]
signal MUX_uxn_c_l361_c16_742b_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l361_c16_742b_iftrue : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c16_742b_iffalse : unsigned(23 downto 0);
signal MUX_uxn_c_l361_c16_742b_return_output : unsigned(23 downto 0);

-- BIN_OP_PLUS[uxn_c_l363_c14_aeca]
signal BIN_OP_PLUS_uxn_c_l363_c14_aeca_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l363_c14_aeca_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_c_l365_c15_e95e]
signal BIN_OP_EQ_uxn_c_l365_c15_e95e_left : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l365_c15_e95e_right : unsigned(23 downto 0);
signal BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l365_c15_4ded]
signal MUX_uxn_c_l365_c15_4ded_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l365_c15_4ded_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l365_c15_4ded_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l365_c15_4ded_return_output : unsigned(0 downto 0);

-- step_cpu[uxn_c_l376_c21_8cec]
signal step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value : unsigned(7 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read : unsigned(7 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_controller0_buttons : unsigned(7 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_is_new_frame : unsigned(0 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_screen_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_controller_vector : unsigned(15 downto 0);
signal step_cpu_uxn_c_l376_c21_8cec_return_output : cpu_step_result_t;

-- main_ram_update[uxn_c_l387_c19_71ab]
signal main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l387_c19_71ab_ram_address : unsigned(15 downto 0);
signal main_ram_update_uxn_c_l387_c19_71ab_value : unsigned(7 downto 0);
signal main_ram_update_uxn_c_l387_c19_71ab_write_enable : unsigned(0 downto 0);
signal main_ram_update_uxn_c_l387_c19_71ab_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_c_l393_c26_6cdb]
signal device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l393_c26_6cdb_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l393_c26_6cdb_value : unsigned(7 downto 0);
signal device_ram_update_uxn_c_l393_c26_6cdb_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_c_l393_c26_6cdb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l399_c115_5050]
signal BIN_OP_EQ_uxn_c_l399_c115_5050_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_c_l399_c115_5050_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l399_c115_5050_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l399_c141_36cf]
signal BIN_OP_AND_uxn_c_l399_c141_36cf_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l399_c141_36cf_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l399_c141_36cf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l399_c115_bf94]
signal MUX_uxn_c_l399_c115_bf94_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l399_c115_bf94_iftrue : unsigned(0 downto 0);
signal MUX_uxn_c_l399_c115_bf94_iffalse : unsigned(0 downto 0);
signal MUX_uxn_c_l399_c115_bf94_return_output : unsigned(0 downto 0);

-- step_gpu[uxn_c_l399_c20_c9ac]
signal step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_is_vram_write : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_vram_address : unsigned(15 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_vram_value : unsigned(7 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_cycle : unsigned(31 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_swap_buffers : unsigned(0 downto 0);
signal step_gpu_uxn_c_l399_c20_c9ac_return_output : gpu_step_result_t;

-- palette_snoop[uxn_c_l400_c20_15f5]
signal palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l400_c20_15f5_device_ram_address : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l400_c20_15f5_device_ram_value : unsigned(7 downto 0);
signal palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write : unsigned(0 downto 0);
signal palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color : unsigned(1 downto 0);
signal palette_snoop_uxn_c_l400_c20_15f5_return_output : unsigned(15 downto 0);

-- vector_snoop[uxn_c_l401_c12_39a9]
signal vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l401_c12_39a9_device_ram_address : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l401_c12_39a9_device_ram_value : unsigned(7 downto 0);
signal vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write : unsigned(0 downto 0);
signal vector_snoop_uxn_c_l401_c12_39a9_return_output : vector_snoop_result_t;

-- BIN_OP_PLUS[uxn_c_l403_c2_48f7]
signal BIN_OP_PLUS_uxn_c_l403_c2_48f7_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l403_c2_48f7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output : unsigned(32 downto 0);

function uint8_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l352_c7_e16f
UNARY_OP_NOT_uxn_c_l352_c7_e16f : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr,
UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output);

-- u16_addr_MUX_uxn_c_l352_c2_a105
u16_addr_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
u16_addr_MUX_uxn_c_l352_c2_a105_cond,
u16_addr_MUX_uxn_c_l352_c2_a105_iftrue,
u16_addr_MUX_uxn_c_l352_c2_a105_iffalse,
u16_addr_MUX_uxn_c_l352_c2_a105_return_output);

-- vram_write_layer_MUX_uxn_c_l352_c2_a105
vram_write_layer_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
vram_write_layer_MUX_uxn_c_l352_c2_a105_cond,
vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue,
vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse,
vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output);

-- ram_write_value_MUX_uxn_c_l352_c2_a105
ram_write_value_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ram_write_value_MUX_uxn_c_l352_c2_a105_cond,
ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue,
ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse,
ram_write_value_MUX_uxn_c_l352_c2_a105_return_output);

-- is_vram_write_MUX_uxn_c_l352_c2_a105
is_vram_write_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_vram_write_MUX_uxn_c_l352_c2_a105_cond,
is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue,
is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse,
is_vram_write_MUX_uxn_c_l352_c2_a105_return_output);

-- controller0_buttons_MUX_uxn_c_l352_c2_a105
controller0_buttons_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
controller0_buttons_MUX_uxn_c_l352_c2_a105_cond,
controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue,
controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse,
controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output);

-- is_ram_write_MUX_uxn_c_l352_c2_a105
is_ram_write_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_ram_write_MUX_uxn_c_l352_c2_a105_cond,
is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue,
is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse,
is_ram_write_MUX_uxn_c_l352_c2_a105_return_output);

-- vram_value_MUX_uxn_c_l352_c2_a105
vram_value_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
vram_value_MUX_uxn_c_l352_c2_a105_cond,
vram_value_MUX_uxn_c_l352_c2_a105_iftrue,
vram_value_MUX_uxn_c_l352_c2_a105_iffalse,
vram_value_MUX_uxn_c_l352_c2_a105_return_output);

-- is_booted_MUX_uxn_c_l352_c2_a105
is_booted_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_booted_MUX_uxn_c_l352_c2_a105_cond,
is_booted_MUX_uxn_c_l352_c2_a105_iftrue,
is_booted_MUX_uxn_c_l352_c2_a105_iffalse,
is_booted_MUX_uxn_c_l352_c2_a105_return_output);

-- is_device_ram_write_MUX_uxn_c_l352_c2_a105
is_device_ram_write_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond,
is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue,
is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse,
is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output);

-- cpu_step_result_MUX_uxn_c_l352_c2_a105
cpu_step_result_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_cpu_step_result_t_cpu_step_result_t_0CLK_de264c78 port map (
cpu_step_result_MUX_uxn_c_l352_c2_a105_cond,
cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue,
cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse,
cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output);

-- device_ram_address_MUX_uxn_c_l352_c2_a105
device_ram_address_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
device_ram_address_MUX_uxn_c_l352_c2_a105_cond,
device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue,
device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse,
device_ram_address_MUX_uxn_c_l352_c2_a105_return_output);

-- boot_check_MUX_uxn_c_l352_c2_a105
boot_check_MUX_uxn_c_l352_c2_a105 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
boot_check_MUX_uxn_c_l352_c2_a105_cond,
boot_check_MUX_uxn_c_l352_c2_a105_iftrue,
boot_check_MUX_uxn_c_l352_c2_a105_iffalse,
boot_check_MUX_uxn_c_l352_c2_a105_return_output);

-- BIN_OP_PLUS_uxn_c_l361_c42_37d8
BIN_OP_PLUS_uxn_c_l361_c42_37d8 : entity work.BIN_OP_PLUS_uint24_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l361_c42_37d8_left,
BIN_OP_PLUS_uxn_c_l361_c42_37d8_right,
BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output);

-- MUX_uxn_c_l361_c16_742b
MUX_uxn_c_l361_c16_742b : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
MUX_uxn_c_l361_c16_742b_cond,
MUX_uxn_c_l361_c16_742b_iftrue,
MUX_uxn_c_l361_c16_742b_iffalse,
MUX_uxn_c_l361_c16_742b_return_output);

-- BIN_OP_PLUS_uxn_c_l363_c14_aeca
BIN_OP_PLUS_uxn_c_l363_c14_aeca : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l363_c14_aeca_left,
BIN_OP_PLUS_uxn_c_l363_c14_aeca_right,
BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output);

-- BIN_OP_EQ_uxn_c_l365_c15_e95e
BIN_OP_EQ_uxn_c_l365_c15_e95e : entity work.BIN_OP_EQ_uint24_t_uint24_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l365_c15_e95e_left,
BIN_OP_EQ_uxn_c_l365_c15_e95e_right,
BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output);

-- MUX_uxn_c_l365_c15_4ded
MUX_uxn_c_l365_c15_4ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l365_c15_4ded_cond,
MUX_uxn_c_l365_c15_4ded_iftrue,
MUX_uxn_c_l365_c15_4ded_iffalse,
MUX_uxn_c_l365_c15_4ded_return_output);

-- step_cpu_uxn_c_l376_c21_8cec
step_cpu_uxn_c_l376_c21_8cec : entity work.step_cpu_0CLK_13f09cd4 port map (
clk,
step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE,
step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value,
step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read,
step_cpu_uxn_c_l376_c21_8cec_controller0_buttons,
step_cpu_uxn_c_l376_c21_8cec_is_new_frame,
step_cpu_uxn_c_l376_c21_8cec_screen_vector,
step_cpu_uxn_c_l376_c21_8cec_controller_vector,
step_cpu_uxn_c_l376_c21_8cec_return_output);

-- main_ram_update_uxn_c_l387_c19_71ab
main_ram_update_uxn_c_l387_c19_71ab : entity work.main_ram_update_0CLK_23f04728 port map (
clk,
main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE,
main_ram_update_uxn_c_l387_c19_71ab_ram_address,
main_ram_update_uxn_c_l387_c19_71ab_value,
main_ram_update_uxn_c_l387_c19_71ab_write_enable,
main_ram_update_uxn_c_l387_c19_71ab_return_output);

-- device_ram_update_uxn_c_l393_c26_6cdb
device_ram_update_uxn_c_l393_c26_6cdb : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE,
device_ram_update_uxn_c_l393_c26_6cdb_device_address,
device_ram_update_uxn_c_l393_c26_6cdb_value,
device_ram_update_uxn_c_l393_c26_6cdb_write_enable,
device_ram_update_uxn_c_l393_c26_6cdb_return_output);

-- BIN_OP_EQ_uxn_c_l399_c115_5050
BIN_OP_EQ_uxn_c_l399_c115_5050 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l399_c115_5050_left,
BIN_OP_EQ_uxn_c_l399_c115_5050_right,
BIN_OP_EQ_uxn_c_l399_c115_5050_return_output);

-- BIN_OP_AND_uxn_c_l399_c141_36cf
BIN_OP_AND_uxn_c_l399_c141_36cf : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l399_c141_36cf_left,
BIN_OP_AND_uxn_c_l399_c141_36cf_right,
BIN_OP_AND_uxn_c_l399_c141_36cf_return_output);

-- MUX_uxn_c_l399_c115_bf94
MUX_uxn_c_l399_c115_bf94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_c_l399_c115_bf94_cond,
MUX_uxn_c_l399_c115_bf94_iftrue,
MUX_uxn_c_l399_c115_bf94_iffalse,
MUX_uxn_c_l399_c115_bf94_return_output);

-- step_gpu_uxn_c_l399_c20_c9ac
step_gpu_uxn_c_l399_c20_c9ac : entity work.step_gpu_0CLK_22353258 port map (
clk,
step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE,
step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area,
step_gpu_uxn_c_l399_c20_c9ac_is_vram_write,
step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer,
step_gpu_uxn_c_l399_c20_c9ac_vram_address,
step_gpu_uxn_c_l399_c20_c9ac_vram_value,
step_gpu_uxn_c_l399_c20_c9ac_cycle,
step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap,
step_gpu_uxn_c_l399_c20_c9ac_swap_buffers,
step_gpu_uxn_c_l399_c20_c9ac_return_output);

-- palette_snoop_uxn_c_l400_c20_15f5
palette_snoop_uxn_c_l400_c20_15f5 : entity work.palette_snoop_0CLK_afb80682 port map (
clk,
palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE,
palette_snoop_uxn_c_l400_c20_15f5_device_ram_address,
palette_snoop_uxn_c_l400_c20_15f5_device_ram_value,
palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write,
palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color,
palette_snoop_uxn_c_l400_c20_15f5_return_output);

-- vector_snoop_uxn_c_l401_c12_39a9
vector_snoop_uxn_c_l401_c12_39a9 : entity work.vector_snoop_0CLK_226cf4bb port map (
clk,
vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE,
vector_snoop_uxn_c_l401_c12_39a9_device_ram_address,
vector_snoop_uxn_c_l401_c12_39a9_device_ram_value,
vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write,
vector_snoop_uxn_c_l401_c12_39a9_return_output);

-- BIN_OP_PLUS_uxn_c_l403_c2_48f7
BIN_OP_PLUS_uxn_c_l403_c2_48f7 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l403_c2_48f7_left,
BIN_OP_PLUS_uxn_c_l403_c2_48f7_right,
BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 controller0_up,
 controller0_down,
 controller0_left,
 controller0_right,
 controller0_a,
 controller0_b,
 controller0_x,
 controller0_y,
 controller0_l,
 controller0_r,
 controller0_select,
 controller0_start,
 is_visible_pixel,
 is_double_buffer_enabled,
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
 controller0_buttons,
 cycle_count,
 -- All submodule outputs
 UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output,
 u16_addr_MUX_uxn_c_l352_c2_a105_return_output,
 vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output,
 ram_write_value_MUX_uxn_c_l352_c2_a105_return_output,
 is_vram_write_MUX_uxn_c_l352_c2_a105_return_output,
 controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output,
 is_ram_write_MUX_uxn_c_l352_c2_a105_return_output,
 vram_value_MUX_uxn_c_l352_c2_a105_return_output,
 is_booted_MUX_uxn_c_l352_c2_a105_return_output,
 is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output,
 cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output,
 device_ram_address_MUX_uxn_c_l352_c2_a105_return_output,
 boot_check_MUX_uxn_c_l352_c2_a105_return_output,
 BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output,
 MUX_uxn_c_l361_c16_742b_return_output,
 BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output,
 BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output,
 MUX_uxn_c_l365_c15_4ded_return_output,
 step_cpu_uxn_c_l376_c21_8cec_return_output,
 main_ram_update_uxn_c_l387_c19_71ab_return_output,
 device_ram_update_uxn_c_l393_c26_6cdb_return_output,
 BIN_OP_EQ_uxn_c_l399_c115_5050_return_output,
 BIN_OP_AND_uxn_c_l399_c141_36cf_return_output,
 MUX_uxn_c_l399_c115_bf94_return_output,
 step_gpu_uxn_c_l399_c20_c9ac_return_output,
 palette_snoop_uxn_c_l400_c20_15f5_return_output,
 vector_snoop_uxn_c_l401_c12_39a9_return_output,
 BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_controller0_up : unsigned(0 downto 0);
 variable VAR_controller0_down : unsigned(0 downto 0);
 variable VAR_controller0_left : unsigned(0 downto 0);
 variable VAR_controller0_right : unsigned(0 downto 0);
 variable VAR_controller0_a : unsigned(0 downto 0);
 variable VAR_controller0_b : unsigned(0 downto 0);
 variable VAR_controller0_x : unsigned(0 downto 0);
 variable VAR_controller0_y : unsigned(0 downto 0);
 variable VAR_controller0_l : unsigned(0 downto 0);
 variable VAR_controller0_r : unsigned(0 downto 0);
 variable VAR_controller0_select : unsigned(0 downto 0);
 variable VAR_controller0_start : unsigned(0 downto 0);
 variable VAR_is_visible_pixel : unsigned(0 downto 0);
 variable VAR_is_double_buffer_enabled : unsigned(0 downto 0);
 variable VAR_rom_load_valid_byte : unsigned(0 downto 0);
 variable VAR_rom_load_address : unsigned(15 downto 0);
 variable VAR_rom_load_value : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse : unsigned(0 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(15 downto 0);
 variable VAR_u16_addr_uxn_c_l363_c3_1ea2 : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_a105_return_output : unsigned(15 downto 0);
 variable VAR_u16_addr_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);
 variable VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);
 variable VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);
 variable VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
 variable VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
 variable VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);
 variable VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);
 variable VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);
 variable VAR_vram_value_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);
 variable VAR_is_booted_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output : unsigned(0 downto 0);
 variable VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output : cpu_step_result_t;
 variable VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_a105_iftrue : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_a105_iffalse : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_a105_return_output : unsigned(23 downto 0);
 variable VAR_boot_check_MUX_uxn_c_l352_c2_a105_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_742b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_742b_iftrue : unsigned(23 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_742b_iffalse : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output : unsigned(24 downto 0);
 variable VAR_MUX_uxn_c_l361_c16_742b_return_output : unsigned(23 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_c_l365_c15_4ded_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_left : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_right : unsigned(23 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l365_c15_4ded_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l365_c15_4ded_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l365_c15_4ded_return_output : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_uxn_c_l368_c25_8ff3_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_uxn_c_l369_c25_3e51_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_uxn_c_l370_c25_4b0b_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_uxn_c_l371_c25_76a6_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_uxn_c_l372_c25_99dd_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_uxn_c_l373_c25_dba8_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_uxn_c_l374_c25_d79c_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_uxn_c_l375_c25_31d2_return_output : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_controller0_buttons : unsigned(7 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_is_new_frame : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_screen_vector : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_controller_vector : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l376_c90_4233_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l376_c136_1319_return_output : unsigned(15 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_cpu_uxn_c_l376_c21_8cec_return_output : cpu_step_result_t;
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l377_c18_a275_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l378_c14_aa94_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l379_c24_4c1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l380_c25_dc0d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l382_c19_11b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l383_c22_89e5_return_output : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l387_c19_71ab_ram_address : unsigned(15 downto 0);
 variable VAR_main_ram_update_uxn_c_l387_c19_71ab_value : unsigned(7 downto 0);
 variable VAR_main_ram_update_uxn_c_l387_c19_71ab_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_uxn_c_l387_c19_71ab_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l393_c26_6cdb_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l393_c26_6cdb_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_c_l393_c26_6cdb_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_c_l393_c26_6cdb_return_output : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_is_vram_write : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_address : unsigned(15 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_value : unsigned(7 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_cycle : unsigned(31 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_swap_buffers : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l399_c115_bf94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l399_c115_bf94_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l399_c115_bf94_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l399_c115_bf94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l399_c171_9fbb_return_output : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_step_gpu_uxn_c_l399_c20_c9ac_return_output : gpu_step_result_t;
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_address : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_value : unsigned(7 downto 0);
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l400_c92_879b_return_output : unsigned(1 downto 0);
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_palette_snoop_uxn_c_l400_c20_15f5_return_output : unsigned(15 downto 0);
 variable VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_address : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_value : unsigned(7 downto 0);
 variable VAR_vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_vector_snoop_uxn_c_l401_c12_39a9_return_output : vector_snoop_result_t;
 variable VAR_cycle_count_uxn_c_l403_c2_9ba9 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output : unsigned(32 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l376_l399_DUPLICATE_d9c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l381_l384_DUPLICATE_6be7_return_output : unsigned(7 downto 0);
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
variable REG_VAR_controller0_buttons : unsigned(7 downto 0);
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
  REG_VAR_controller0_buttons := controller0_buttons;
  REG_VAR_cycle_count := cycle_count;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_c_l399_c115_bf94_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_right := to_unsigned(16777215, 24);
     VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_right := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l361_c16_742b_iftrue := resize(to_unsigned(0, 1), 24);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_left := to_unsigned(1, 1);
     VAR_MUX_uxn_c_l365_c15_4ded_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_right := to_unsigned(256, 16);
     VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_right := to_unsigned(0, 1);
     VAR_MUX_uxn_c_l365_c15_4ded_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_controller0_up := controller0_up;
     VAR_controller0_down := controller0_down;
     VAR_controller0_left := controller0_left;
     VAR_controller0_right := controller0_right;
     VAR_controller0_a := controller0_a;
     VAR_controller0_b := controller0_b;
     VAR_controller0_x := controller0_x;
     VAR_controller0_y := controller0_y;
     VAR_controller0_l := controller0_l;
     VAR_controller0_r := controller0_r;
     VAR_controller0_select := controller0_select;
     VAR_controller0_start := controller0_start;
     VAR_is_visible_pixel := is_visible_pixel;
     VAR_is_double_buffer_enabled := is_double_buffer_enabled;
     VAR_rom_load_valid_byte := rom_load_valid_byte;
     VAR_rom_load_address := rom_load_address;
     VAR_rom_load_value := rom_load_value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_left := boot_check;
     VAR_boot_check_MUX_uxn_c_l352_c2_a105_iffalse := boot_check;
     VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue := controller0_buttons;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue := cpu_step_result;
     VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_left := cycle_count;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_cycle := cycle_count;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue := device_ram_address;
     VAR_step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read := device_ram_read_value;
     VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr := is_booted;
     VAR_is_booted_MUX_uxn_c_l352_c2_a105_iffalse := is_booted;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue := is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_right := VAR_is_double_buffer_enabled;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area := VAR_is_visible_pixel;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue := is_vram_write;
     VAR_step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value := ram_read_value;
     VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_left := VAR_rom_load_address;
     VAR_MUX_uxn_c_l361_c16_742b_cond := VAR_rom_load_valid_byte;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue := VAR_rom_load_valid_byte;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue := VAR_rom_load_value;
     VAR_vram_value_MUX_uxn_c_l352_c2_a105_iftrue := vram_value;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue := vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l361_c42_37d8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l361_c42_37d8_left <= VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_left;
     BIN_OP_PLUS_uxn_c_l361_c42_37d8_right <= VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output := BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output;

     -- BIN_OP_PLUS[uxn_c_l363_c14_aeca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l363_c14_aeca_left <= VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_left;
     BIN_OP_PLUS_uxn_c_l363_c14_aeca_right <= VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output := BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d[uxn_c_l376_c136_1319] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l376_c136_1319_return_output := vectors.controller;

     -- UNARY_OP_NOT[uxn_c_l352_c7_e16f] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr <= VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output := UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;

     -- uint8_uint1_0[uxn_c_l368_c25_8ff3] LATENCY=0
     VAR_uint8_uint1_0_uxn_c_l368_c25_8ff3_return_output := uint8_uint1_0(
     resize(to_unsigned(0, 1), 8),
     VAR_controller0_a);

     -- BIN_OP_AND[uxn_c_l399_c141_36cf] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l399_c141_36cf_left <= VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_left;
     BIN_OP_AND_uxn_c_l399_c141_36cf_right <= VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_return_output := BIN_OP_AND_uxn_c_l399_c141_36cf_return_output;

     -- BIN_OP_PLUS[uxn_c_l403_c2_48f7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l403_c2_48f7_left <= VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_left;
     BIN_OP_PLUS_uxn_c_l403_c2_48f7_right <= VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output := BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output;

     -- CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d[uxn_c_l376_c90_4233] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l376_c90_4233_return_output := gpu_step_result.is_new_frame;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l376_l399_DUPLICATE_d9c4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l376_l399_DUPLICATE_d9c4_return_output := vectors.screen;

     -- Submodule level 1
     VAR_MUX_uxn_c_l399_c115_bf94_iffalse := VAR_BIN_OP_AND_uxn_c_l399_c141_36cf_return_output;
     VAR_MUX_uxn_c_l361_c16_742b_iffalse := resize(VAR_BIN_OP_PLUS_uxn_c_l361_c42_37d8_return_output, 24);
     VAR_u16_addr_uxn_c_l363_c3_1ea2 := resize(VAR_BIN_OP_PLUS_uxn_c_l363_c14_aeca_return_output, 16);
     VAR_cycle_count_uxn_c_l403_c2_9ba9 := resize(VAR_BIN_OP_PLUS_uxn_c_l403_c2_48f7_return_output, 32);
     VAR_step_cpu_uxn_c_l376_c21_8cec_controller_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l376_c136_1319_return_output;
     VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_left := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l376_l399_DUPLICATE_d9c4_return_output;
     VAR_step_cpu_uxn_c_l376_c21_8cec_screen_vector := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l376_l399_DUPLICATE_d9c4_return_output;
     VAR_step_cpu_uxn_c_l376_c21_8cec_is_new_frame := VAR_CONST_REF_RD_uint1_t_gpu_step_result_t_is_new_frame_d41d_uxn_c_l376_c90_4233_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_boot_check_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_is_booted_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_u16_addr_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_vram_value_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_cond := VAR_UNARY_OP_NOT_uxn_c_l352_c7_e16f_return_output;
     REG_VAR_cycle_count := VAR_cycle_count_uxn_c_l403_c2_9ba9;
     VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iftrue := VAR_u16_addr_uxn_c_l363_c3_1ea2;
     -- BIN_OP_EQ[uxn_c_l399_c115_5050] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l399_c115_5050_left <= VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_left;
     BIN_OP_EQ_uxn_c_l399_c115_5050_right <= VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_return_output := BIN_OP_EQ_uxn_c_l399_c115_5050_return_output;

     -- MUX[uxn_c_l361_c16_742b] LATENCY=0
     -- Inputs
     MUX_uxn_c_l361_c16_742b_cond <= VAR_MUX_uxn_c_l361_c16_742b_cond;
     MUX_uxn_c_l361_c16_742b_iftrue <= VAR_MUX_uxn_c_l361_c16_742b_iftrue;
     MUX_uxn_c_l361_c16_742b_iffalse <= VAR_MUX_uxn_c_l361_c16_742b_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l361_c16_742b_return_output := MUX_uxn_c_l361_c16_742b_return_output;

     -- uint8_uint1_1[uxn_c_l369_c25_3e51] LATENCY=0
     VAR_uint8_uint1_1_uxn_c_l369_c25_3e51_return_output := uint8_uint1_1(
     VAR_uint8_uint1_0_uxn_c_l368_c25_8ff3_return_output,
     VAR_controller0_b);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l367_c1_f4ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_c_l399_c115_bf94_cond := VAR_BIN_OP_EQ_uxn_c_l399_c115_5050_return_output;
     VAR_step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l367_c1_f4ea_return_output;
     VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_left := VAR_MUX_uxn_c_l361_c16_742b_return_output;
     VAR_boot_check_MUX_uxn_c_l352_c2_a105_iftrue := VAR_MUX_uxn_c_l361_c16_742b_return_output;
     -- boot_check_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     boot_check_MUX_uxn_c_l352_c2_a105_cond <= VAR_boot_check_MUX_uxn_c_l352_c2_a105_cond;
     boot_check_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_boot_check_MUX_uxn_c_l352_c2_a105_iftrue;
     boot_check_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_boot_check_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_boot_check_MUX_uxn_c_l352_c2_a105_return_output := boot_check_MUX_uxn_c_l352_c2_a105_return_output;

     -- BIN_OP_EQ[uxn_c_l365_c15_e95e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l365_c15_e95e_left <= VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_left;
     BIN_OP_EQ_uxn_c_l365_c15_e95e_right <= VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output := BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output;

     -- MUX[uxn_c_l399_c115_bf94] LATENCY=0
     -- Inputs
     MUX_uxn_c_l399_c115_bf94_cond <= VAR_MUX_uxn_c_l399_c115_bf94_cond;
     MUX_uxn_c_l399_c115_bf94_iftrue <= VAR_MUX_uxn_c_l399_c115_bf94_iftrue;
     MUX_uxn_c_l399_c115_bf94_iffalse <= VAR_MUX_uxn_c_l399_c115_bf94_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l399_c115_bf94_return_output := MUX_uxn_c_l399_c115_bf94_return_output;

     -- uint8_uint1_2[uxn_c_l370_c25_4b0b] LATENCY=0
     VAR_uint8_uint1_2_uxn_c_l370_c25_4b0b_return_output := uint8_uint1_2(
     VAR_uint8_uint1_1_uxn_c_l369_c25_3e51_return_output,
     VAR_controller0_start);

     -- Submodule level 3
     VAR_MUX_uxn_c_l365_c15_4ded_cond := VAR_BIN_OP_EQ_uxn_c_l365_c15_e95e_return_output;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap := VAR_MUX_uxn_c_l399_c115_bf94_return_output;
     REG_VAR_boot_check := VAR_boot_check_MUX_uxn_c_l352_c2_a105_return_output;
     -- uint8_uint1_3[uxn_c_l371_c25_76a6] LATENCY=0
     VAR_uint8_uint1_3_uxn_c_l371_c25_76a6_return_output := uint8_uint1_3(
     VAR_uint8_uint1_2_uxn_c_l370_c25_4b0b_return_output,
     VAR_controller0_select);

     -- MUX[uxn_c_l365_c15_4ded] LATENCY=0
     -- Inputs
     MUX_uxn_c_l365_c15_4ded_cond <= VAR_MUX_uxn_c_l365_c15_4ded_cond;
     MUX_uxn_c_l365_c15_4ded_iftrue <= VAR_MUX_uxn_c_l365_c15_4ded_iftrue;
     MUX_uxn_c_l365_c15_4ded_iffalse <= VAR_MUX_uxn_c_l365_c15_4ded_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l365_c15_4ded_return_output := MUX_uxn_c_l365_c15_4ded_return_output;

     -- Submodule level 4
     VAR_is_booted_MUX_uxn_c_l352_c2_a105_iftrue := VAR_MUX_uxn_c_l365_c15_4ded_return_output;
     -- is_booted_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     is_booted_MUX_uxn_c_l352_c2_a105_cond <= VAR_is_booted_MUX_uxn_c_l352_c2_a105_cond;
     is_booted_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_is_booted_MUX_uxn_c_l352_c2_a105_iftrue;
     is_booted_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_is_booted_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_is_booted_MUX_uxn_c_l352_c2_a105_return_output := is_booted_MUX_uxn_c_l352_c2_a105_return_output;

     -- uint8_uint1_4[uxn_c_l372_c25_99dd] LATENCY=0
     VAR_uint8_uint1_4_uxn_c_l372_c25_99dd_return_output := uint8_uint1_4(
     VAR_uint8_uint1_3_uxn_c_l371_c25_76a6_return_output,
     VAR_controller0_up);

     -- Submodule level 5
     REG_VAR_is_booted := VAR_is_booted_MUX_uxn_c_l352_c2_a105_return_output;
     -- uint8_uint1_5[uxn_c_l373_c25_dba8] LATENCY=0
     VAR_uint8_uint1_5_uxn_c_l373_c25_dba8_return_output := uint8_uint1_5(
     VAR_uint8_uint1_4_uxn_c_l372_c25_99dd_return_output,
     VAR_controller0_down);

     -- Submodule level 6
     -- uint8_uint1_6[uxn_c_l374_c25_d79c] LATENCY=0
     VAR_uint8_uint1_6_uxn_c_l374_c25_d79c_return_output := uint8_uint1_6(
     VAR_uint8_uint1_5_uxn_c_l373_c25_dba8_return_output,
     VAR_controller0_left);

     -- Submodule level 7
     -- uint8_uint1_7[uxn_c_l375_c25_31d2] LATENCY=0
     VAR_uint8_uint1_7_uxn_c_l375_c25_31d2_return_output := uint8_uint1_7(
     VAR_uint8_uint1_6_uxn_c_l374_c25_d79c_return_output,
     VAR_controller0_right);

     -- Submodule level 8
     VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse := VAR_uint8_uint1_7_uxn_c_l375_c25_31d2_return_output;
     VAR_step_cpu_uxn_c_l376_c21_8cec_controller0_buttons := VAR_uint8_uint1_7_uxn_c_l375_c25_31d2_return_output;
     -- controller0_buttons_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     controller0_buttons_MUX_uxn_c_l352_c2_a105_cond <= VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_cond;
     controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iftrue;
     controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output := controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output;

     -- step_cpu[uxn_c_l376_c21_8cec] LATENCY=0
     -- Clock enable
     step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE <= VAR_step_cpu_uxn_c_l376_c21_8cec_CLOCK_ENABLE;
     -- Inputs
     step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value <= VAR_step_cpu_uxn_c_l376_c21_8cec_previous_ram_read_value;
     step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read <= VAR_step_cpu_uxn_c_l376_c21_8cec_previous_device_ram_read;
     step_cpu_uxn_c_l376_c21_8cec_controller0_buttons <= VAR_step_cpu_uxn_c_l376_c21_8cec_controller0_buttons;
     step_cpu_uxn_c_l376_c21_8cec_is_new_frame <= VAR_step_cpu_uxn_c_l376_c21_8cec_is_new_frame;
     step_cpu_uxn_c_l376_c21_8cec_screen_vector <= VAR_step_cpu_uxn_c_l376_c21_8cec_screen_vector;
     step_cpu_uxn_c_l376_c21_8cec_controller_vector <= VAR_step_cpu_uxn_c_l376_c21_8cec_controller_vector;
     -- Outputs
     VAR_step_cpu_uxn_c_l376_c21_8cec_return_output := step_cpu_uxn_c_l376_c21_8cec_return_output;

     -- Submodule level 9
     REG_VAR_controller0_buttons := VAR_controller0_buttons_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output;
     -- CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d[uxn_c_l378_c14_aa94] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l378_c14_aa94_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.u16_addr;

     -- cpu_step_result_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     cpu_step_result_MUX_uxn_c_l352_c2_a105_cond <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_cond;
     cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iftrue;
     cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output := cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d[uxn_c_l380_c25_dc0d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l380_c25_dc0d_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d[uxn_c_l377_c18_a275] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l377_c18_a275_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d[uxn_c_l379_c24_4c1d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l379_c24_4c1d_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l381_l384_DUPLICATE_6be7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l381_l384_DUPLICATE_6be7_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d[uxn_c_l382_c19_11b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l382_c19_11b4_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d[uxn_c_l383_c22_89e5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l383_c22_89e5_return_output := VAR_step_cpu_uxn_c_l376_c21_8cec_return_output.vram_write_layer;

     -- Submodule level 10
     VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint16_t_cpu_step_result_t_u16_addr_d41d_uxn_c_l378_c14_aa94_return_output;
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_device_ram_write_d41d_uxn_c_l380_c25_dc0d_return_output;
     VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_ram_write_d41d_uxn_c_l377_c18_a275_return_output;
     VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_is_vram_write_d41d_uxn_c_l382_c19_11b4_return_output;
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_vram_write_layer_d41d_uxn_c_l383_c22_89e5_return_output;
     VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_device_ram_address_d41d_uxn_c_l379_c24_4c1d_return_output;
     VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l381_l384_DUPLICATE_6be7_return_output;
     VAR_vram_value_MUX_uxn_c_l352_c2_a105_iffalse := VAR_CONST_REF_RD_uint8_t_cpu_step_result_t_u8_value_d41d_uxn_c_l381_l384_DUPLICATE_6be7_return_output;
     REG_VAR_cpu_step_result := VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output;
     -- CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d[uxn_c_l399_c171_9fbb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l399_c171_9fbb_return_output := VAR_cpu_step_result_MUX_uxn_c_l352_c2_a105_return_output.swap_buffers;

     -- is_ram_write_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     is_ram_write_MUX_uxn_c_l352_c2_a105_cond <= VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_cond;
     is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iftrue;
     is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_return_output := is_ram_write_MUX_uxn_c_l352_c2_a105_return_output;

     -- ram_write_value_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     ram_write_value_MUX_uxn_c_l352_c2_a105_cond <= VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_cond;
     ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iftrue;
     ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output := ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;

     -- device_ram_address_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     device_ram_address_MUX_uxn_c_l352_c2_a105_cond <= VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_cond;
     device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iftrue;
     device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output := device_ram_address_MUX_uxn_c_l352_c2_a105_return_output;

     -- vram_value_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     vram_value_MUX_uxn_c_l352_c2_a105_cond <= VAR_vram_value_MUX_uxn_c_l352_c2_a105_cond;
     vram_value_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_vram_value_MUX_uxn_c_l352_c2_a105_iftrue;
     vram_value_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_vram_value_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_vram_value_MUX_uxn_c_l352_c2_a105_return_output := vram_value_MUX_uxn_c_l352_c2_a105_return_output;

     -- is_device_ram_write_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_cond;
     is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iftrue;
     is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output := is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output;

     -- u16_addr_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     u16_addr_MUX_uxn_c_l352_c2_a105_cond <= VAR_u16_addr_MUX_uxn_c_l352_c2_a105_cond;
     u16_addr_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iftrue;
     u16_addr_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_u16_addr_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_u16_addr_MUX_uxn_c_l352_c2_a105_return_output := u16_addr_MUX_uxn_c_l352_c2_a105_return_output;

     -- vram_write_layer_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     vram_write_layer_MUX_uxn_c_l352_c2_a105_cond <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_cond;
     vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iftrue;
     vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output := vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output;

     -- is_vram_write_MUX[uxn_c_l352_c2_a105] LATENCY=0
     -- Inputs
     is_vram_write_MUX_uxn_c_l352_c2_a105_cond <= VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_cond;
     is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue <= VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iftrue;
     is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse <= VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_iffalse;
     -- Outputs
     VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_return_output := is_vram_write_MUX_uxn_c_l352_c2_a105_return_output;

     -- Submodule level 11
     VAR_step_gpu_uxn_c_l399_c20_c9ac_swap_buffers := VAR_CONST_REF_RD_uint1_t_cpu_step_result_t_swap_buffers_d41d_uxn_c_l399_c171_9fbb_return_output;
     REG_VAR_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_device_ram_update_uxn_c_l393_c26_6cdb_device_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_address := VAR_device_ram_address_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_device_ram_update_uxn_c_l393_c26_6cdb_write_enable := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write := VAR_is_device_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_is_ram_write := VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_main_ram_update_uxn_c_l387_c19_71ab_write_enable := VAR_is_ram_write_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_is_vram_write := VAR_is_vram_write_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_device_ram_update_uxn_c_l393_c26_6cdb_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_main_ram_update_uxn_c_l387_c19_71ab_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_ram_write_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_value := VAR_ram_write_value_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_main_ram_update_uxn_c_l387_c19_71ab_ram_address := VAR_u16_addr_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_address := VAR_u16_addr_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_u16_addr := VAR_u16_addr_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_value := VAR_vram_value_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_vram_value := VAR_vram_value_MUX_uxn_c_l352_c2_a105_return_output;
     VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output;
     REG_VAR_vram_write_layer := VAR_vram_write_layer_MUX_uxn_c_l352_c2_a105_return_output;
     -- device_ram_update[uxn_c_l393_c26_6cdb] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE <= VAR_device_ram_update_uxn_c_l393_c26_6cdb_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_c_l393_c26_6cdb_device_address <= VAR_device_ram_update_uxn_c_l393_c26_6cdb_device_address;
     device_ram_update_uxn_c_l393_c26_6cdb_value <= VAR_device_ram_update_uxn_c_l393_c26_6cdb_value;
     device_ram_update_uxn_c_l393_c26_6cdb_write_enable <= VAR_device_ram_update_uxn_c_l393_c26_6cdb_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_c_l393_c26_6cdb_return_output := device_ram_update_uxn_c_l393_c26_6cdb_return_output;

     -- step_gpu[uxn_c_l399_c20_c9ac] LATENCY=0
     -- Clock enable
     step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE <= VAR_step_gpu_uxn_c_l399_c20_c9ac_CLOCK_ENABLE;
     -- Inputs
     step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area <= VAR_step_gpu_uxn_c_l399_c20_c9ac_is_active_drawing_area;
     step_gpu_uxn_c_l399_c20_c9ac_is_vram_write <= VAR_step_gpu_uxn_c_l399_c20_c9ac_is_vram_write;
     step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer <= VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_write_layer;
     step_gpu_uxn_c_l399_c20_c9ac_vram_address <= VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_address;
     step_gpu_uxn_c_l399_c20_c9ac_vram_value <= VAR_step_gpu_uxn_c_l399_c20_c9ac_vram_value;
     step_gpu_uxn_c_l399_c20_c9ac_cycle <= VAR_step_gpu_uxn_c_l399_c20_c9ac_cycle;
     step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap <= VAR_step_gpu_uxn_c_l399_c20_c9ac_enable_buffer_swap;
     step_gpu_uxn_c_l399_c20_c9ac_swap_buffers <= VAR_step_gpu_uxn_c_l399_c20_c9ac_swap_buffers;
     -- Outputs
     VAR_step_gpu_uxn_c_l399_c20_c9ac_return_output := step_gpu_uxn_c_l399_c20_c9ac_return_output;

     -- main_ram_update[uxn_c_l387_c19_71ab] LATENCY=0
     -- Clock enable
     main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE <= VAR_main_ram_update_uxn_c_l387_c19_71ab_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_uxn_c_l387_c19_71ab_ram_address <= VAR_main_ram_update_uxn_c_l387_c19_71ab_ram_address;
     main_ram_update_uxn_c_l387_c19_71ab_value <= VAR_main_ram_update_uxn_c_l387_c19_71ab_value;
     main_ram_update_uxn_c_l387_c19_71ab_write_enable <= VAR_main_ram_update_uxn_c_l387_c19_71ab_write_enable;
     -- Outputs
     VAR_main_ram_update_uxn_c_l387_c19_71ab_return_output := main_ram_update_uxn_c_l387_c19_71ab_return_output;

     -- vector_snoop[uxn_c_l401_c12_39a9] LATENCY=0
     -- Clock enable
     vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE <= VAR_vector_snoop_uxn_c_l401_c12_39a9_CLOCK_ENABLE;
     -- Inputs
     vector_snoop_uxn_c_l401_c12_39a9_device_ram_address <= VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_address;
     vector_snoop_uxn_c_l401_c12_39a9_device_ram_value <= VAR_vector_snoop_uxn_c_l401_c12_39a9_device_ram_value;
     vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write <= VAR_vector_snoop_uxn_c_l401_c12_39a9_is_device_ram_write;
     -- Outputs
     VAR_vector_snoop_uxn_c_l401_c12_39a9_return_output := vector_snoop_uxn_c_l401_c12_39a9_return_output;

     -- Submodule level 12
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_c_l393_c26_6cdb_return_output;
     REG_VAR_ram_read_value := VAR_main_ram_update_uxn_c_l387_c19_71ab_return_output;
     REG_VAR_gpu_step_result := VAR_step_gpu_uxn_c_l399_c20_c9ac_return_output;
     REG_VAR_vectors := VAR_vector_snoop_uxn_c_l401_c12_39a9_return_output;
     -- CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d[uxn_c_l400_c92_879b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l400_c92_879b_return_output := VAR_step_gpu_uxn_c_l399_c20_c9ac_return_output.color;

     -- Submodule level 13
     VAR_palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color := VAR_CONST_REF_RD_uint2_t_gpu_step_result_t_color_d41d_uxn_c_l400_c92_879b_return_output;
     -- palette_snoop[uxn_c_l400_c20_15f5] LATENCY=0
     -- Clock enable
     palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE <= VAR_palette_snoop_uxn_c_l400_c20_15f5_CLOCK_ENABLE;
     -- Inputs
     palette_snoop_uxn_c_l400_c20_15f5_device_ram_address <= VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_address;
     palette_snoop_uxn_c_l400_c20_15f5_device_ram_value <= VAR_palette_snoop_uxn_c_l400_c20_15f5_device_ram_value;
     palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write <= VAR_palette_snoop_uxn_c_l400_c20_15f5_is_device_ram_write;
     palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color <= VAR_palette_snoop_uxn_c_l400_c20_15f5_gpu_step_color;
     -- Outputs
     VAR_palette_snoop_uxn_c_l400_c20_15f5_return_output := palette_snoop_uxn_c_l400_c20_15f5_return_output;

     -- Submodule level 14
     VAR_return_output := VAR_palette_snoop_uxn_c_l400_c20_15f5_return_output;
     REG_VAR_uxn_eval_result := VAR_palette_snoop_uxn_c_l400_c20_15f5_return_output;
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
REG_COMB_controller0_buttons <= REG_VAR_controller0_buttons;
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
     controller0_buttons <= REG_COMB_controller0_buttons;
     cycle_count <= REG_COMB_cycle_count;
 end if;
 end if;
end process;

end arch;
