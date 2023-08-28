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
-- Submodules: 8
entity step_gpu_0CLK_5d93c4a4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 is_active_drawing_area : in unsigned(0 downto 0);
 seconds_counter : in unsigned(31 downto 0);
 return_output : out unsigned(1 downto 0));
end step_gpu_0CLK_5d93c4a4;
architecture arch of step_gpu_0CLK_5d93c4a4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixel_counter : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_result : unsigned(1 downto 0);
signal REG_COMB_pixel_counter : unsigned(31 downto 0);

-- Each function instance gets signals
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l122_c1_a072]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l122_c2_5ae0]
signal result_MUX_uxn_c_l122_c2_5ae0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l122_c2_5ae0_iftrue : unsigned(1 downto 0);
signal result_MUX_uxn_c_l122_c2_5ae0_iffalse : unsigned(1 downto 0);
signal result_MUX_uxn_c_l122_c2_5ae0_return_output : unsigned(1 downto 0);

-- background_vram_update[uxn_c_l123_c12_a6de]
signal background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_write_address0 : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_write_value0 : unsigned(1 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_write_enable0 : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_read_enable0 : unsigned(0 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_read_address1 : unsigned(31 downto 0);
signal background_vram_update_uxn_c_l123_c12_a6de_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_c_l135_c6_3236]
signal BIN_OP_EQ_uxn_c_l135_c6_3236_left : unsigned(31 downto 0);
signal BIN_OP_EQ_uxn_c_l135_c6_3236_right : unsigned(16 downto 0);
signal BIN_OP_EQ_uxn_c_l135_c6_3236_return_output : unsigned(0 downto 0);

-- pixel_counter_MUX[uxn_c_l135_c2_91f6]
signal pixel_counter_MUX_uxn_c_l135_c2_91f6_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output : unsigned(31 downto 0);

-- pixel_counter_MUX[uxn_c_l137_c9_ae6b]
signal pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond : unsigned(0 downto 0);
signal pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse : unsigned(31 downto 0);
signal pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l138_c3_300a]
signal BIN_OP_PLUS_uxn_c_l138_c3_300a_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_c_l138_c3_300a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output : unsigned(32 downto 0);

function CAST_TO_uint2_t_uint32_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(31 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072
TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output);

-- result_MUX_uxn_c_l122_c2_5ae0
result_MUX_uxn_c_l122_c2_5ae0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l122_c2_5ae0_cond,
result_MUX_uxn_c_l122_c2_5ae0_iftrue,
result_MUX_uxn_c_l122_c2_5ae0_iffalse,
result_MUX_uxn_c_l122_c2_5ae0_return_output);

-- background_vram_update_uxn_c_l123_c12_a6de
background_vram_update_uxn_c_l123_c12_a6de : entity work.background_vram_update_0CLK_b4ec7bd0 port map (
clk,
background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE,
background_vram_update_uxn_c_l123_c12_a6de_write_address0,
background_vram_update_uxn_c_l123_c12_a6de_write_value0,
background_vram_update_uxn_c_l123_c12_a6de_write_enable0,
background_vram_update_uxn_c_l123_c12_a6de_read_enable0,
background_vram_update_uxn_c_l123_c12_a6de_read_address1,
background_vram_update_uxn_c_l123_c12_a6de_return_output);

-- BIN_OP_EQ_uxn_c_l135_c6_3236
BIN_OP_EQ_uxn_c_l135_c6_3236 : entity work.BIN_OP_EQ_uint32_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l135_c6_3236_left,
BIN_OP_EQ_uxn_c_l135_c6_3236_right,
BIN_OP_EQ_uxn_c_l135_c6_3236_return_output);

-- pixel_counter_MUX_uxn_c_l135_c2_91f6
pixel_counter_MUX_uxn_c_l135_c2_91f6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l135_c2_91f6_cond,
pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue,
pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse,
pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output);

-- pixel_counter_MUX_uxn_c_l137_c9_ae6b
pixel_counter_MUX_uxn_c_l137_c9_ae6b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond,
pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue,
pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse,
pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output);

-- BIN_OP_PLUS_uxn_c_l138_c3_300a
BIN_OP_PLUS_uxn_c_l138_c3_300a : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l138_c3_300a_left,
BIN_OP_PLUS_uxn_c_l138_c3_300a_right,
BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 is_active_drawing_area,
 seconds_counter,
 -- Registers
 result,
 pixel_counter,
 -- All submodule outputs
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output,
 result_MUX_uxn_c_l122_c2_5ae0_return_output,
 background_vram_update_uxn_c_l123_c12_a6de_return_output,
 BIN_OP_EQ_uxn_c_l135_c6_3236_return_output,
 pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output,
 pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output,
 BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_is_active_drawing_area : unsigned(0 downto 0);
 variable VAR_seconds_counter : unsigned(31 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l122_c2_5ae0_iftrue : unsigned(1 downto 0);
 variable VAR_result_MUX_uxn_c_l122_c2_5ae0_iffalse : unsigned(1 downto 0);
 variable VAR_result_uxn_c_l131_c3_2e55 : unsigned(1 downto 0);
 variable VAR_result_MUX_uxn_c_l122_c2_5ae0_return_output : unsigned(1 downto 0);
 variable VAR_result_MUX_uxn_c_l122_c2_5ae0_cond : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_write_address0 : unsigned(31 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_write_value0 : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_write_enable0 : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_read_enable0 : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_read_address1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_c_l125_c4_cace_return_output : unsigned(1 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_background_vram_update_uxn_c_l123_c12_a6de_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_return_output : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l136_c3_d216 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_cond : unsigned(0 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue : unsigned(31 downto 0);
 variable VAR_pixel_counter_uxn_c_l138_c3_b186 : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse : unsigned(31 downto 0);
 variable VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : unsigned(1 downto 0);
variable REG_VAR_pixel_counter : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_pixel_counter := pixel_counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_right := to_unsigned(76799, 17);
     VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_right := to_unsigned(1, 1);
     VAR_background_vram_update_uxn_c_l123_c12_a6de_read_enable0 := to_unsigned(0, 1);
     VAR_background_vram_update_uxn_c_l123_c12_a6de_write_enable0 := to_unsigned(1, 1);
     VAR_pixel_counter_uxn_c_l136_c3_d216 := resize(to_unsigned(0, 1), 32);
     VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue := VAR_pixel_counter_uxn_c_l136_c3_d216;
     VAR_result_uxn_c_l131_c3_2e55 := resize(to_unsigned(0, 1), 2);
     VAR_result_MUX_uxn_c_l122_c2_5ae0_iffalse := VAR_result_uxn_c_l131_c3_2e55;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_is_active_drawing_area := is_active_drawing_area;
     VAR_seconds_counter := seconds_counter;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond := VAR_is_active_drawing_area;
     VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond := VAR_is_active_drawing_area;
     VAR_result_MUX_uxn_c_l122_c2_5ae0_cond := VAR_is_active_drawing_area;
     VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_left := pixel_counter;
     VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_left := pixel_counter;
     VAR_background_vram_update_uxn_c_l123_c12_a6de_read_address1 := pixel_counter;
     VAR_background_vram_update_uxn_c_l123_c12_a6de_write_address0 := pixel_counter;
     VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse := pixel_counter;
     -- BIN_OP_EQ[uxn_c_l135_c6_3236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l135_c6_3236_left <= VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_left;
     BIN_OP_EQ_uxn_c_l135_c6_3236_right <= VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_return_output := BIN_OP_EQ_uxn_c_l135_c6_3236_return_output;

     -- BIN_OP_PLUS[uxn_c_l138_c3_300a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l138_c3_300a_left <= VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_left;
     BIN_OP_PLUS_uxn_c_l138_c3_300a_right <= VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output := BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output;

     -- CAST_TO_uint2_t[uxn_c_l125_c4_cace] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_c_l125_c4_cace_return_output := CAST_TO_uint2_t_uint32_t(
     VAR_seconds_counter);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l122_c1_a072] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output;

     -- Submodule level 1
     VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_cond := VAR_BIN_OP_EQ_uxn_c_l135_c6_3236_return_output;
     VAR_pixel_counter_uxn_c_l138_c3_b186 := resize(VAR_BIN_OP_PLUS_uxn_c_l138_c3_300a_return_output, 32);
     VAR_background_vram_update_uxn_c_l123_c12_a6de_write_value0 := VAR_CAST_TO_uint2_t_uxn_c_l125_c4_cace_return_output;
     VAR_background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l122_c1_a072_return_output;
     VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue := VAR_pixel_counter_uxn_c_l138_c3_b186;
     -- pixel_counter_MUX[uxn_c_l137_c9_ae6b] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond <= VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_cond;
     pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue <= VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iftrue;
     pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse <= VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output := pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output;

     -- background_vram_update[uxn_c_l123_c12_a6de] LATENCY=0
     -- Clock enable
     background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE <= VAR_background_vram_update_uxn_c_l123_c12_a6de_CLOCK_ENABLE;
     -- Inputs
     background_vram_update_uxn_c_l123_c12_a6de_write_address0 <= VAR_background_vram_update_uxn_c_l123_c12_a6de_write_address0;
     background_vram_update_uxn_c_l123_c12_a6de_write_value0 <= VAR_background_vram_update_uxn_c_l123_c12_a6de_write_value0;
     background_vram_update_uxn_c_l123_c12_a6de_write_enable0 <= VAR_background_vram_update_uxn_c_l123_c12_a6de_write_enable0;
     background_vram_update_uxn_c_l123_c12_a6de_read_enable0 <= VAR_background_vram_update_uxn_c_l123_c12_a6de_read_enable0;
     background_vram_update_uxn_c_l123_c12_a6de_read_address1 <= VAR_background_vram_update_uxn_c_l123_c12_a6de_read_address1;
     -- Outputs
     VAR_background_vram_update_uxn_c_l123_c12_a6de_return_output := background_vram_update_uxn_c_l123_c12_a6de_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_c_l122_c2_5ae0_iftrue := VAR_background_vram_update_uxn_c_l123_c12_a6de_return_output;
     VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse := VAR_pixel_counter_MUX_uxn_c_l137_c9_ae6b_return_output;
     -- result_MUX[uxn_c_l122_c2_5ae0] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l122_c2_5ae0_cond <= VAR_result_MUX_uxn_c_l122_c2_5ae0_cond;
     result_MUX_uxn_c_l122_c2_5ae0_iftrue <= VAR_result_MUX_uxn_c_l122_c2_5ae0_iftrue;
     result_MUX_uxn_c_l122_c2_5ae0_iffalse <= VAR_result_MUX_uxn_c_l122_c2_5ae0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l122_c2_5ae0_return_output := result_MUX_uxn_c_l122_c2_5ae0_return_output;

     -- pixel_counter_MUX[uxn_c_l135_c2_91f6] LATENCY=0
     -- Inputs
     pixel_counter_MUX_uxn_c_l135_c2_91f6_cond <= VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_cond;
     pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue <= VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iftrue;
     pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse <= VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_iffalse;
     -- Outputs
     VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output := pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output;

     -- Submodule level 3
     REG_VAR_pixel_counter := VAR_pixel_counter_MUX_uxn_c_l135_c2_91f6_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_c_l122_c2_5ae0_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l122_c2_5ae0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_pixel_counter <= REG_VAR_pixel_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     pixel_counter <= REG_COMB_pixel_counter;
 end if;
 end if;
end process;

end arch;
