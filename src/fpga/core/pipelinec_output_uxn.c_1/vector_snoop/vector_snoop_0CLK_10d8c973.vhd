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
-- screen_vector_MUX[uxn_c_l183_c2_891c]
signal screen_vector_MUX_uxn_c_l183_c2_891c_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_891c_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_891c_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_891c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l184_c7_40b6]
signal BIN_OP_EQ_uxn_c_l184_c7_40b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c7_40b6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l184_c3_865e]
signal screen_vector_MUX_uxn_c_l184_c3_865e_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_865e_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_865e_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_865e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l185_c4_9105]
signal BIN_OP_AND_uxn_c_l185_c4_9105_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l185_c4_9105_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l185_c4_9105_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l186_c22_5303]
signal CONST_SL_8_uxn_c_l186_c22_5303_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l186_c22_5303_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l186_c4_06cb]
signal BIN_OP_OR_uxn_c_l186_c4_06cb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l186_c4_06cb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l186_c4_06cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l188_c12_1d7e]
signal BIN_OP_EQ_uxn_c_l188_c12_1d7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l188_c12_1d7e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l188_c8_5d21]
signal screen_vector_MUX_uxn_c_l188_c8_5d21_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_5d21_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c4_e727]
signal BIN_OP_AND_uxn_c_l189_c4_e727_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c4_e727_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c4_e727_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l190_c4_e985]
signal BIN_OP_OR_uxn_c_l190_c4_e985_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l190_c4_e985_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l190_c4_e985_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l183_c2_891c
screen_vector_MUX_uxn_c_l183_c2_891c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l183_c2_891c_cond,
screen_vector_MUX_uxn_c_l183_c2_891c_iftrue,
screen_vector_MUX_uxn_c_l183_c2_891c_iffalse,
screen_vector_MUX_uxn_c_l183_c2_891c_return_output);

-- BIN_OP_EQ_uxn_c_l184_c7_40b6
BIN_OP_EQ_uxn_c_l184_c7_40b6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l184_c7_40b6_left,
BIN_OP_EQ_uxn_c_l184_c7_40b6_right,
BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output);

-- screen_vector_MUX_uxn_c_l184_c3_865e
screen_vector_MUX_uxn_c_l184_c3_865e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l184_c3_865e_cond,
screen_vector_MUX_uxn_c_l184_c3_865e_iftrue,
screen_vector_MUX_uxn_c_l184_c3_865e_iffalse,
screen_vector_MUX_uxn_c_l184_c3_865e_return_output);

-- BIN_OP_AND_uxn_c_l185_c4_9105
BIN_OP_AND_uxn_c_l185_c4_9105 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c4_9105_left,
BIN_OP_AND_uxn_c_l185_c4_9105_right,
BIN_OP_AND_uxn_c_l185_c4_9105_return_output);

-- CONST_SL_8_uxn_c_l186_c22_5303
CONST_SL_8_uxn_c_l186_c22_5303 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l186_c22_5303_x,
CONST_SL_8_uxn_c_l186_c22_5303_return_output);

-- BIN_OP_OR_uxn_c_l186_c4_06cb
BIN_OP_OR_uxn_c_l186_c4_06cb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l186_c4_06cb_left,
BIN_OP_OR_uxn_c_l186_c4_06cb_right,
BIN_OP_OR_uxn_c_l186_c4_06cb_return_output);

-- BIN_OP_EQ_uxn_c_l188_c12_1d7e
BIN_OP_EQ_uxn_c_l188_c12_1d7e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l188_c12_1d7e_left,
BIN_OP_EQ_uxn_c_l188_c12_1d7e_right,
BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output);

-- screen_vector_MUX_uxn_c_l188_c8_5d21
screen_vector_MUX_uxn_c_l188_c8_5d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l188_c8_5d21_cond,
screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue,
screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse,
screen_vector_MUX_uxn_c_l188_c8_5d21_return_output);

-- BIN_OP_AND_uxn_c_l189_c4_e727
BIN_OP_AND_uxn_c_l189_c4_e727 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c4_e727_left,
BIN_OP_AND_uxn_c_l189_c4_e727_right,
BIN_OP_AND_uxn_c_l189_c4_e727_return_output);

-- BIN_OP_OR_uxn_c_l190_c4_e985
BIN_OP_OR_uxn_c_l190_c4_e985 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l190_c4_e985_left,
BIN_OP_OR_uxn_c_l190_c4_e985_right,
BIN_OP_OR_uxn_c_l190_c4_e985_return_output);



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
 screen_vector_MUX_uxn_c_l183_c2_891c_return_output,
 BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output,
 screen_vector_MUX_uxn_c_l184_c3_865e_return_output,
 BIN_OP_AND_uxn_c_l185_c4_9105_return_output,
 CONST_SL_8_uxn_c_l186_c22_5303_return_output,
 BIN_OP_OR_uxn_c_l186_c4_06cb_return_output,
 BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output,
 screen_vector_MUX_uxn_c_l188_c8_5d21_return_output,
 BIN_OP_AND_uxn_c_l189_c4_e727_return_output,
 BIN_OP_OR_uxn_c_l190_c4_e985_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_865e_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_891c_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_891c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_865e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_9105_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_9105_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_9105_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l186_c22_5303_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l186_c22_5303_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_e727_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_e727_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_e727_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_e985_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_e985_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_e985_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_fdbf_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l185_c4_9105_right := to_unsigned(255, 16);
     VAR_BIN_OP_AND_uxn_c_l189_c4_e727_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_right := to_unsigned(33, 8);

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
     VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l183_c2_891c_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l185_c4_9105_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l189_c4_e727_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l189_c4_e727] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c4_e727_left <= VAR_BIN_OP_AND_uxn_c_l189_c4_e727_left;
     BIN_OP_AND_uxn_c_l189_c4_e727_right <= VAR_BIN_OP_AND_uxn_c_l189_c4_e727_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c4_e727_return_output := BIN_OP_AND_uxn_c_l189_c4_e727_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_fdbf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_fdbf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l184_c7_40b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l184_c7_40b6_left <= VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_left;
     BIN_OP_EQ_uxn_c_l184_c7_40b6_right <= VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output := BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output;

     -- BIN_OP_EQ[uxn_c_l188_c12_1d7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l188_c12_1d7e_left <= VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_left;
     BIN_OP_EQ_uxn_c_l188_c12_1d7e_right <= VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output := BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output;

     -- BIN_OP_AND[uxn_c_l185_c4_9105] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c4_9105_left <= VAR_BIN_OP_AND_uxn_c_l185_c4_9105_left;
     BIN_OP_AND_uxn_c_l185_c4_9105_right <= VAR_BIN_OP_AND_uxn_c_l185_c4_9105_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c4_9105_return_output := BIN_OP_AND_uxn_c_l185_c4_9105_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_left := VAR_BIN_OP_AND_uxn_c_l185_c4_9105_return_output;
     VAR_BIN_OP_OR_uxn_c_l190_c4_e985_left := VAR_BIN_OP_AND_uxn_c_l189_c4_e727_return_output;
     VAR_screen_vector_MUX_uxn_c_l184_c3_865e_cond := VAR_BIN_OP_EQ_uxn_c_l184_c7_40b6_return_output;
     VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_cond := VAR_BIN_OP_EQ_uxn_c_l188_c12_1d7e_return_output;
     VAR_BIN_OP_OR_uxn_c_l190_c4_e985_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_fdbf_return_output;
     VAR_CONST_SL_8_uxn_c_l186_c22_5303_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_fdbf_return_output;
     -- BIN_OP_OR[uxn_c_l190_c4_e985] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l190_c4_e985_left <= VAR_BIN_OP_OR_uxn_c_l190_c4_e985_left;
     BIN_OP_OR_uxn_c_l190_c4_e985_right <= VAR_BIN_OP_OR_uxn_c_l190_c4_e985_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l190_c4_e985_return_output := BIN_OP_OR_uxn_c_l190_c4_e985_return_output;

     -- CONST_SL_8[uxn_c_l186_c22_5303] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l186_c22_5303_x <= VAR_CONST_SL_8_uxn_c_l186_c22_5303_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l186_c22_5303_return_output := CONST_SL_8_uxn_c_l186_c22_5303_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue := VAR_BIN_OP_OR_uxn_c_l190_c4_e985_return_output;
     VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_right := VAR_CONST_SL_8_uxn_c_l186_c22_5303_return_output;
     -- screen_vector_MUX[uxn_c_l188_c8_5d21] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l188_c8_5d21_cond <= VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_cond;
     screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue <= VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iftrue;
     screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse <= VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_return_output := screen_vector_MUX_uxn_c_l188_c8_5d21_return_output;

     -- BIN_OP_OR[uxn_c_l186_c4_06cb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l186_c4_06cb_left <= VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_left;
     BIN_OP_OR_uxn_c_l186_c4_06cb_right <= VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_return_output := BIN_OP_OR_uxn_c_l186_c4_06cb_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iftrue := VAR_BIN_OP_OR_uxn_c_l186_c4_06cb_return_output;
     VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iffalse := VAR_screen_vector_MUX_uxn_c_l188_c8_5d21_return_output;
     -- screen_vector_MUX[uxn_c_l184_c3_865e] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l184_c3_865e_cond <= VAR_screen_vector_MUX_uxn_c_l184_c3_865e_cond;
     screen_vector_MUX_uxn_c_l184_c3_865e_iftrue <= VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iftrue;
     screen_vector_MUX_uxn_c_l184_c3_865e_iffalse <= VAR_screen_vector_MUX_uxn_c_l184_c3_865e_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l184_c3_865e_return_output := screen_vector_MUX_uxn_c_l184_c3_865e_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iftrue := VAR_screen_vector_MUX_uxn_c_l184_c3_865e_return_output;
     -- screen_vector_MUX[uxn_c_l183_c2_891c] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l183_c2_891c_cond <= VAR_screen_vector_MUX_uxn_c_l183_c2_891c_cond;
     screen_vector_MUX_uxn_c_l183_c2_891c_iftrue <= VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iftrue;
     screen_vector_MUX_uxn_c_l183_c2_891c_iffalse <= VAR_screen_vector_MUX_uxn_c_l183_c2_891c_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l183_c2_891c_return_output := screen_vector_MUX_uxn_c_l183_c2_891c_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l183_c2_891c_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l183_c2_891c_return_output;
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
