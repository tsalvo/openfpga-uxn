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
-- screen_vector_MUX[uxn_c_l186_c2_6789]
signal screen_vector_MUX_uxn_c_l186_c2_6789_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_6789_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_6789_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_6789_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l187_c7_6dda]
signal BIN_OP_EQ_uxn_c_l187_c7_6dda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_6dda_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l187_c3_69fe]
signal screen_vector_MUX_uxn_c_l187_c3_69fe_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_69fe_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l188_c4_4899]
signal BIN_OP_AND_uxn_c_l188_c4_4899_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_4899_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_4899_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l189_c22_71c3]
signal CONST_SL_8_uxn_c_l189_c22_71c3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l189_c22_71c3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l189_c4_bfa1]
signal BIN_OP_OR_uxn_c_l189_c4_bfa1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_bfa1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l191_c12_ba8e]
signal BIN_OP_EQ_uxn_c_l191_c12_ba8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c12_ba8e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l191_c8_0b77]
signal screen_vector_MUX_uxn_c_l191_c8_0b77_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_0b77_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l192_c4_1dcb]
signal BIN_OP_AND_uxn_c_l192_c4_1dcb_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l192_c4_1dcb_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l193_c4_a068]
signal BIN_OP_OR_uxn_c_l193_c4_a068_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l193_c4_a068_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l193_c4_a068_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l186_c2_6789
screen_vector_MUX_uxn_c_l186_c2_6789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c2_6789_cond,
screen_vector_MUX_uxn_c_l186_c2_6789_iftrue,
screen_vector_MUX_uxn_c_l186_c2_6789_iffalse,
screen_vector_MUX_uxn_c_l186_c2_6789_return_output);

-- BIN_OP_EQ_uxn_c_l187_c7_6dda
BIN_OP_EQ_uxn_c_l187_c7_6dda : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l187_c7_6dda_left,
BIN_OP_EQ_uxn_c_l187_c7_6dda_right,
BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output);

-- screen_vector_MUX_uxn_c_l187_c3_69fe
screen_vector_MUX_uxn_c_l187_c3_69fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l187_c3_69fe_cond,
screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue,
screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse,
screen_vector_MUX_uxn_c_l187_c3_69fe_return_output);

-- BIN_OP_AND_uxn_c_l188_c4_4899
BIN_OP_AND_uxn_c_l188_c4_4899 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c4_4899_left,
BIN_OP_AND_uxn_c_l188_c4_4899_right,
BIN_OP_AND_uxn_c_l188_c4_4899_return_output);

-- CONST_SL_8_uxn_c_l189_c22_71c3
CONST_SL_8_uxn_c_l189_c22_71c3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l189_c22_71c3_x,
CONST_SL_8_uxn_c_l189_c22_71c3_return_output);

-- BIN_OP_OR_uxn_c_l189_c4_bfa1
BIN_OP_OR_uxn_c_l189_c4_bfa1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l189_c4_bfa1_left,
BIN_OP_OR_uxn_c_l189_c4_bfa1_right,
BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output);

-- BIN_OP_EQ_uxn_c_l191_c12_ba8e
BIN_OP_EQ_uxn_c_l191_c12_ba8e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l191_c12_ba8e_left,
BIN_OP_EQ_uxn_c_l191_c12_ba8e_right,
BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output);

-- screen_vector_MUX_uxn_c_l191_c8_0b77
screen_vector_MUX_uxn_c_l191_c8_0b77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l191_c8_0b77_cond,
screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue,
screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse,
screen_vector_MUX_uxn_c_l191_c8_0b77_return_output);

-- BIN_OP_AND_uxn_c_l192_c4_1dcb
BIN_OP_AND_uxn_c_l192_c4_1dcb : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l192_c4_1dcb_left,
BIN_OP_AND_uxn_c_l192_c4_1dcb_right,
BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output);

-- BIN_OP_OR_uxn_c_l193_c4_a068
BIN_OP_OR_uxn_c_l193_c4_a068 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l193_c4_a068_left,
BIN_OP_OR_uxn_c_l193_c4_a068_right,
BIN_OP_OR_uxn_c_l193_c4_a068_return_output);



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
 screen_vector_MUX_uxn_c_l186_c2_6789_return_output,
 BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output,
 screen_vector_MUX_uxn_c_l187_c3_69fe_return_output,
 BIN_OP_AND_uxn_c_l188_c4_4899_return_output,
 CONST_SL_8_uxn_c_l189_c22_71c3_return_output,
 BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output,
 BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output,
 screen_vector_MUX_uxn_c_l191_c8_0b77_return_output,
 BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output,
 BIN_OP_OR_uxn_c_l193_c4_a068_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_6789_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_6789_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_4899_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_4899_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_4899_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_71c3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_71c3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_a068_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_a068_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_a068_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l193_l189_DUPLICATE_fe4c_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l188_c4_4899_right := to_unsigned(255, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l186_c2_6789_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l188_c4_4899_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse := screen_vector;
     -- BIN_OP_EQ[uxn_c_l191_c12_ba8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l191_c12_ba8e_left <= VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_left;
     BIN_OP_EQ_uxn_c_l191_c12_ba8e_right <= VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output := BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l193_l189_DUPLICATE_fe4c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l193_l189_DUPLICATE_fe4c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l192_c4_1dcb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l192_c4_1dcb_left <= VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_left;
     BIN_OP_AND_uxn_c_l192_c4_1dcb_right <= VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output := BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output;

     -- BIN_OP_EQ[uxn_c_l187_c7_6dda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l187_c7_6dda_left <= VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_left;
     BIN_OP_EQ_uxn_c_l187_c7_6dda_right <= VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output := BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output;

     -- BIN_OP_AND[uxn_c_l188_c4_4899] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c4_4899_left <= VAR_BIN_OP_AND_uxn_c_l188_c4_4899_left;
     BIN_OP_AND_uxn_c_l188_c4_4899_right <= VAR_BIN_OP_AND_uxn_c_l188_c4_4899_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c4_4899_return_output := BIN_OP_AND_uxn_c_l188_c4_4899_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_left := VAR_BIN_OP_AND_uxn_c_l188_c4_4899_return_output;
     VAR_BIN_OP_OR_uxn_c_l193_c4_a068_left := VAR_BIN_OP_AND_uxn_c_l192_c4_1dcb_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_6dda_return_output;
     VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_cond := VAR_BIN_OP_EQ_uxn_c_l191_c12_ba8e_return_output;
     VAR_BIN_OP_OR_uxn_c_l193_c4_a068_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l193_l189_DUPLICATE_fe4c_return_output;
     VAR_CONST_SL_8_uxn_c_l189_c22_71c3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l193_l189_DUPLICATE_fe4c_return_output;
     -- CONST_SL_8[uxn_c_l189_c22_71c3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l189_c22_71c3_x <= VAR_CONST_SL_8_uxn_c_l189_c22_71c3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l189_c22_71c3_return_output := CONST_SL_8_uxn_c_l189_c22_71c3_return_output;

     -- BIN_OP_OR[uxn_c_l193_c4_a068] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l193_c4_a068_left <= VAR_BIN_OP_OR_uxn_c_l193_c4_a068_left;
     BIN_OP_OR_uxn_c_l193_c4_a068_right <= VAR_BIN_OP_OR_uxn_c_l193_c4_a068_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l193_c4_a068_return_output := BIN_OP_OR_uxn_c_l193_c4_a068_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue := VAR_BIN_OP_OR_uxn_c_l193_c4_a068_return_output;
     VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_right := VAR_CONST_SL_8_uxn_c_l189_c22_71c3_return_output;
     -- screen_vector_MUX[uxn_c_l191_c8_0b77] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l191_c8_0b77_cond <= VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_cond;
     screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue <= VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iftrue;
     screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse <= VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_return_output := screen_vector_MUX_uxn_c_l191_c8_0b77_return_output;

     -- BIN_OP_OR[uxn_c_l189_c4_bfa1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l189_c4_bfa1_left <= VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_left;
     BIN_OP_OR_uxn_c_l189_c4_bfa1_right <= VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output := BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue := VAR_BIN_OP_OR_uxn_c_l189_c4_bfa1_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse := VAR_screen_vector_MUX_uxn_c_l191_c8_0b77_return_output;
     -- screen_vector_MUX[uxn_c_l187_c3_69fe] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l187_c3_69fe_cond <= VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_cond;
     screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue <= VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iftrue;
     screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse <= VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_return_output := screen_vector_MUX_uxn_c_l187_c3_69fe_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iftrue := VAR_screen_vector_MUX_uxn_c_l187_c3_69fe_return_output;
     -- screen_vector_MUX[uxn_c_l186_c2_6789] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c2_6789_cond <= VAR_screen_vector_MUX_uxn_c_l186_c2_6789_cond;
     screen_vector_MUX_uxn_c_l186_c2_6789_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iftrue;
     screen_vector_MUX_uxn_c_l186_c2_6789_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c2_6789_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c2_6789_return_output := screen_vector_MUX_uxn_c_l186_c2_6789_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l186_c2_6789_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l186_c2_6789_return_output;
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
