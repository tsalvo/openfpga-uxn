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
entity step_gpu_0CLK_8cfe5299 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 is_vram_write : in unsigned(0 downto 0);
 vram_address : in unsigned(31 downto 0);
 vram_value : in unsigned(1 downto 0);
 return_output : out unsigned(1 downto 0));
end step_gpu_0CLK_8cfe5299;
architecture arch of step_gpu_0CLK_8cfe5299 is
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
-- bg_vram_update[uxn_c_l108_c20_f4bf]
signal bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l108_c20_f4bf_read_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l108_c20_f4bf_write_address : unsigned(31 downto 0);
signal bg_vram_update_uxn_c_l108_c20_f4bf_write_value : unsigned(1 downto 0);
signal bg_vram_update_uxn_c_l108_c20_f4bf_write_enable : unsigned(0 downto 0);
signal bg_vram_update_uxn_c_l108_c20_f4bf_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l123_c6_cfa3]
signal BIN_OP_EQ_uxn_c_l123_c6_cfa3_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c6_cfa3_right : unsigned(17 downto 0);
signal BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l123_c2_d65b]
signal pixel_counter_MUX_uxn_c_l123_c2_d65b_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l125_c9_e6d2]
signal pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l126_c3_25bf]
signal BIN_OP_PLUS_uxn_c_l126_c3_25bf_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l126_c3_25bf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output : unsigned(32 downto 0);

-- printf_uxn_c_l129_c2_a502[uxn_c_l129_c2_a502]
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3 : unsigned(31 downto 0);
signal printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4 : unsigned(31 downto 0);


begin

-- SUBMODULE INSTANCES 
-- bg_vram_update_uxn_c_l108_c20_f4bf
bg_vram_update_uxn_c_l108_c20_f4bf : entity work.bg_vram_update_0CLK_b45f1687 port map (
clk,
bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE,
bg_vram_update_uxn_c_l108_c20_f4bf_read_address,
bg_vram_update_uxn_c_l108_c20_f4bf_write_address,
bg_vram_update_uxn_c_l108_c20_f4bf_write_value,
bg_vram_update_uxn_c_l108_c20_f4bf_write_enable,
bg_vram_update_uxn_c_l108_c20_f4bf_return_output);

-- BIN_OP_EQ_uxn_c_l123_c6_cfa3
BIN_OP_EQ_uxn_c_l123_c6_cfa3 : entity work.BIN_OP_EQ_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l123_c6_cfa3_left,
BIN_OP_EQ_uxn_c_l123_c6_cfa3_right,
BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output);

-- pixel_counter_MUX_uxn_c_l123_c2_d65b
pixel_counter_MUX_uxn_c_l123_c2_d65b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l123_c2_d65b_cond,
pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue,
pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse,
pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output);

-- pixel_counter_MUX_uxn_c_l125_c9_e6d2
pixel_counter_MUX_uxn_c_l125_c9_e6d2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond,
pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue,
pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse,
pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output);

-- BIN_OP_PLUS_uxn_c_l126_c3_25bf
BIN_OP_PLUS_uxn_c_l126_c3_25bf : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l126_c3_25bf_left,
BIN_OP_PLUS_uxn_c_l126_c3_25bf_right,
BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output);

-- printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502 : entity work.printf_uxn_c_l129_c2_a502_0CLK_de264c78 port map (
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE,
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0,
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1,
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2,
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3,
printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4);



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
 bg_vram_update_uxn_c_l108_c20_f4bf_return_output,
 BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output,
 pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output,
 pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output,
 BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_is_vram_write : unsigned(0 downto 0);
 variable VAR_vram_address : unsigned(31 downto 0);
 variable VAR_vram_value : unsigned(1 downto 0);
 variable VAR_step_gpu_result_uxn_c_l108_c2_afbc : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_read_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_address : unsigned(31 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_value : unsigned(1 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_enable : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_uxn_c_l108_c20_f4bf_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l124_c3_4a2f : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l126_c3_de77 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output : unsigned(32 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4 : unsigned(31 downto 0);
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
     VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_right := to_unsigned(143999, 18);
     VAR_pixel_counter_uxn_c_l124_c3_4a2f := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue := VAR_pixel_counter_uxn_c_l124_c3_4a2f;
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_right := to_unsigned(1, 1);

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
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond := VAR_is_active_drawing_area;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0 := resize(VAR_is_active_drawing_area, 32);
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_enable := VAR_is_vram_write;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1 := resize(VAR_is_vram_write, 32);
     VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_left := pixel_counter;
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_read_address := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse := pixel_counter;
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_address := VAR_vram_address;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2 := VAR_vram_address;
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_value := VAR_vram_value;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3 := resize(VAR_vram_value, 32);
     -- bg_vram_update[uxn_c_l108_c20_f4bf] LATENCY=0
     -- Clock enable
     bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE <= VAR_bg_vram_update_uxn_c_l108_c20_f4bf_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_uxn_c_l108_c20_f4bf_read_address <= VAR_bg_vram_update_uxn_c_l108_c20_f4bf_read_address;
     bg_vram_update_uxn_c_l108_c20_f4bf_write_address <= VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_address;
     bg_vram_update_uxn_c_l108_c20_f4bf_write_value <= VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_value;
     bg_vram_update_uxn_c_l108_c20_f4bf_write_enable <= VAR_bg_vram_update_uxn_c_l108_c20_f4bf_write_enable;
     -- Outputs
     VAR_bg_vram_update_uxn_c_l108_c20_f4bf_return_output := bg_vram_update_uxn_c_l108_c20_f4bf_return_output;

     -- BIN_OP_PLUS[uxn_c_l126_c3_25bf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l126_c3_25bf_left <= VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_left;
     BIN_OP_PLUS_uxn_c_l126_c3_25bf_right <= VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output := BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output;

     -- BIN_OP_EQ[uxn_c_l123_c6_cfa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l123_c6_cfa3_left <= VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_left;
     BIN_OP_EQ_uxn_c_l123_c6_cfa3_right <= VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output := BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_cond := VAR_BIN_OP_EQ_uxn_c_l123_c6_cfa3_return_output;
     VAR_pixel_counter_uxn_c_l126_c3_de77 := resize(VAR_BIN_OP_PLUS_uxn_c_l126_c3_25bf_return_output, 32);
     VAR_step_gpu_result_uxn_c_l108_c2_afbc := VAR_bg_vram_update_uxn_c_l108_c20_f4bf_return_output;
     VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue := VAR_pixel_counter_uxn_c_l126_c3_de77;
     VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4 := resize(VAR_step_gpu_result_uxn_c_l108_c2_afbc, 32);
     VAR_return_output := VAR_step_gpu_result_uxn_c_l108_c2_afbc;
     REG_VAR_step_gpu_result := VAR_step_gpu_result_uxn_c_l108_c2_afbc;
     -- pixel_counter_MUX[uxn_c_l125_c9_e6d2] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond <= VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_cond;
     pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue <= VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iftrue;
     pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse <= VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output := pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output;

     -- printf_uxn_c_l129_c2_a502[uxn_c_l129_c2_a502] LATENCY=0
     -- Clock enable
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0 <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg0;
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1 <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg1;
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2 <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg2;
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3 <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg3;
     printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4 <= VAR_printf_uxn_c_l129_c2_a502_uxn_c_l129_c2_a502_arg4;
     -- Outputs

     -- Submodule level 2
     VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse := VAR_pixel_counter_MUX_uxn_c_l125_c9_e6d2_return_output;
     -- pixel_counter_MUX[uxn_c_l123_c2_d65b] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l123_c2_d65b_cond <= VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_cond;
     pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue <= VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iftrue;
     pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse <= VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output := pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output;

     -- Submodule level 3
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l123_c2_d65b_return_output;
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
