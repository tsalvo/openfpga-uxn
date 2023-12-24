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
-- screen_vector_MUX[uxn_c_l185_c2_dd5a]
signal screen_vector_MUX_uxn_c_l185_c2_dd5a_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l186_c7_e6f6]
signal BIN_OP_EQ_uxn_c_l186_c7_e6f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l186_c7_e6f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l186_c3_d9c8]
signal screen_vector_MUX_uxn_c_l186_c3_d9c8_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l187_c4_959e]
signal BIN_OP_AND_uxn_c_l187_c4_959e_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l187_c4_959e_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l187_c4_959e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l188_c22_d185]
signal CONST_SL_8_uxn_c_l188_c22_d185_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l188_c22_d185_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l188_c4_dcc2]
signal BIN_OP_OR_uxn_c_l188_c4_dcc2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l188_c4_dcc2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l190_c12_34de]
signal BIN_OP_EQ_uxn_c_l190_c12_34de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c12_34de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c12_34de_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l190_c8_78d4]
signal screen_vector_MUX_uxn_c_l190_c8_78d4_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c8_78d4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c4_838f]
signal BIN_OP_AND_uxn_c_l191_c4_838f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_838f_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_838f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l192_c4_75ab]
signal BIN_OP_OR_uxn_c_l192_c4_75ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_75ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_75ab_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l185_c2_dd5a
screen_vector_MUX_uxn_c_l185_c2_dd5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l185_c2_dd5a_cond,
screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue,
screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse,
screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output);

-- BIN_OP_EQ_uxn_c_l186_c7_e6f6
BIN_OP_EQ_uxn_c_l186_c7_e6f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l186_c7_e6f6_left,
BIN_OP_EQ_uxn_c_l186_c7_e6f6_right,
BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output);

-- screen_vector_MUX_uxn_c_l186_c3_d9c8
screen_vector_MUX_uxn_c_l186_c3_d9c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c3_d9c8_cond,
screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue,
screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse,
screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output);

-- BIN_OP_AND_uxn_c_l187_c4_959e
BIN_OP_AND_uxn_c_l187_c4_959e : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l187_c4_959e_left,
BIN_OP_AND_uxn_c_l187_c4_959e_right,
BIN_OP_AND_uxn_c_l187_c4_959e_return_output);

-- CONST_SL_8_uxn_c_l188_c22_d185
CONST_SL_8_uxn_c_l188_c22_d185 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l188_c22_d185_x,
CONST_SL_8_uxn_c_l188_c22_d185_return_output);

-- BIN_OP_OR_uxn_c_l188_c4_dcc2
BIN_OP_OR_uxn_c_l188_c4_dcc2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l188_c4_dcc2_left,
BIN_OP_OR_uxn_c_l188_c4_dcc2_right,
BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output);

-- BIN_OP_EQ_uxn_c_l190_c12_34de
BIN_OP_EQ_uxn_c_l190_c12_34de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l190_c12_34de_left,
BIN_OP_EQ_uxn_c_l190_c12_34de_right,
BIN_OP_EQ_uxn_c_l190_c12_34de_return_output);

-- screen_vector_MUX_uxn_c_l190_c8_78d4
screen_vector_MUX_uxn_c_l190_c8_78d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l190_c8_78d4_cond,
screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue,
screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse,
screen_vector_MUX_uxn_c_l190_c8_78d4_return_output);

-- BIN_OP_AND_uxn_c_l191_c4_838f
BIN_OP_AND_uxn_c_l191_c4_838f : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c4_838f_left,
BIN_OP_AND_uxn_c_l191_c4_838f_right,
BIN_OP_AND_uxn_c_l191_c4_838f_return_output);

-- BIN_OP_OR_uxn_c_l192_c4_75ab
BIN_OP_OR_uxn_c_l192_c4_75ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l192_c4_75ab_left,
BIN_OP_OR_uxn_c_l192_c4_75ab_right,
BIN_OP_OR_uxn_c_l192_c4_75ab_return_output);



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
 screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output,
 BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output,
 screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output,
 BIN_OP_AND_uxn_c_l187_c4_959e_return_output,
 CONST_SL_8_uxn_c_l188_c22_d185_return_output,
 BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output,
 BIN_OP_EQ_uxn_c_l190_c12_34de_return_output,
 screen_vector_MUX_uxn_c_l190_c8_78d4_return_output,
 BIN_OP_AND_uxn_c_l191_c4_838f_return_output,
 BIN_OP_OR_uxn_c_l192_c4_75ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c4_959e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c4_959e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l187_c4_959e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c22_d185_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l188_c22_d185_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_838f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_838f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_838f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l188_DUPLICATE_458a_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l191_c4_838f_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l187_c4_959e_right := to_unsigned(255, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l187_c4_959e_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l191_c4_838f_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l187_c4_959e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l187_c4_959e_left <= VAR_BIN_OP_AND_uxn_c_l187_c4_959e_left;
     BIN_OP_AND_uxn_c_l187_c4_959e_right <= VAR_BIN_OP_AND_uxn_c_l187_c4_959e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l187_c4_959e_return_output := BIN_OP_AND_uxn_c_l187_c4_959e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l192_l188_DUPLICATE_458a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l188_DUPLICATE_458a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l190_c12_34de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l190_c12_34de_left <= VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_left;
     BIN_OP_EQ_uxn_c_l190_c12_34de_right <= VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_return_output := BIN_OP_EQ_uxn_c_l190_c12_34de_return_output;

     -- BIN_OP_EQ[uxn_c_l186_c7_e6f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l186_c7_e6f6_left <= VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_left;
     BIN_OP_EQ_uxn_c_l186_c7_e6f6_right <= VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output := BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output;

     -- BIN_OP_AND[uxn_c_l191_c4_838f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c4_838f_left <= VAR_BIN_OP_AND_uxn_c_l191_c4_838f_left;
     BIN_OP_AND_uxn_c_l191_c4_838f_right <= VAR_BIN_OP_AND_uxn_c_l191_c4_838f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c4_838f_return_output := BIN_OP_AND_uxn_c_l191_c4_838f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_left := VAR_BIN_OP_AND_uxn_c_l187_c4_959e_return_output;
     VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_left := VAR_BIN_OP_AND_uxn_c_l191_c4_838f_return_output;
     VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_cond := VAR_BIN_OP_EQ_uxn_c_l186_c7_e6f6_return_output;
     VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_cond := VAR_BIN_OP_EQ_uxn_c_l190_c12_34de_return_output;
     VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l188_DUPLICATE_458a_return_output;
     VAR_CONST_SL_8_uxn_c_l188_c22_d185_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l188_DUPLICATE_458a_return_output;
     -- BIN_OP_OR[uxn_c_l192_c4_75ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l192_c4_75ab_left <= VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_left;
     BIN_OP_OR_uxn_c_l192_c4_75ab_right <= VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_return_output := BIN_OP_OR_uxn_c_l192_c4_75ab_return_output;

     -- CONST_SL_8[uxn_c_l188_c22_d185] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l188_c22_d185_x <= VAR_CONST_SL_8_uxn_c_l188_c22_d185_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l188_c22_d185_return_output := CONST_SL_8_uxn_c_l188_c22_d185_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue := VAR_BIN_OP_OR_uxn_c_l192_c4_75ab_return_output;
     VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_right := VAR_CONST_SL_8_uxn_c_l188_c22_d185_return_output;
     -- BIN_OP_OR[uxn_c_l188_c4_dcc2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l188_c4_dcc2_left <= VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_left;
     BIN_OP_OR_uxn_c_l188_c4_dcc2_right <= VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output := BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output;

     -- screen_vector_MUX[uxn_c_l190_c8_78d4] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l190_c8_78d4_cond <= VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_cond;
     screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue <= VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iftrue;
     screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse <= VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_return_output := screen_vector_MUX_uxn_c_l190_c8_78d4_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue := VAR_BIN_OP_OR_uxn_c_l188_c4_dcc2_return_output;
     VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse := VAR_screen_vector_MUX_uxn_c_l190_c8_78d4_return_output;
     -- screen_vector_MUX[uxn_c_l186_c3_d9c8] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c3_d9c8_cond <= VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_cond;
     screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iftrue;
     screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output := screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue := VAR_screen_vector_MUX_uxn_c_l186_c3_d9c8_return_output;
     -- screen_vector_MUX[uxn_c_l185_c2_dd5a] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l185_c2_dd5a_cond <= VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_cond;
     screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue <= VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iftrue;
     screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse <= VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output := screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l185_c2_dd5a_return_output;
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
