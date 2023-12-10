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
-- screen_vector_MUX[uxn_c_l189_c2_2e9a]
signal screen_vector_MUX_uxn_c_l189_c2_2e9a_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l190_c7_0ad1]
signal BIN_OP_EQ_uxn_c_l190_c7_0ad1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c7_0ad1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l190_c3_c6aa]
signal screen_vector_MUX_uxn_c_l190_c3_c6aa_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c4_b199]
signal BIN_OP_AND_uxn_c_l191_c4_b199_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_b199_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_b199_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l192_c22_d3f7]
signal CONST_SL_8_uxn_c_l192_c22_d3f7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l192_c22_d3f7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l192_c4_c515]
signal BIN_OP_OR_uxn_c_l192_c4_c515_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_c515_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_c515_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l194_c12_dbc4]
signal BIN_OP_EQ_uxn_c_l194_c12_dbc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c12_dbc4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l194_c8_853d]
signal screen_vector_MUX_uxn_c_l194_c8_853d_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_853d_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_853d_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_853d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l195_c4_936f]
signal BIN_OP_AND_uxn_c_l195_c4_936f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l195_c4_936f_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l195_c4_936f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l196_c4_6e57]
signal BIN_OP_OR_uxn_c_l196_c4_6e57_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l196_c4_6e57_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l196_c4_6e57_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l189_c2_2e9a
screen_vector_MUX_uxn_c_l189_c2_2e9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l189_c2_2e9a_cond,
screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue,
screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse,
screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output);

-- BIN_OP_EQ_uxn_c_l190_c7_0ad1
BIN_OP_EQ_uxn_c_l190_c7_0ad1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l190_c7_0ad1_left,
BIN_OP_EQ_uxn_c_l190_c7_0ad1_right,
BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output);

-- screen_vector_MUX_uxn_c_l190_c3_c6aa
screen_vector_MUX_uxn_c_l190_c3_c6aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l190_c3_c6aa_cond,
screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue,
screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse,
screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output);

-- BIN_OP_AND_uxn_c_l191_c4_b199
BIN_OP_AND_uxn_c_l191_c4_b199 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c4_b199_left,
BIN_OP_AND_uxn_c_l191_c4_b199_right,
BIN_OP_AND_uxn_c_l191_c4_b199_return_output);

-- CONST_SL_8_uxn_c_l192_c22_d3f7
CONST_SL_8_uxn_c_l192_c22_d3f7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l192_c22_d3f7_x,
CONST_SL_8_uxn_c_l192_c22_d3f7_return_output);

-- BIN_OP_OR_uxn_c_l192_c4_c515
BIN_OP_OR_uxn_c_l192_c4_c515 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l192_c4_c515_left,
BIN_OP_OR_uxn_c_l192_c4_c515_right,
BIN_OP_OR_uxn_c_l192_c4_c515_return_output);

-- BIN_OP_EQ_uxn_c_l194_c12_dbc4
BIN_OP_EQ_uxn_c_l194_c12_dbc4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l194_c12_dbc4_left,
BIN_OP_EQ_uxn_c_l194_c12_dbc4_right,
BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output);

-- screen_vector_MUX_uxn_c_l194_c8_853d
screen_vector_MUX_uxn_c_l194_c8_853d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l194_c8_853d_cond,
screen_vector_MUX_uxn_c_l194_c8_853d_iftrue,
screen_vector_MUX_uxn_c_l194_c8_853d_iffalse,
screen_vector_MUX_uxn_c_l194_c8_853d_return_output);

-- BIN_OP_AND_uxn_c_l195_c4_936f
BIN_OP_AND_uxn_c_l195_c4_936f : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l195_c4_936f_left,
BIN_OP_AND_uxn_c_l195_c4_936f_right,
BIN_OP_AND_uxn_c_l195_c4_936f_return_output);

-- BIN_OP_OR_uxn_c_l196_c4_6e57
BIN_OP_OR_uxn_c_l196_c4_6e57 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l196_c4_6e57_left,
BIN_OP_OR_uxn_c_l196_c4_6e57_right,
BIN_OP_OR_uxn_c_l196_c4_6e57_return_output);



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
 screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output,
 BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output,
 screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output,
 BIN_OP_AND_uxn_c_l191_c4_b199_return_output,
 CONST_SL_8_uxn_c_l192_c22_d3f7_return_output,
 BIN_OP_OR_uxn_c_l192_c4_c515_return_output,
 BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output,
 screen_vector_MUX_uxn_c_l194_c8_853d_return_output,
 BIN_OP_AND_uxn_c_l195_c4_936f_return_output,
 BIN_OP_OR_uxn_c_l196_c4_6e57_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_853d_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_b199_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_b199_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_b199_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_c515_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_c515_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_c515_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_853d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_936f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_936f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_936f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_566f_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l191_c4_b199_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l195_c4_936f_right := to_unsigned(65280, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l191_c4_b199_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l195_c4_936f_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iffalse := screen_vector;
     -- BIN_OP_EQ[uxn_c_l190_c7_0ad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l190_c7_0ad1_left <= VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_left;
     BIN_OP_EQ_uxn_c_l190_c7_0ad1_right <= VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output := BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output;

     -- BIN_OP_EQ[uxn_c_l194_c12_dbc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l194_c12_dbc4_left <= VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_left;
     BIN_OP_EQ_uxn_c_l194_c12_dbc4_right <= VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output := BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output;

     -- BIN_OP_AND[uxn_c_l191_c4_b199] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c4_b199_left <= VAR_BIN_OP_AND_uxn_c_l191_c4_b199_left;
     BIN_OP_AND_uxn_c_l191_c4_b199_right <= VAR_BIN_OP_AND_uxn_c_l191_c4_b199_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c4_b199_return_output := BIN_OP_AND_uxn_c_l191_c4_b199_return_output;

     -- BIN_OP_AND[uxn_c_l195_c4_936f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l195_c4_936f_left <= VAR_BIN_OP_AND_uxn_c_l195_c4_936f_left;
     BIN_OP_AND_uxn_c_l195_c4_936f_right <= VAR_BIN_OP_AND_uxn_c_l195_c4_936f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l195_c4_936f_return_output := BIN_OP_AND_uxn_c_l195_c4_936f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_566f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_566f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l192_c4_c515_left := VAR_BIN_OP_AND_uxn_c_l191_c4_b199_return_output;
     VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_left := VAR_BIN_OP_AND_uxn_c_l195_c4_936f_return_output;
     VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_cond := VAR_BIN_OP_EQ_uxn_c_l190_c7_0ad1_return_output;
     VAR_screen_vector_MUX_uxn_c_l194_c8_853d_cond := VAR_BIN_OP_EQ_uxn_c_l194_c12_dbc4_return_output;
     VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_566f_return_output;
     VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_566f_return_output;
     -- BIN_OP_OR[uxn_c_l196_c4_6e57] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l196_c4_6e57_left <= VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_left;
     BIN_OP_OR_uxn_c_l196_c4_6e57_right <= VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_return_output := BIN_OP_OR_uxn_c_l196_c4_6e57_return_output;

     -- CONST_SL_8[uxn_c_l192_c22_d3f7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l192_c22_d3f7_x <= VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_return_output := CONST_SL_8_uxn_c_l192_c22_d3f7_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iftrue := VAR_BIN_OP_OR_uxn_c_l196_c4_6e57_return_output;
     VAR_BIN_OP_OR_uxn_c_l192_c4_c515_right := VAR_CONST_SL_8_uxn_c_l192_c22_d3f7_return_output;
     -- BIN_OP_OR[uxn_c_l192_c4_c515] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l192_c4_c515_left <= VAR_BIN_OP_OR_uxn_c_l192_c4_c515_left;
     BIN_OP_OR_uxn_c_l192_c4_c515_right <= VAR_BIN_OP_OR_uxn_c_l192_c4_c515_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l192_c4_c515_return_output := BIN_OP_OR_uxn_c_l192_c4_c515_return_output;

     -- screen_vector_MUX[uxn_c_l194_c8_853d] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l194_c8_853d_cond <= VAR_screen_vector_MUX_uxn_c_l194_c8_853d_cond;
     screen_vector_MUX_uxn_c_l194_c8_853d_iftrue <= VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iftrue;
     screen_vector_MUX_uxn_c_l194_c8_853d_iffalse <= VAR_screen_vector_MUX_uxn_c_l194_c8_853d_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l194_c8_853d_return_output := screen_vector_MUX_uxn_c_l194_c8_853d_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue := VAR_BIN_OP_OR_uxn_c_l192_c4_c515_return_output;
     VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse := VAR_screen_vector_MUX_uxn_c_l194_c8_853d_return_output;
     -- screen_vector_MUX[uxn_c_l190_c3_c6aa] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l190_c3_c6aa_cond <= VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_cond;
     screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue <= VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iftrue;
     screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse <= VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output := screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue := VAR_screen_vector_MUX_uxn_c_l190_c3_c6aa_return_output;
     -- screen_vector_MUX[uxn_c_l189_c2_2e9a] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l189_c2_2e9a_cond <= VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_cond;
     screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue <= VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iftrue;
     screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse <= VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output := screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l189_c2_2e9a_return_output;
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
