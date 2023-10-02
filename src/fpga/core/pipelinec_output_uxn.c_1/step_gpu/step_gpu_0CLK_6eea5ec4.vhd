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
-- background_vram_update[uxn_c_l115_c20_a850]
signal background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_write0_address : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_write0_value : unsigned(1 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_write0_enable : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_read1_address : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_read1_enable : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l115_c20_a850_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l123_c6_acbe]
signal BIN_OP_EQ_uxn_c_l123_c6_acbe_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c6_acbe_right : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l123_c2_cd54]
signal pixel_counter_MUX_uxn_c_l123_c2_cd54_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l125_c9_31a2]
signal pixel_counter_MUX_uxn_c_l125_c9_31a2_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l126_c3_0ca1]
signal BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output : unsigned(32 downto 0);

-- printf_uxn_c_l129_c2_d650[uxn_c_l129_c2_d650]
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4 : unsigned(31 downto 0);


begin

-- SUBMODULE INSTANCES 
-- background_vram_update_uxn_c_l115_c20_a850
background_vram_update_uxn_c_l115_c20_a850 : entity work.background_vram_update_0CLK_3257e709 port map (
clk,
background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE,
background_vram_update_uxn_c_l115_c20_a850_write0_address,
background_vram_update_uxn_c_l115_c20_a850_write0_value,
background_vram_update_uxn_c_l115_c20_a850_write0_enable,
background_vram_update_uxn_c_l115_c20_a850_read1_address,
background_vram_update_uxn_c_l115_c20_a850_read1_enable,
background_vram_update_uxn_c_l115_c20_a850_return_output);

-- BIN_OP_EQ_uxn_c_l123_c6_acbe
BIN_OP_EQ_uxn_c_l123_c6_acbe : entity work.BIN_OP_EQ_uint32_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l123_c6_acbe_left,
BIN_OP_EQ_uxn_c_l123_c6_acbe_right,
BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output);

-- pixel_counter_MUX_uxn_c_l123_c2_cd54
pixel_counter_MUX_uxn_c_l123_c2_cd54 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l123_c2_cd54_cond,
pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue,
pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse,
pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output);

-- pixel_counter_MUX_uxn_c_l125_c9_31a2
pixel_counter_MUX_uxn_c_l125_c9_31a2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l125_c9_31a2_cond,
pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue,
pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse,
pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output);

-- BIN_OP_PLUS_uxn_c_l126_c3_0ca1
BIN_OP_PLUS_uxn_c_l126_c3_0ca1 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left,
BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right,
BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output);

-- printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650 : entity work.printf_uxn_c_l129_c2_d650_0CLK_de264c78 port map (
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE,
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0,
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1,
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2,
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3,
printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4);



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
 background_vram_update_uxn_c_l115_c20_a850_return_output,
 BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output,
 pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output,
 pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output,
 BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_result_uxn_c_l115_c2_a801 : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_write0_address : unsigned(31 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_write0_value : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_write0_enable : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_read1_address : unsigned(31 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_read1_enable : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l115_c20_a850_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l124_c3_f143 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l126_c3_41c5 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output : unsigned(32 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4 : unsigned(31 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_right := to_unsigned(76799, 17);
     VAR_pixel_counter_uxn_c_l124_c3_f143 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue := VAR_pixel_counter_uxn_c_l124_c3_f143;
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right := to_unsigned(1, 1);

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
     VAR_background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_background_vram_update_uxn_c_l115_c20_a850_read1_enable := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_cond := VAR_is_active_drawing_area;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0 := resize(VAR_is_active_drawing_area, 32);
     VAR_background_vram_update_uxn_c_l115_c20_a850_write0_enable := VAR_is_vram_write;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1 := resize(VAR_is_vram_write, 32);
     VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left := pixel_counter;
     VAR_background_vram_update_uxn_c_l115_c20_a850_read1_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse := pixel_counter;
     VAR_background_vram_update_uxn_c_l115_c20_a850_write0_address := VAR_vram_address;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2 := VAR_vram_address;
     VAR_background_vram_update_uxn_c_l115_c20_a850_write0_value := VAR_vram_value;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3 := resize(VAR_vram_value, 32);
     -- BIN_OP_PLUS[uxn_c_l126_c3_0ca1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left <= VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_left;
     BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right <= VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output := BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output;

     -- background_vram_update[uxn_c_l115_c20_a850] LATENCY=0
     -- Clock enable
     background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE <= VAR_background_vram_update_uxn_c_l115_c20_a850_CLOCK_ENABLE;
     -- Inputs
     background_vram_update_uxn_c_l115_c20_a850_write0_address <= VAR_background_vram_update_uxn_c_l115_c20_a850_write0_address;
     background_vram_update_uxn_c_l115_c20_a850_write0_value <= VAR_background_vram_update_uxn_c_l115_c20_a850_write0_value;
     background_vram_update_uxn_c_l115_c20_a850_write0_enable <= VAR_background_vram_update_uxn_c_l115_c20_a850_write0_enable;
     background_vram_update_uxn_c_l115_c20_a850_read1_address <= VAR_background_vram_update_uxn_c_l115_c20_a850_read1_address;
     background_vram_update_uxn_c_l115_c20_a850_read1_enable <= VAR_background_vram_update_uxn_c_l115_c20_a850_read1_enable;
     -- Outputs
     VAR_background_vram_update_uxn_c_l115_c20_a850_return_output := background_vram_update_uxn_c_l115_c20_a850_return_output;

     -- BIN_OP_EQ[uxn_c_l123_c6_acbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l123_c6_acbe_left <= VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_left;
     BIN_OP_EQ_uxn_c_l123_c6_acbe_right <= VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output := BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_cond := VAR_BIN_OP_EQ_uxn_c_l123_c6_acbe_return_output;
     VAR_pixel_counter_uxn_c_l126_c3_41c5 := resize(VAR_BIN_OP_PLUS_uxn_c_l126_c3_0ca1_return_output, 32);
     VAR_step_gpu_result_uxn_c_l115_c2_a801 := VAR_background_vram_update_uxn_c_l115_c20_a850_return_output;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue := VAR_pixel_counter_uxn_c_l126_c3_41c5;
     VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4 := resize(VAR_step_gpu_result_uxn_c_l115_c2_a801, 32);
     VAR_return_output := VAR_step_gpu_result_uxn_c_l115_c2_a801;
     REG_VAR_step_gpu_result := VAR_step_gpu_result_uxn_c_l115_c2_a801;
     -- printf_uxn_c_l129_c2_d650[uxn_c_l129_c2_d650] LATENCY=0
     -- Clock enable
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0 <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg0;
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1 <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg1;
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2 <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg2;
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3 <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg3;
     printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4 <= VAR_printf_uxn_c_l129_c2_d650_uxn_c_l129_c2_d650_arg4;
     -- Outputs

     -- pixel_counter_MUX[uxn_c_l125_c9_31a2] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l125_c9_31a2_cond <= VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_cond;
     pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue <= VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iftrue;
     pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse <= VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output := pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output;

     -- Submodule level 2
     VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse := VAR_pixel_counter_MUX_uxn_c_l125_c9_31a2_return_output;
     -- pixel_counter_MUX[uxn_c_l123_c2_cd54] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l123_c2_cd54_cond <= VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_cond;
     pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue <= VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iftrue;
     pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse <= VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output := pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output;

     -- Submodule level 3
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l123_c2_cd54_return_output;
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