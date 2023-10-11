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
-- Submodules: 11
entity step_gpu_0CLK_d43adcb6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_write_layer : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out unsigned(1 downto 0));
end step_gpu_0CLK_d43adcb6;
architecture arch of step_gpu_0CLK_d43adcb6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal fg_pixel : unsigned(1 downto 0) := to_unsigned(0, 2);
signal bg_pixel : unsigned(1 downto 0) := to_unsigned(0, 2);
signal step_gpu_result : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_fg_pixel : unsigned(1 downto 0);
signal REG_COMB_bg_pixel : unsigned(1 downto 0);
signal REG_COMB_step_gpu_result : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(31 downto 0);

-- Each function instance gets signals
-- UNARY_OP_NOT[uxn_c_l112_c21_0a70]
signal UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_c_l112_c3_33f4]
signal BIN_OP_AND_uxn_c_l112_c3_33f4_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l112_c3_33f4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l112_c3_33f4_return_output : unsigned(0 downto 0);

-- bg_vram_update[uxn_c_l108_c13_a1e7]
signal bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l108_c13_a1e7_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l108_c13_a1e7_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l108_c13_a1e7_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l108_c13_a1e7_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l108_c13_a1e7_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_c_l119_c3_51c3]
signal BIN_OP_AND_uxn_c_l119_c3_51c3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l119_c3_51c3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_c_l119_c3_51c3_return_output : unsigned(0 downto 0);

-- fg_vram_update[uxn_c_l115_c13_7337]
signal fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l115_c13_7337_read_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l115_c13_7337_write_address : unsigned(31 downto 0);
signal fg_vram_update_uxn_c_l115_c13_7337_write_value : unsigned(1 downto 0);
signal fg_vram_update_uxn_c_l115_c13_7337_write_enable : unsigned(0 downto 0);
signal fg_vram_update_uxn_c_l115_c13_7337_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l122_c20_fddf]
signal BIN_OP_EQ_uxn_c_l122_c20_fddf_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_c_l122_c20_fddf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output : unsigned(0 downto 0);

-- MUX[uxn_c_l122_c20_95f4]
signal MUX_uxn_c_l122_c20_95f4_cond : unsigned(0 downto 0);
signal MUX_uxn_c_l122_c20_95f4_iftrue : unsigned(1 downto 0);
signal MUX_uxn_c_l122_c20_95f4_iffalse : unsigned(1 downto 0);
signal MUX_uxn_c_l122_c20_95f4_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l125_c6_89e0]
signal BIN_OP_EQ_uxn_c_l125_c6_89e0_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l125_c6_89e0_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l125_c2_1a72]
signal pixel_counter_MUX_uxn_c_l125_c2_1a72_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l127_c9_63a4]
signal pixel_counter_MUX_uxn_c_l127_c9_63a4_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l128_c3_a069]
signal BIN_OP_PLUS_uxn_c_l128_c3_a069_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l128_c3_a069_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output : unsigned(32 downto 0);


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_uxn_c_l112_c21_0a70
UNARY_OP_NOT_uxn_c_l112_c21_0a70 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr,
UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output);

-- BIN_OP_AND_uxn_c_l112_c3_33f4
BIN_OP_AND_uxn_c_l112_c3_33f4 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l112_c3_33f4_left,
BIN_OP_AND_uxn_c_l112_c3_33f4_right,
BIN_OP_AND_uxn_c_l112_c3_33f4_return_output);

-- bg_vram_update_uxn_c_l108_c13_a1e7
bg_vram_update_uxn_c_l108_c13_a1e7 : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE,
bg_vram_update_uxn_c_l108_c13_a1e7_read_address,
bg_vram_update_uxn_c_l108_c13_a1e7_write_address,
bg_vram_update_uxn_c_l108_c13_a1e7_write_value,
bg_vram_update_uxn_c_l108_c13_a1e7_write_enable,
bg_vram_update_uxn_c_l108_c13_a1e7_return_output);

-- BIN_OP_AND_uxn_c_l119_c3_51c3
BIN_OP_AND_uxn_c_l119_c3_51c3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l119_c3_51c3_left,
BIN_OP_AND_uxn_c_l119_c3_51c3_right,
BIN_OP_AND_uxn_c_l119_c3_51c3_return_output);

-- fg_vram_update_uxn_c_l115_c13_7337
fg_vram_update_uxn_c_l115_c13_7337 : entity work.fg_vram_update_0CLK_b45f1687 port map (
clk,
fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE,
fg_vram_update_uxn_c_l115_c13_7337_read_address,
fg_vram_update_uxn_c_l115_c13_7337_write_address,
fg_vram_update_uxn_c_l115_c13_7337_write_value,
fg_vram_update_uxn_c_l115_c13_7337_write_enable,
fg_vram_update_uxn_c_l115_c13_7337_return_output);

-- BIN_OP_EQ_uxn_c_l122_c20_fddf
BIN_OP_EQ_uxn_c_l122_c20_fddf : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l122_c20_fddf_left,
BIN_OP_EQ_uxn_c_l122_c20_fddf_right,
BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output);

-- MUX_uxn_c_l122_c20_95f4
MUX_uxn_c_l122_c20_95f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_c_l122_c20_95f4_cond,
MUX_uxn_c_l122_c20_95f4_iftrue,
MUX_uxn_c_l122_c20_95f4_iffalse,
MUX_uxn_c_l122_c20_95f4_return_output);

-- BIN_OP_EQ_uxn_c_l125_c6_89e0
BIN_OP_EQ_uxn_c_l125_c6_89e0 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l125_c6_89e0_left,
BIN_OP_EQ_uxn_c_l125_c6_89e0_right,
BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output);

-- pixel_counter_MUX_uxn_c_l125_c2_1a72
pixel_counter_MUX_uxn_c_l125_c2_1a72 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l125_c2_1a72_cond,
pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue,
pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse,
pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output);

-- pixel_counter_MUX_uxn_c_l127_c9_63a4
pixel_counter_MUX_uxn_c_l127_c9_63a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l127_c9_63a4_cond,
pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue,
pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse,
pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output);

-- BIN_OP_PLUS_uxn_c_l128_c3_a069
BIN_OP_PLUS_uxn_c_l128_c3_a069 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l128_c3_a069_left,
BIN_OP_PLUS_uxn_c_l128_c3_a069_right,
BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_active_drawing_area,
 is_vram_write,
 vram_write_layer,
 vram_address,
 vram_value,
 -- Registers
 fg_pixel,
 bg_pixel,
 step_gpu_result,
 pixel_counter,
 -- All submodule outputs
 UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output,
 BIN_OP_AND_uxn_c_l112_c3_33f4_return_output,
 bg_vram_update_uxn_c_l108_c13_a1e7_return_output,
 BIN_OP_AND_uxn_c_l119_c3_51c3_return_output,
 fg_vram_update_uxn_c_l115_c13_7337_return_output,
 BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output,
 MUX_uxn_c_l122_c20_95f4_return_output,
 BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output,
 pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output,
 pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output,
 BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_write_layer : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_enable : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_return_output : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c13_a1e7_return_output : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_read_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_write_address : unsigned(31 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_write_value : unsigned(1 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_write_enable : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_return_output : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_uxn_c_l115_c13_7337_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l122_c20_95f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l122_c20_95f4_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_c_l122_c20_95f4_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_c_l122_c20_95f4_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l126_c3_bd58 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l128_c3_4fec : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_fg_pixel : unsigned(1 downto 0);
variable REG_VAR_bg_pixel : unsigned(1 downto 0);
variable REG_VAR_step_gpu_result : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_fg_pixel := fg_pixel;
  REG_VAR_bg_pixel := bg_pixel;
  REG_VAR_step_gpu_result := step_gpu_result;
  REG_VAR_pixel_counter := pixel_counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_right := to_unsigned(1, 1);
     VAR_pixel_counter_uxn_c_l126_c3_bd58 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue := VAR_pixel_counter_uxn_c_l126_c3_bd58;
     VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_active_drawing_area := is_active_drawing_area;
     VAR_is_vram_write := is_vram_write;
     VAR_vram_write_layer := vram_write_layer;
     VAR_vram_address := vram_address;
     VAR_vram_value := vram_value;

     -- Submodule level 0
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_left := VAR_is_vram_write;
     VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_left := VAR_is_vram_write;
     VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_left := pixel_counter;
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_read_address := pixel_counter;
     VAR_fg_vram_update_uxn_c_l115_c13_7337_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_address := VAR_vram_address;
     VAR_fg_vram_update_uxn_c_l115_c13_7337_write_address := VAR_vram_address;
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_value := VAR_vram_value;
     VAR_fg_vram_update_uxn_c_l115_c13_7337_write_value := VAR_vram_value;
     VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_right := VAR_vram_write_layer;
     VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr := VAR_vram_write_layer;
     -- BIN_OP_PLUS[uxn_c_l128_c3_a069] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l128_c3_a069_left <= VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_left;
     BIN_OP_PLUS_uxn_c_l128_c3_a069_right <= VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output := BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output;

     -- BIN_OP_AND[uxn_c_l119_c3_51c3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l119_c3_51c3_left <= VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_left;
     BIN_OP_AND_uxn_c_l119_c3_51c3_right <= VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_return_output := BIN_OP_AND_uxn_c_l119_c3_51c3_return_output;

     -- UNARY_OP_NOT[uxn_c_l112_c21_0a70] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr <= VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output := UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output;

     -- BIN_OP_EQ[uxn_c_l125_c6_89e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l125_c6_89e0_left <= VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_left;
     BIN_OP_EQ_uxn_c_l125_c6_89e0_right <= VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output := BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output;

     -- Submodule level 1
     VAR_fg_vram_update_uxn_c_l115_c13_7337_write_enable := VAR_BIN_OP_AND_uxn_c_l119_c3_51c3_return_output;
     VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_cond := VAR_BIN_OP_EQ_uxn_c_l125_c6_89e0_return_output;
     VAR_pixel_counter_uxn_c_l128_c3_4fec := resize(VAR_BIN_OP_PLUS_uxn_c_l128_c3_a069_return_output, 32);
     VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_right := VAR_UNARY_OP_NOT_uxn_c_l112_c21_0a70_return_output;
     VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue := VAR_pixel_counter_uxn_c_l128_c3_4fec;
     -- BIN_OP_AND[uxn_c_l112_c3_33f4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l112_c3_33f4_left <= VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_left;
     BIN_OP_AND_uxn_c_l112_c3_33f4_right <= VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_return_output := BIN_OP_AND_uxn_c_l112_c3_33f4_return_output;

     -- fg_vram_update[uxn_c_l115_c13_7337] LATENCY=0
     -- Clock enable
     fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE <= VAR_fg_vram_update_uxn_c_l115_c13_7337_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_uxn_c_l115_c13_7337_read_address <= VAR_fg_vram_update_uxn_c_l115_c13_7337_read_address;
     fg_vram_update_uxn_c_l115_c13_7337_write_address <= VAR_fg_vram_update_uxn_c_l115_c13_7337_write_address;
     fg_vram_update_uxn_c_l115_c13_7337_write_value <= VAR_fg_vram_update_uxn_c_l115_c13_7337_write_value;
     fg_vram_update_uxn_c_l115_c13_7337_write_enable <= VAR_fg_vram_update_uxn_c_l115_c13_7337_write_enable;
     -- Outputs
     VAR_fg_vram_update_uxn_c_l115_c13_7337_return_output := fg_vram_update_uxn_c_l115_c13_7337_return_output;

     -- pixel_counter_MUX[uxn_c_l127_c9_63a4] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l127_c9_63a4_cond <= VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_cond;
     pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue <= VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iftrue;
     pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse <= VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output := pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output;

     -- Submodule level 2
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_enable := VAR_BIN_OP_AND_uxn_c_l112_c3_33f4_return_output;
     VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_left := VAR_fg_vram_update_uxn_c_l115_c13_7337_return_output;
     VAR_MUX_uxn_c_l122_c20_95f4_iffalse := VAR_fg_vram_update_uxn_c_l115_c13_7337_return_output;
     REG_VAR_fg_pixel := VAR_fg_vram_update_uxn_c_l115_c13_7337_return_output;
     VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse := VAR_pixel_counter_MUX_uxn_c_l127_c9_63a4_return_output;
     -- BIN_OP_EQ[uxn_c_l122_c20_fddf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l122_c20_fddf_left <= VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_left;
     BIN_OP_EQ_uxn_c_l122_c20_fddf_right <= VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output := BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output;

     -- bg_vram_update[uxn_c_l108_c13_a1e7] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l108_c13_a1e7_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l108_c13_a1e7_read_address <= VAR_bg_vram_update_uxn_c_l108_c13_a1e7_read_address;
     bg_vram_update_uxn_c_l108_c13_a1e7_write_address <= VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_address;
     bg_vram_update_uxn_c_l108_c13_a1e7_write_value <= VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_value;
     bg_vram_update_uxn_c_l108_c13_a1e7_write_enable <= VAR_bg_vram_update_uxn_c_l108_c13_a1e7_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l108_c13_a1e7_return_output := bg_vram_update_uxn_c_l108_c13_a1e7_return_output;

     -- pixel_counter_MUX[uxn_c_l125_c2_1a72] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l125_c2_1a72_cond <= VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_cond;
     pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue <= VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iftrue;
     pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse <= VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output := pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_c_l122_c20_95f4_cond := VAR_BIN_OP_EQ_uxn_c_l122_c20_fddf_return_output;
     VAR_MUX_uxn_c_l122_c20_95f4_iftrue := VAR_bg_vram_update_uxn_c_l108_c13_a1e7_return_output;
     REG_VAR_bg_pixel := VAR_bg_vram_update_uxn_c_l108_c13_a1e7_return_output;
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l125_c2_1a72_return_output;
     -- MUX[uxn_c_l122_c20_95f4] LATENCY=0
     -- Inputs
     MUX_uxn_c_l122_c20_95f4_cond <= VAR_MUX_uxn_c_l122_c20_95f4_cond;
     MUX_uxn_c_l122_c20_95f4_iftrue <= VAR_MUX_uxn_c_l122_c20_95f4_iftrue;
     MUX_uxn_c_l122_c20_95f4_iffalse <= VAR_MUX_uxn_c_l122_c20_95f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_c_l122_c20_95f4_return_output := MUX_uxn_c_l122_c20_95f4_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_MUX_uxn_c_l122_c20_95f4_return_output;
     REG_VAR_step_gpu_result := VAR_MUX_uxn_c_l122_c20_95f4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_fg_pixel <= REG_VAR_fg_pixel;
REG_COMB_bg_pixel <= REG_VAR_bg_pixel;
REG_COMB_step_gpu_result <= REG_VAR_step_gpu_result;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     fg_pixel <= REG_COMB_fg_pixel;
     bg_pixel <= REG_COMB_bg_pixel;
     step_gpu_result <= REG_COMB_step_gpu_result;
     pixel_counter <= REG_COMB_pixel_counter;
 end if;
 end if;
end process;

end arch;
