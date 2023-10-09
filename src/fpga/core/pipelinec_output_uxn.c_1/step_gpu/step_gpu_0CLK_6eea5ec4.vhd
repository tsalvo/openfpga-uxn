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
-- Submodules: 6
entity step_gpu_0CLK_6eea5ec4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out unsigned(1 downto 0));
end step_gpu_0CLK_6eea5ec4;
architecture arch of step_gpu_0CLK_6eea5ec4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal step_gpu_result : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_step_gpu_result : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(31 downto 0);

-- Each function instance gets signals
-- background_vram_update[uxn_c_l112_c20_bf9c]
signal background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_write0_address : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_write0_value : unsigned(1 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_write0_enable : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_read1_address : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_read1_enable : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l112_c20_bf9c_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l120_c6_690a]
signal BIN_OP_EQ_uxn_c_l120_c6_690a_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l120_c6_690a_right : unsigned(19 downto 0);
signal BIN_OP_EQ_uxn_c_l120_c6_690a_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l120_c2_e618]
signal pixel_counter_MUX_uxn_c_l120_c2_e618_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l120_c2_e618_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l122_c9_abdc]
signal pixel_counter_MUX_uxn_c_l122_c9_abdc_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l123_c3_9dd6]
signal BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output : unsigned(32 downto 0);

-- printf_uxn_c_l126_c2_3ed9[uxn_c_l126_c2_3ed9]
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4 : unsigned(31 downto 0);


begin

-- SUBMODULE INSTANCES 
-- background_vram_update_uxn_c_l112_c20_bf9c
background_vram_update_uxn_c_l112_c20_bf9c : entity work.background_vram_update_0CLK_3257e709 port map (
clk,
background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE,
background_vram_update_uxn_c_l112_c20_bf9c_write0_address,
background_vram_update_uxn_c_l112_c20_bf9c_write0_value,
background_vram_update_uxn_c_l112_c20_bf9c_write0_enable,
background_vram_update_uxn_c_l112_c20_bf9c_read1_address,
background_vram_update_uxn_c_l112_c20_bf9c_read1_enable,
background_vram_update_uxn_c_l112_c20_bf9c_return_output);

-- BIN_OP_EQ_uxn_c_l120_c6_690a
BIN_OP_EQ_uxn_c_l120_c6_690a : entity work.BIN_OP_EQ_uint32_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l120_c6_690a_left,
BIN_OP_EQ_uxn_c_l120_c6_690a_right,
BIN_OP_EQ_uxn_c_l120_c6_690a_return_output);

-- pixel_counter_MUX_uxn_c_l120_c2_e618
pixel_counter_MUX_uxn_c_l120_c2_e618 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l120_c2_e618_cond,
pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue,
pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse,
pixel_counter_MUX_uxn_c_l120_c2_e618_return_output);

-- pixel_counter_MUX_uxn_c_l122_c9_abdc
pixel_counter_MUX_uxn_c_l122_c9_abdc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l122_c9_abdc_cond,
pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue,
pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse,
pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output);

-- BIN_OP_PLUS_uxn_c_l123_c3_9dd6
BIN_OP_PLUS_uxn_c_l123_c3_9dd6 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left,
BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right,
BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output);

-- printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9 : entity work.printf_uxn_c_l126_c2_3ed9_0CLK_de264c78 port map (
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE,
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0,
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1,
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2,
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3,
printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_active_drawing_area,
 is_vram_write,
 vram_address,
 vram_value,
 -- Registers
 step_gpu_result,
 pixel_counter,
 -- All submodule outputs
 background_vram_update_uxn_c_l112_c20_bf9c_return_output,
 BIN_OP_EQ_uxn_c_l120_c6_690a_return_output,
 pixel_counter_MUX_uxn_c_l120_c2_e618_return_output,
 pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output,
 BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_result_uxn_c_l112_c2_3c48 : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_address : unsigned(31 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_value : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_enable : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_address : unsigned(31 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_enable : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l112_c20_bf9c_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l121_c3_2c49 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l123_c3_87a2 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output : unsigned(32 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4 : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_step_gpu_result : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_step_gpu_result := step_gpu_result;
  REG_VAR_pixel_counter := pixel_counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_right := to_unsigned(575999, 20);
     VAR_pixel_counter_uxn_c_l121_c3_2c49 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue := VAR_pixel_counter_uxn_c_l121_c3_2c49;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_active_drawing_area := is_active_drawing_area;
     VAR_is_vram_write := is_vram_write;
     VAR_vram_address := vram_address;
     VAR_vram_value := vram_value;

     -- Submodule level 0
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_enable := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_cond := VAR_is_active_drawing_area;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0 := resize(VAR_is_active_drawing_area, 32);
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_enable := VAR_is_vram_write;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1 := resize(VAR_is_vram_write, 32);
     VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left := pixel_counter;
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse := pixel_counter;
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_address := VAR_vram_address;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2 := VAR_vram_address;
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_value := VAR_vram_value;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3 := resize(VAR_vram_value, 32);
     -- BIN_OP_PLUS[uxn_c_l123_c3_9dd6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left <= VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_left;
     BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right <= VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output := BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output;

     -- BIN_OP_EQ[uxn_c_l120_c6_690a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l120_c6_690a_left <= VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_left;
     BIN_OP_EQ_uxn_c_l120_c6_690a_right <= VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_return_output := BIN_OP_EQ_uxn_c_l120_c6_690a_return_output;

     -- background_vram_update[uxn_c_l112_c20_bf9c] LATENCY=0
     -- Clock enable
     background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_CLOCK_ENABLE;
     -- Inputs
     background_vram_update_uxn_c_l112_c20_bf9c_write0_address <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_address;
     background_vram_update_uxn_c_l112_c20_bf9c_write0_value <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_value;
     background_vram_update_uxn_c_l112_c20_bf9c_write0_enable <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_write0_enable;
     background_vram_update_uxn_c_l112_c20_bf9c_read1_address <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_address;
     background_vram_update_uxn_c_l112_c20_bf9c_read1_enable <= VAR_background_vram_update_uxn_c_l112_c20_bf9c_read1_enable;
     -- Outputs
     VAR_background_vram_update_uxn_c_l112_c20_bf9c_return_output := background_vram_update_uxn_c_l112_c20_bf9c_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_cond := VAR_BIN_OP_EQ_uxn_c_l120_c6_690a_return_output;
     VAR_pixel_counter_uxn_c_l123_c3_87a2 := resize(VAR_BIN_OP_PLUS_uxn_c_l123_c3_9dd6_return_output, 32);
     VAR_step_gpu_result_uxn_c_l112_c2_3c48 := VAR_background_vram_update_uxn_c_l112_c20_bf9c_return_output;
     VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue := VAR_pixel_counter_uxn_c_l123_c3_87a2;
     VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4 := resize(VAR_step_gpu_result_uxn_c_l112_c2_3c48, 32);
     VAR_return_output := VAR_step_gpu_result_uxn_c_l112_c2_3c48;
     REG_VAR_step_gpu_result := VAR_step_gpu_result_uxn_c_l112_c2_3c48;
     -- pixel_counter_MUX[uxn_c_l122_c9_abdc] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l122_c9_abdc_cond <= VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_cond;
     pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue <= VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iftrue;
     pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse <= VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output := pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output;

     -- printf_uxn_c_l126_c2_3ed9[uxn_c_l126_c2_3ed9] LATENCY=0
     -- Clock enable
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0 <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg0;
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1 <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg1;
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2 <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg2;
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3 <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg3;
     printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4 <= VAR_printf_uxn_c_l126_c2_3ed9_uxn_c_l126_c2_3ed9_arg4;
     -- Outputs

     -- Submodule level 2
     VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse := VAR_pixel_counter_MUX_uxn_c_l122_c9_abdc_return_output;
     -- pixel_counter_MUX[uxn_c_l120_c2_e618] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l120_c2_e618_cond <= VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_cond;
     pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue <= VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iftrue;
     pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse <= VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_return_output := pixel_counter_MUX_uxn_c_l120_c2_e618_return_output;

     -- Submodule level 3
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l120_c2_e618_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_step_gpu_result <= REG_VAR_step_gpu_result;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     step_gpu_result <= REG_COMB_step_gpu_result;
     pixel_counter <= REG_COMB_pixel_counter;
 end if;
 end if;
end process;

end arch;
