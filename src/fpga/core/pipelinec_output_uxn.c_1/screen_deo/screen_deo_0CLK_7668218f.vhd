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
-- Submodules: 10
entity screen_deo_0CLK_7668218f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_7668218f;
architecture arch of screen_deo_0CLK_7668218f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l400_c6_f54c]
signal BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l400_c1_d277]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l402_c9_658a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l400_c2_9daf]
signal result_MUX_uxn_device_h_l400_c2_9daf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l400_c2_9daf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l400_c2_9daf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l400_c2_9daf_return_output : device_out_result_t;

-- pixel_deo[uxn_device_h_l401_c12_6340]
signal pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE : unsigned(0 downto 0);
signal pixel_deo_uxn_device_h_l401_c12_6340_device_port : unsigned(3 downto 0);
signal pixel_deo_uxn_device_h_l401_c12_6340_phase : unsigned(11 downto 0);
signal pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read : unsigned(7 downto 0);
signal pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read : unsigned(7 downto 0);
signal pixel_deo_uxn_device_h_l401_c12_6340_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l402_c13_dc5e]
signal BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l402_c1_957a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l402_c9_658a]
signal result_MUX_uxn_device_h_l402_c9_658a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l402_c9_658a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l402_c9_658a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l402_c9_658a_return_output : device_out_result_t;

-- sprite_deo[uxn_device_h_l403_c12_8b3e]
signal sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sprite_deo_uxn_device_h_l403_c12_8b3e_device_port : unsigned(3 downto 0);
signal sprite_deo_uxn_device_h_l403_c12_8b3e_phase : unsigned(11 downto 0);
signal sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read : unsigned(7 downto 0);
signal sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read : unsigned(7 downto 0);
signal sprite_deo_uxn_device_h_l403_c12_8b3e_return_output : device_out_result_t;

function CONST_REF_RD_device_out_result_t_device_out_result_t_b31b( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l400_c6_f54c
BIN_OP_EQ_uxn_device_h_l400_c6_f54c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left,
BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right,
BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output);

-- result_MUX_uxn_device_h_l400_c2_9daf
result_MUX_uxn_device_h_l400_c2_9daf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l400_c2_9daf_cond,
result_MUX_uxn_device_h_l400_c2_9daf_iftrue,
result_MUX_uxn_device_h_l400_c2_9daf_iffalse,
result_MUX_uxn_device_h_l400_c2_9daf_return_output);

-- pixel_deo_uxn_device_h_l401_c12_6340
pixel_deo_uxn_device_h_l401_c12_6340 : entity work.pixel_deo_0CLK_1bcb4129 port map (
clk,
pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE,
pixel_deo_uxn_device_h_l401_c12_6340_device_port,
pixel_deo_uxn_device_h_l401_c12_6340_phase,
pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read,
pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read,
pixel_deo_uxn_device_h_l401_c12_6340_return_output);

-- BIN_OP_EQ_uxn_device_h_l402_c13_dc5e
BIN_OP_EQ_uxn_device_h_l402_c13_dc5e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left,
BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right,
BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output);

-- result_MUX_uxn_device_h_l402_c9_658a
result_MUX_uxn_device_h_l402_c9_658a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l402_c9_658a_cond,
result_MUX_uxn_device_h_l402_c9_658a_iftrue,
result_MUX_uxn_device_h_l402_c9_658a_iffalse,
result_MUX_uxn_device_h_l402_c9_658a_return_output);

-- sprite_deo_uxn_device_h_l403_c12_8b3e
sprite_deo_uxn_device_h_l403_c12_8b3e : entity work.sprite_deo_0CLK_3b277fcb port map (
clk,
sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE,
sprite_deo_uxn_device_h_l403_c12_8b3e_device_port,
sprite_deo_uxn_device_h_l403_c12_8b3e_phase,
sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read,
sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read,
sprite_deo_uxn_device_h_l403_c12_8b3e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output,
 result_MUX_uxn_device_h_l400_c2_9daf_return_output,
 pixel_deo_uxn_device_h_l401_c12_6340_return_output,
 BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output,
 result_MUX_uxn_device_h_l402_c9_658a_return_output,
 sprite_deo_uxn_device_h_l403_c12_8b3e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l400_c2_9daf_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l400_c2_9daf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l402_c9_658a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l400_c2_9daf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l400_c2_9daf_cond : unsigned(0 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_device_port : unsigned(3 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_phase : unsigned(11 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l401_c12_6340_return_output : device_out_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l402_c9_658a_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l402_c9_658a_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l402_c9_658a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l402_c9_658a_cond : unsigned(0 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_device_port : unsigned(3 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_phase : unsigned(11 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right := to_unsigned(14, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_port := device_port;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left := VAR_device_port;
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_device_port := VAR_device_port;
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_device_port := VAR_device_port;
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_phase := VAR_phase;
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_phase := VAR_phase;
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read := VAR_previous_ram_read;
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read := VAR_previous_ram_read;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b[uxn_device_h_l402_c9_658a] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l402_c9_658a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b31b(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_device_h_l402_c13_dc5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left <= VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_left;
     BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right <= VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output := BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l400_c6_f54c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left <= VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_left;
     BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right <= VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output := BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond := VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond := VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output;
     VAR_result_MUX_uxn_device_h_l400_c2_9daf_cond := VAR_BIN_OP_EQ_uxn_device_h_l400_c6_f54c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond := VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output;
     VAR_result_MUX_uxn_device_h_l402_c9_658a_cond := VAR_BIN_OP_EQ_uxn_device_h_l402_c13_dc5e_return_output;
     VAR_result_MUX_uxn_device_h_l402_c9_658a_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l402_c9_658a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l400_c1_d277] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l402_c9_658a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c9_658a_return_output;
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l400_c1_d277_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l402_c1_957a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output;

     -- pixel_deo[uxn_device_h_l401_c12_6340] LATENCY=0
     -- Clock enable
     pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE <= VAR_pixel_deo_uxn_device_h_l401_c12_6340_CLOCK_ENABLE;
     -- Inputs
     pixel_deo_uxn_device_h_l401_c12_6340_device_port <= VAR_pixel_deo_uxn_device_h_l401_c12_6340_device_port;
     pixel_deo_uxn_device_h_l401_c12_6340_phase <= VAR_pixel_deo_uxn_device_h_l401_c12_6340_phase;
     pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read <= VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_device_ram_read;
     pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read <= VAR_pixel_deo_uxn_device_h_l401_c12_6340_previous_ram_read;
     -- Outputs
     VAR_pixel_deo_uxn_device_h_l401_c12_6340_return_output := pixel_deo_uxn_device_h_l401_c12_6340_return_output;

     -- Submodule level 3
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l402_c1_957a_return_output;
     VAR_result_MUX_uxn_device_h_l400_c2_9daf_iftrue := VAR_pixel_deo_uxn_device_h_l401_c12_6340_return_output;
     -- sprite_deo[uxn_device_h_l403_c12_8b3e] LATENCY=0
     -- Clock enable
     sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE <= VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_CLOCK_ENABLE;
     -- Inputs
     sprite_deo_uxn_device_h_l403_c12_8b3e_device_port <= VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_device_port;
     sprite_deo_uxn_device_h_l403_c12_8b3e_phase <= VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_phase;
     sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read <= VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_device_ram_read;
     sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read <= VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_previous_ram_read;
     -- Outputs
     VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_return_output := sprite_deo_uxn_device_h_l403_c12_8b3e_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l402_c9_658a_iftrue := VAR_sprite_deo_uxn_device_h_l403_c12_8b3e_return_output;
     -- result_MUX[uxn_device_h_l402_c9_658a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l402_c9_658a_cond <= VAR_result_MUX_uxn_device_h_l402_c9_658a_cond;
     result_MUX_uxn_device_h_l402_c9_658a_iftrue <= VAR_result_MUX_uxn_device_h_l402_c9_658a_iftrue;
     result_MUX_uxn_device_h_l402_c9_658a_iffalse <= VAR_result_MUX_uxn_device_h_l402_c9_658a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l402_c9_658a_return_output := result_MUX_uxn_device_h_l402_c9_658a_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l400_c2_9daf_iffalse := VAR_result_MUX_uxn_device_h_l402_c9_658a_return_output;
     -- result_MUX[uxn_device_h_l400_c2_9daf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l400_c2_9daf_cond <= VAR_result_MUX_uxn_device_h_l400_c2_9daf_cond;
     result_MUX_uxn_device_h_l400_c2_9daf_iftrue <= VAR_result_MUX_uxn_device_h_l400_c2_9daf_iftrue;
     result_MUX_uxn_device_h_l400_c2_9daf_iffalse <= VAR_result_MUX_uxn_device_h_l400_c2_9daf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l400_c2_9daf_return_output := result_MUX_uxn_device_h_l400_c2_9daf_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l400_c2_9daf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l400_c2_9daf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
