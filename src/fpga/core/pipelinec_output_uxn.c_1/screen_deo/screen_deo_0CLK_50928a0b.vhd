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
entity screen_deo_0CLK_50928a0b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_50928a0b;
architecture arch of screen_deo_0CLK_50928a0b is
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
-- BIN_OP_EQ[uxn_device_h_l397_c6_61d3]
signal BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l397_c1_6a78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l399_c9_00da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l397_c2_446b]
signal result_MUX_uxn_device_h_l397_c2_446b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l397_c2_446b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l397_c2_446b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l397_c2_446b_return_output : device_out_result_t;

-- pixel_deo[uxn_device_h_l398_c12_fa12]
signal pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE : unsigned(0 downto 0);
signal pixel_deo_uxn_device_h_l398_c12_fa12_device_port : unsigned(3 downto 0);
signal pixel_deo_uxn_device_h_l398_c12_fa12_phase : unsigned(11 downto 0);
signal pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read : unsigned(7 downto 0);
signal pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read : unsigned(7 downto 0);
signal pixel_deo_uxn_device_h_l398_c12_fa12_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_device_h_l399_c13_5391]
signal BIN_OP_EQ_uxn_device_h_l399_c13_5391_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l399_c13_5391_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l399_c1_2982]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l399_c9_00da]
signal result_MUX_uxn_device_h_l399_c9_00da_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l399_c9_00da_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l399_c9_00da_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l399_c9_00da_return_output : device_out_result_t;

-- sprite_deo[uxn_device_h_l400_c12_7d59]
signal sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE : unsigned(0 downto 0);
signal sprite_deo_uxn_device_h_l400_c12_7d59_device_port : unsigned(3 downto 0);
signal sprite_deo_uxn_device_h_l400_c12_7d59_phase : unsigned(11 downto 0);
signal sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read : unsigned(7 downto 0);
signal sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read : unsigned(7 downto 0);
signal sprite_deo_uxn_device_h_l400_c12_7d59_return_output : device_out_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l397_c6_61d3
BIN_OP_EQ_uxn_device_h_l397_c6_61d3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left,
BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right,
BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output);

-- result_MUX_uxn_device_h_l397_c2_446b
result_MUX_uxn_device_h_l397_c2_446b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l397_c2_446b_cond,
result_MUX_uxn_device_h_l397_c2_446b_iftrue,
result_MUX_uxn_device_h_l397_c2_446b_iffalse,
result_MUX_uxn_device_h_l397_c2_446b_return_output);

-- pixel_deo_uxn_device_h_l398_c12_fa12
pixel_deo_uxn_device_h_l398_c12_fa12 : entity work.pixel_deo_0CLK_324ea393 port map (
clk,
pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE,
pixel_deo_uxn_device_h_l398_c12_fa12_device_port,
pixel_deo_uxn_device_h_l398_c12_fa12_phase,
pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read,
pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read,
pixel_deo_uxn_device_h_l398_c12_fa12_return_output);

-- BIN_OP_EQ_uxn_device_h_l399_c13_5391
BIN_OP_EQ_uxn_device_h_l399_c13_5391 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l399_c13_5391_left,
BIN_OP_EQ_uxn_device_h_l399_c13_5391_right,
BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output);

-- result_MUX_uxn_device_h_l399_c9_00da
result_MUX_uxn_device_h_l399_c9_00da : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l399_c9_00da_cond,
result_MUX_uxn_device_h_l399_c9_00da_iftrue,
result_MUX_uxn_device_h_l399_c9_00da_iffalse,
result_MUX_uxn_device_h_l399_c9_00da_return_output);

-- sprite_deo_uxn_device_h_l400_c12_7d59
sprite_deo_uxn_device_h_l400_c12_7d59 : entity work.sprite_deo_0CLK_4f1cf908 port map (
clk,
sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE,
sprite_deo_uxn_device_h_l400_c12_7d59_device_port,
sprite_deo_uxn_device_h_l400_c12_7d59_phase,
sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read,
sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read,
sprite_deo_uxn_device_h_l400_c12_7d59_return_output);



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
 BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output,
 result_MUX_uxn_device_h_l397_c2_446b_return_output,
 pixel_deo_uxn_device_h_l398_c12_fa12_return_output,
 BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output,
 result_MUX_uxn_device_h_l399_c9_00da_return_output,
 sprite_deo_uxn_device_h_l400_c12_7d59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l397_c2_446b_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l397_c2_446b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l399_c9_00da_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l397_c2_446b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l397_c2_446b_cond : unsigned(0 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_device_port : unsigned(3 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_phase : unsigned(11 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read : unsigned(7 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pixel_deo_uxn_device_h_l398_c12_fa12_return_output : device_out_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l399_c9_00da_iftrue : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l399_c9_00da_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l399_c9_00da_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l399_c9_00da_cond : unsigned(0 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_device_port : unsigned(3 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_phase : unsigned(11 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read : unsigned(7 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sprite_deo_uxn_device_h_l400_c12_7d59_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_left := VAR_device_port;
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_device_port := VAR_device_port;
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_device_port := VAR_device_port;
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_phase := VAR_phase;
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_phase := VAR_phase;
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read := VAR_previous_ram_read;
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read := VAR_previous_ram_read;
     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b[uxn_device_h_l399_c9_00da] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l399_c9_00da_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b31b(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1));

     -- BIN_OP_EQ[uxn_device_h_l397_c6_61d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left <= VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_left;
     BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right <= VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output := BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l399_c13_5391] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l399_c13_5391_left <= VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_left;
     BIN_OP_EQ_uxn_device_h_l399_c13_5391_right <= VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output := BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond := VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond := VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output;
     VAR_result_MUX_uxn_device_h_l397_c2_446b_cond := VAR_BIN_OP_EQ_uxn_device_h_l397_c6_61d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond := VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output;
     VAR_result_MUX_uxn_device_h_l399_c9_00da_cond := VAR_BIN_OP_EQ_uxn_device_h_l399_c13_5391_return_output;
     VAR_result_MUX_uxn_device_h_l399_c9_00da_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_b31b_uxn_device_h_l399_c9_00da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l399_c9_00da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l397_c1_6a78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c9_00da_return_output;
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l397_c1_6a78_return_output;
     -- pixel_deo[uxn_device_h_l398_c12_fa12] LATENCY=0
     -- Clock enable
     pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE <= VAR_pixel_deo_uxn_device_h_l398_c12_fa12_CLOCK_ENABLE;
     -- Inputs
     pixel_deo_uxn_device_h_l398_c12_fa12_device_port <= VAR_pixel_deo_uxn_device_h_l398_c12_fa12_device_port;
     pixel_deo_uxn_device_h_l398_c12_fa12_phase <= VAR_pixel_deo_uxn_device_h_l398_c12_fa12_phase;
     pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read <= VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_device_ram_read;
     pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read <= VAR_pixel_deo_uxn_device_h_l398_c12_fa12_previous_ram_read;
     -- Outputs
     VAR_pixel_deo_uxn_device_h_l398_c12_fa12_return_output := pixel_deo_uxn_device_h_l398_c12_fa12_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l399_c1_2982] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output;

     -- Submodule level 3
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l399_c1_2982_return_output;
     VAR_result_MUX_uxn_device_h_l397_c2_446b_iftrue := VAR_pixel_deo_uxn_device_h_l398_c12_fa12_return_output;
     -- sprite_deo[uxn_device_h_l400_c12_7d59] LATENCY=0
     -- Clock enable
     sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE <= VAR_sprite_deo_uxn_device_h_l400_c12_7d59_CLOCK_ENABLE;
     -- Inputs
     sprite_deo_uxn_device_h_l400_c12_7d59_device_port <= VAR_sprite_deo_uxn_device_h_l400_c12_7d59_device_port;
     sprite_deo_uxn_device_h_l400_c12_7d59_phase <= VAR_sprite_deo_uxn_device_h_l400_c12_7d59_phase;
     sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read <= VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_device_ram_read;
     sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read <= VAR_sprite_deo_uxn_device_h_l400_c12_7d59_previous_ram_read;
     -- Outputs
     VAR_sprite_deo_uxn_device_h_l400_c12_7d59_return_output := sprite_deo_uxn_device_h_l400_c12_7d59_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l399_c9_00da_iftrue := VAR_sprite_deo_uxn_device_h_l400_c12_7d59_return_output;
     -- result_MUX[uxn_device_h_l399_c9_00da] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l399_c9_00da_cond <= VAR_result_MUX_uxn_device_h_l399_c9_00da_cond;
     result_MUX_uxn_device_h_l399_c9_00da_iftrue <= VAR_result_MUX_uxn_device_h_l399_c9_00da_iftrue;
     result_MUX_uxn_device_h_l399_c9_00da_iffalse <= VAR_result_MUX_uxn_device_h_l399_c9_00da_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l399_c9_00da_return_output := result_MUX_uxn_device_h_l399_c9_00da_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l397_c2_446b_iffalse := VAR_result_MUX_uxn_device_h_l399_c9_00da_return_output;
     -- result_MUX[uxn_device_h_l397_c2_446b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l397_c2_446b_cond <= VAR_result_MUX_uxn_device_h_l397_c2_446b_cond;
     result_MUX_uxn_device_h_l397_c2_446b_iftrue <= VAR_result_MUX_uxn_device_h_l397_c2_446b_iftrue;
     result_MUX_uxn_device_h_l397_c2_446b_iffalse <= VAR_result_MUX_uxn_device_h_l397_c2_446b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l397_c2_446b_return_output := result_MUX_uxn_device_h_l397_c2_446b_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l397_c2_446b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l397_c2_446b_return_output;
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
