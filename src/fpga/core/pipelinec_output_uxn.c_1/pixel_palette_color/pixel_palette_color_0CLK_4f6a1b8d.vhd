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
-- Submodules: 13
entity pixel_palette_color_0CLK_4f6a1b8d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 pixel_index : in unsigned(16 downto 0);
 return_output : out unsigned(1 downto 0));
end pixel_palette_color_0CLK_4f6a1b8d;
architecture arch of pixel_palette_color_0CLK_4f6a1b8d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal adjusted_pixel_index : unsigned(15 downto 0) := to_unsigned(0, 16);
signal use_second_word : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer_bg : unsigned(1 downto 0) := to_unsigned(0, 2);
signal layer_fg : unsigned(1 downto 0) := to_unsigned(0, 2);
signal pixels : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_adjusted_pixel_index : unsigned(15 downto 0);
signal REG_COMB_use_second_word : unsigned(0 downto 0);
signal REG_COMB_layer_bg : unsigned(1 downto 0);
signal REG_COMB_layer_fg : unsigned(1 downto 0);
signal REG_COMB_pixels : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(1 downto 0);

-- Each function instance gets signals
-- CONST_SR_1[uxn_ram_screen_h_l62_c36_7272]
signal CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x : unsigned(16 downto 0);
signal CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_ram_screen_h_l63_c21_056e]
signal BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left : unsigned(16 downto 0);
signal BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output : unsigned(16 downto 0);

-- MUX[uxn_ram_screen_h_l63_c21_b306]
signal MUX_uxn_ram_screen_h_l63_c21_b306_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l63_c21_b306_iftrue : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l63_c21_b306_iffalse : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l63_c21_b306_return_output : unsigned(0 downto 0);

-- screen_ram_read[uxn_ram_screen_h_l64_c11_609f]
signal screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address : unsigned(15 downto 0);
signal screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output : unsigned(7 downto 0);

-- MUX[uxn_ram_screen_h_l65_c34_779b]
signal MUX_uxn_ram_screen_h_l65_c34_779b_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l65_c34_779b_iftrue : unsigned(2 downto 0);
signal MUX_uxn_ram_screen_h_l65_c34_779b_iffalse : unsigned(2 downto 0);
signal MUX_uxn_ram_screen_h_l65_c34_779b_return_output : unsigned(2 downto 0);

-- BIN_OP_SR[uxn_ram_screen_h_l65_c23_17d8]
signal BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right : unsigned(2 downto 0);
signal BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output : unsigned(7 downto 0);

-- MUX[uxn_ram_screen_h_l66_c34_9bb1]
signal MUX_uxn_ram_screen_h_l66_c34_9bb1_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue : unsigned(2 downto 0);
signal MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse : unsigned(2 downto 0);
signal MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output : unsigned(2 downto 0);

-- BIN_OP_SR[uxn_ram_screen_h_l66_c23_7dc2]
signal BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right : unsigned(2 downto 0);
signal BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_ram_screen_h_l67_c12_8fa6]
signal BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output : unsigned(0 downto 0);

-- MUX[uxn_ram_screen_h_l67_c12_6086]
signal MUX_uxn_ram_screen_h_l67_c12_6086_cond : unsigned(0 downto 0);
signal MUX_uxn_ram_screen_h_l67_c12_6086_iftrue : unsigned(1 downto 0);
signal MUX_uxn_ram_screen_h_l67_c12_6086_iffalse : unsigned(1 downto 0);
signal MUX_uxn_ram_screen_h_l67_c12_6086_return_output : unsigned(1 downto 0);

function CAST_TO_uint16_t_uint17_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(16 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_1_uxn_ram_screen_h_l62_c36_7272
CONST_SR_1_uxn_ram_screen_h_l62_c36_7272 : entity work.CONST_SR_1_uint17_t_0CLK_de264c78 port map (
CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x,
CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output);

-- BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e
BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e : entity work.BIN_OP_AND_uint17_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left,
BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right,
BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output);

-- MUX_uxn_ram_screen_h_l63_c21_b306
MUX_uxn_ram_screen_h_l63_c21_b306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_ram_screen_h_l63_c21_b306_cond,
MUX_uxn_ram_screen_h_l63_c21_b306_iftrue,
MUX_uxn_ram_screen_h_l63_c21_b306_iffalse,
MUX_uxn_ram_screen_h_l63_c21_b306_return_output);

-- screen_ram_read_uxn_ram_screen_h_l64_c11_609f
screen_ram_read_uxn_ram_screen_h_l64_c11_609f : entity work.screen_ram_read_0CLK_8ab28aec port map (
clk,
screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE,
screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address,
screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output);

-- MUX_uxn_ram_screen_h_l65_c34_779b
MUX_uxn_ram_screen_h_l65_c34_779b : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_ram_screen_h_l65_c34_779b_cond,
MUX_uxn_ram_screen_h_l65_c34_779b_iftrue,
MUX_uxn_ram_screen_h_l65_c34_779b_iffalse,
MUX_uxn_ram_screen_h_l65_c34_779b_return_output);

-- BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8
BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8 : entity work.BIN_OP_SR_uint8_t_uint3_t_0CLK_25f4cd11 port map (
BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left,
BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right,
BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output);

-- MUX_uxn_ram_screen_h_l66_c34_9bb1
MUX_uxn_ram_screen_h_l66_c34_9bb1 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
MUX_uxn_ram_screen_h_l66_c34_9bb1_cond,
MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue,
MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse,
MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output);

-- BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2
BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2 : entity work.BIN_OP_SR_uint8_t_uint3_t_0CLK_25f4cd11 port map (
BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left,
BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right,
BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output);

-- BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6
BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6 : entity work.BIN_OP_EQ_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left,
BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right,
BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output);

-- MUX_uxn_ram_screen_h_l67_c12_6086
MUX_uxn_ram_screen_h_l67_c12_6086 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
MUX_uxn_ram_screen_h_l67_c12_6086_cond,
MUX_uxn_ram_screen_h_l67_c12_6086_iftrue,
MUX_uxn_ram_screen_h_l67_c12_6086_iffalse,
MUX_uxn_ram_screen_h_l67_c12_6086_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 pixel_index,
 -- Registers
 adjusted_pixel_index,
 use_second_word,
 layer_bg,
 layer_fg,
 pixels,
 result,
 -- All submodule outputs
 CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output,
 BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output,
 MUX_uxn_ram_screen_h_l63_c21_b306_return_output,
 screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output,
 MUX_uxn_ram_screen_h_l65_c34_779b_return_output,
 BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output,
 MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output,
 BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output,
 BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output,
 MUX_uxn_ram_screen_h_l67_c12_6086_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_pixel_index : unsigned(16 downto 0);
 variable VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_screen_h_l62_c25_e2e0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l63_c21_b306_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l63_c21_b306_return_output : unsigned(0 downto 0);
 variable VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address : unsigned(15 downto 0);
 variable VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l65_c34_779b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l65_c34_779b_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l65_c13_47c1_return_output : unsigned(1 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue : unsigned(2 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse : unsigned(2 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l66_c13_17c5_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l67_c12_6086_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iftrue : unsigned(1 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iffalse : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_ram_screen_h_l67_c12_6086_return_output : unsigned(1 downto 0);
 -- State registers comb logic variables
variable REG_VAR_adjusted_pixel_index : unsigned(15 downto 0);
variable REG_VAR_use_second_word : unsigned(0 downto 0);
variable REG_VAR_layer_bg : unsigned(1 downto 0);
variable REG_VAR_layer_fg : unsigned(1 downto 0);
variable REG_VAR_pixels : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_adjusted_pixel_index := adjusted_pixel_index;
  REG_VAR_use_second_word := use_second_word;
  REG_VAR_layer_bg := layer_bg;
  REG_VAR_layer_fg := layer_fg;
  REG_VAR_pixels := pixels;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iffalse := resize(to_unsigned(2, 2), 3);
     VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse := resize(to_unsigned(2, 2), 3);
     VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iftrue := to_unsigned(6, 3);
     VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue := to_unsigned(6, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_pixel_index := pixel_index;

     -- Submodule level 0
     VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left := VAR_pixel_index;
     VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x := VAR_pixel_index;
     -- CONST_SR_1[uxn_ram_screen_h_l62_c36_7272] LATENCY=0
     -- Inputs
     CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x <= VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_x;
     -- Outputs
     VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output := CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output;

     -- BIN_OP_AND[uxn_ram_screen_h_l63_c21_056e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left <= VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_left;
     BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right <= VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output := BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_ram_screen_h_l63_c21_b306_cond := resize(VAR_BIN_OP_AND_uxn_ram_screen_h_l63_c21_056e_return_output, 1);
     -- CAST_TO_uint16_t[uxn_ram_screen_h_l62_c25_e2e0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_screen_h_l62_c25_e2e0_return_output := CAST_TO_uint16_t_uint17_t(
     VAR_CONST_SR_1_uxn_ram_screen_h_l62_c36_7272_return_output);

     -- MUX[uxn_ram_screen_h_l63_c21_b306] LATENCY=0
     -- Inputs
     MUX_uxn_ram_screen_h_l63_c21_b306_cond <= VAR_MUX_uxn_ram_screen_h_l63_c21_b306_cond;
     MUX_uxn_ram_screen_h_l63_c21_b306_iftrue <= VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iftrue;
     MUX_uxn_ram_screen_h_l63_c21_b306_iffalse <= VAR_MUX_uxn_ram_screen_h_l63_c21_b306_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_screen_h_l63_c21_b306_return_output := MUX_uxn_ram_screen_h_l63_c21_b306_return_output;

     -- Submodule level 2
     REG_VAR_adjusted_pixel_index := VAR_CAST_TO_uint16_t_uxn_ram_screen_h_l62_c25_e2e0_return_output;
     VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address := VAR_CAST_TO_uint16_t_uxn_ram_screen_h_l62_c25_e2e0_return_output;
     VAR_MUX_uxn_ram_screen_h_l65_c34_779b_cond := VAR_MUX_uxn_ram_screen_h_l63_c21_b306_return_output;
     VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_cond := VAR_MUX_uxn_ram_screen_h_l63_c21_b306_return_output;
     REG_VAR_use_second_word := VAR_MUX_uxn_ram_screen_h_l63_c21_b306_return_output;
     -- MUX[uxn_ram_screen_h_l66_c34_9bb1] LATENCY=0
     -- Inputs
     MUX_uxn_ram_screen_h_l66_c34_9bb1_cond <= VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_cond;
     MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue <= VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iftrue;
     MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse <= VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output := MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output;

     -- screen_ram_read[uxn_ram_screen_h_l64_c11_609f] LATENCY=0
     -- Clock enable
     screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE <= VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_CLOCK_ENABLE;
     -- Inputs
     screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address <= VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_address;
     -- Outputs
     VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output := screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output;

     -- MUX[uxn_ram_screen_h_l65_c34_779b] LATENCY=0
     -- Inputs
     MUX_uxn_ram_screen_h_l65_c34_779b_cond <= VAR_MUX_uxn_ram_screen_h_l65_c34_779b_cond;
     MUX_uxn_ram_screen_h_l65_c34_779b_iftrue <= VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iftrue;
     MUX_uxn_ram_screen_h_l65_c34_779b_iffalse <= VAR_MUX_uxn_ram_screen_h_l65_c34_779b_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_screen_h_l65_c34_779b_return_output := MUX_uxn_ram_screen_h_l65_c34_779b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right := VAR_MUX_uxn_ram_screen_h_l65_c34_779b_return_output;
     VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right := VAR_MUX_uxn_ram_screen_h_l66_c34_9bb1_return_output;
     VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left := VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output;
     VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left := VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output;
     REG_VAR_pixels := VAR_screen_ram_read_uxn_ram_screen_h_l64_c11_609f_return_output;
     -- BIN_OP_SR[uxn_ram_screen_h_l65_c23_17d8] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left <= VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_left;
     BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right <= VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output := BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output;

     -- BIN_OP_SR[uxn_ram_screen_h_l66_c23_7dc2] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left <= VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_left;
     BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right <= VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output := BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output;

     -- Submodule level 4
     -- CAST_TO_uint2_t[uxn_ram_screen_h_l65_c13_47c1] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l65_c13_47c1_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_BIN_OP_SR_uxn_ram_screen_h_l65_c23_17d8_return_output);

     -- CAST_TO_uint2_t[uxn_ram_screen_h_l66_c13_17c5] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l66_c13_17c5_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_BIN_OP_SR_uxn_ram_screen_h_l66_c23_7dc2_return_output);

     -- Submodule level 5
     VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iftrue := VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l65_c13_47c1_return_output;
     REG_VAR_layer_bg := VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l65_c13_47c1_return_output;
     VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left := VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l66_c13_17c5_return_output;
     VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iffalse := VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l66_c13_17c5_return_output;
     REG_VAR_layer_fg := VAR_CAST_TO_uint2_t_uxn_ram_screen_h_l66_c13_17c5_return_output;
     -- BIN_OP_EQ[uxn_ram_screen_h_l67_c12_8fa6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left <= VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_left;
     BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right <= VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output := BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_ram_screen_h_l67_c12_6086_cond := VAR_BIN_OP_EQ_uxn_ram_screen_h_l67_c12_8fa6_return_output;
     -- MUX[uxn_ram_screen_h_l67_c12_6086] LATENCY=0
     -- Inputs
     MUX_uxn_ram_screen_h_l67_c12_6086_cond <= VAR_MUX_uxn_ram_screen_h_l67_c12_6086_cond;
     MUX_uxn_ram_screen_h_l67_c12_6086_iftrue <= VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iftrue;
     MUX_uxn_ram_screen_h_l67_c12_6086_iffalse <= VAR_MUX_uxn_ram_screen_h_l67_c12_6086_iffalse;
     -- Outputs
     VAR_MUX_uxn_ram_screen_h_l67_c12_6086_return_output := MUX_uxn_ram_screen_h_l67_c12_6086_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_MUX_uxn_ram_screen_h_l67_c12_6086_return_output;
     VAR_return_output := VAR_MUX_uxn_ram_screen_h_l67_c12_6086_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_adjusted_pixel_index <= REG_VAR_adjusted_pixel_index;
REG_COMB_use_second_word <= REG_VAR_use_second_word;
REG_COMB_layer_bg <= REG_VAR_layer_bg;
REG_COMB_layer_fg <= REG_VAR_layer_fg;
REG_COMB_pixels <= REG_VAR_pixels;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     adjusted_pixel_index <= REG_COMB_adjusted_pixel_index;
     use_second_word <= REG_COMB_use_second_word;
     layer_bg <= REG_COMB_layer_bg;
     layer_fg <= REG_COMB_layer_fg;
     pixels <= REG_COMB_pixels;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
