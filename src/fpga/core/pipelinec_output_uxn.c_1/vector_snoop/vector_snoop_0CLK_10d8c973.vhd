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
entity vector_snoop_0CLK_10d8c973 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end vector_snoop_0CLK_10d8c973;
architecture arch of vector_snoop_0CLK_10d8c973 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_screen_vector : unsigned(15 downto 0);

-- Each function instance gets signals
-- screen_vector_MUX[uxn_c_l194_c2_c1a5]
signal screen_vector_MUX_uxn_c_l194_c2_c1a5_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l195_c7_8b92]
signal BIN_OP_EQ_uxn_c_l195_c7_8b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l195_c7_8b92_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l195_c3_bc73]
signal screen_vector_MUX_uxn_c_l195_c3_bc73_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c3_bc73_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l196_c4_4351]
signal BIN_OP_AND_uxn_c_l196_c4_4351_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l196_c4_4351_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l196_c4_4351_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l197_c22_8cb1]
signal CONST_SL_8_uxn_c_l197_c22_8cb1_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l197_c22_8cb1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l197_c4_8a72]
signal BIN_OP_OR_uxn_c_l197_c4_8a72_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l197_c4_8a72_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l197_c4_8a72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l199_c12_e427]
signal BIN_OP_EQ_uxn_c_l199_c12_e427_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c12_e427_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l199_c12_e427_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l199_c8_ec00]
signal screen_vector_MUX_uxn_c_l199_c8_ec00_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l199_c8_ec00_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l200_c4_838f]
signal BIN_OP_AND_uxn_c_l200_c4_838f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l200_c4_838f_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l200_c4_838f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l201_c4_fb52]
signal BIN_OP_OR_uxn_c_l201_c4_fb52_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l201_c4_fb52_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l201_c4_fb52_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l194_c2_c1a5
screen_vector_MUX_uxn_c_l194_c2_c1a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l194_c2_c1a5_cond,
screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue,
screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse,
screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output);

-- BIN_OP_EQ_uxn_c_l195_c7_8b92
BIN_OP_EQ_uxn_c_l195_c7_8b92 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l195_c7_8b92_left,
BIN_OP_EQ_uxn_c_l195_c7_8b92_right,
BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output);

-- screen_vector_MUX_uxn_c_l195_c3_bc73
screen_vector_MUX_uxn_c_l195_c3_bc73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l195_c3_bc73_cond,
screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue,
screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse,
screen_vector_MUX_uxn_c_l195_c3_bc73_return_output);

-- BIN_OP_AND_uxn_c_l196_c4_4351
BIN_OP_AND_uxn_c_l196_c4_4351 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l196_c4_4351_left,
BIN_OP_AND_uxn_c_l196_c4_4351_right,
BIN_OP_AND_uxn_c_l196_c4_4351_return_output);

-- CONST_SL_8_uxn_c_l197_c22_8cb1
CONST_SL_8_uxn_c_l197_c22_8cb1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l197_c22_8cb1_x,
CONST_SL_8_uxn_c_l197_c22_8cb1_return_output);

-- BIN_OP_OR_uxn_c_l197_c4_8a72
BIN_OP_OR_uxn_c_l197_c4_8a72 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l197_c4_8a72_left,
BIN_OP_OR_uxn_c_l197_c4_8a72_right,
BIN_OP_OR_uxn_c_l197_c4_8a72_return_output);

-- BIN_OP_EQ_uxn_c_l199_c12_e427
BIN_OP_EQ_uxn_c_l199_c12_e427 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l199_c12_e427_left,
BIN_OP_EQ_uxn_c_l199_c12_e427_right,
BIN_OP_EQ_uxn_c_l199_c12_e427_return_output);

-- screen_vector_MUX_uxn_c_l199_c8_ec00
screen_vector_MUX_uxn_c_l199_c8_ec00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l199_c8_ec00_cond,
screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue,
screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse,
screen_vector_MUX_uxn_c_l199_c8_ec00_return_output);

-- BIN_OP_AND_uxn_c_l200_c4_838f
BIN_OP_AND_uxn_c_l200_c4_838f : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l200_c4_838f_left,
BIN_OP_AND_uxn_c_l200_c4_838f_right,
BIN_OP_AND_uxn_c_l200_c4_838f_return_output);

-- BIN_OP_OR_uxn_c_l201_c4_fb52
BIN_OP_OR_uxn_c_l201_c4_fb52 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l201_c4_fb52_left,
BIN_OP_OR_uxn_c_l201_c4_fb52_right,
BIN_OP_OR_uxn_c_l201_c4_fb52_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 -- Registers
 screen_vector,
 -- All submodule outputs
 screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output,
 BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output,
 screen_vector_MUX_uxn_c_l195_c3_bc73_return_output,
 BIN_OP_AND_uxn_c_l196_c4_4351_return_output,
 CONST_SL_8_uxn_c_l197_c22_8cb1_return_output,
 BIN_OP_OR_uxn_c_l197_c4_8a72_return_output,
 BIN_OP_EQ_uxn_c_l199_c12_e427_return_output,
 screen_vector_MUX_uxn_c_l199_c8_ec00_return_output,
 BIN_OP_AND_uxn_c_l200_c4_838f_return_output,
 BIN_OP_OR_uxn_c_l201_c4_fb52_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_4351_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_4351_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l196_c4_4351_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c4_838f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c4_838f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l200_c4_838f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l197_l201_DUPLICATE_a95f_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l200_c4_838f_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l196_c4_4351_right := to_unsigned(255, 16);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;

     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l196_c4_4351_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l200_c4_838f_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l196_c4_4351] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l196_c4_4351_left <= VAR_BIN_OP_AND_uxn_c_l196_c4_4351_left;
     BIN_OP_AND_uxn_c_l196_c4_4351_right <= VAR_BIN_OP_AND_uxn_c_l196_c4_4351_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l196_c4_4351_return_output := BIN_OP_AND_uxn_c_l196_c4_4351_return_output;

     -- BIN_OP_EQ[uxn_c_l195_c7_8b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l195_c7_8b92_left <= VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_left;
     BIN_OP_EQ_uxn_c_l195_c7_8b92_right <= VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output := BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l197_l201_DUPLICATE_a95f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l197_l201_DUPLICATE_a95f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l199_c12_e427] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l199_c12_e427_left <= VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_left;
     BIN_OP_EQ_uxn_c_l199_c12_e427_right <= VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_return_output := BIN_OP_EQ_uxn_c_l199_c12_e427_return_output;

     -- BIN_OP_AND[uxn_c_l200_c4_838f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l200_c4_838f_left <= VAR_BIN_OP_AND_uxn_c_l200_c4_838f_left;
     BIN_OP_AND_uxn_c_l200_c4_838f_right <= VAR_BIN_OP_AND_uxn_c_l200_c4_838f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l200_c4_838f_return_output := BIN_OP_AND_uxn_c_l200_c4_838f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_left := VAR_BIN_OP_AND_uxn_c_l196_c4_4351_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_left := VAR_BIN_OP_AND_uxn_c_l200_c4_838f_return_output;
     VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_cond := VAR_BIN_OP_EQ_uxn_c_l195_c7_8b92_return_output;
     VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_cond := VAR_BIN_OP_EQ_uxn_c_l199_c12_e427_return_output;
     VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l197_l201_DUPLICATE_a95f_return_output;
     VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l197_l201_DUPLICATE_a95f_return_output;
     -- CONST_SL_8[uxn_c_l197_c22_8cb1] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l197_c22_8cb1_x <= VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_return_output := CONST_SL_8_uxn_c_l197_c22_8cb1_return_output;

     -- BIN_OP_OR[uxn_c_l201_c4_fb52] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l201_c4_fb52_left <= VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_left;
     BIN_OP_OR_uxn_c_l201_c4_fb52_right <= VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_return_output := BIN_OP_OR_uxn_c_l201_c4_fb52_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue := VAR_BIN_OP_OR_uxn_c_l201_c4_fb52_return_output;
     VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_right := VAR_CONST_SL_8_uxn_c_l197_c22_8cb1_return_output;
     -- BIN_OP_OR[uxn_c_l197_c4_8a72] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l197_c4_8a72_left <= VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_left;
     BIN_OP_OR_uxn_c_l197_c4_8a72_right <= VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_return_output := BIN_OP_OR_uxn_c_l197_c4_8a72_return_output;

     -- screen_vector_MUX[uxn_c_l199_c8_ec00] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l199_c8_ec00_cond <= VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_cond;
     screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue <= VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iftrue;
     screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse <= VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_return_output := screen_vector_MUX_uxn_c_l199_c8_ec00_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue := VAR_BIN_OP_OR_uxn_c_l197_c4_8a72_return_output;
     VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse := VAR_screen_vector_MUX_uxn_c_l199_c8_ec00_return_output;
     -- screen_vector_MUX[uxn_c_l195_c3_bc73] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l195_c3_bc73_cond <= VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_cond;
     screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue <= VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iftrue;
     screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse <= VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_return_output := screen_vector_MUX_uxn_c_l195_c3_bc73_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue := VAR_screen_vector_MUX_uxn_c_l195_c3_bc73_return_output;
     -- screen_vector_MUX[uxn_c_l194_c2_c1a5] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l194_c2_c1a5_cond <= VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_cond;
     screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue <= VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iftrue;
     screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse <= VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output := screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l194_c2_c1a5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_screen_vector <= REG_VAR_screen_vector;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     screen_vector <= REG_COMB_screen_vector;
 end if;
 end if;
end process;

end arch;
