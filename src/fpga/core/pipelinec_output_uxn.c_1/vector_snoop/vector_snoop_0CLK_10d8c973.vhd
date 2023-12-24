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
-- screen_vector_MUX[uxn_c_l183_c2_4f50]
signal screen_vector_MUX_uxn_c_l183_c2_4f50_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l183_c2_4f50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l184_c7_fbc7]
signal BIN_OP_EQ_uxn_c_l184_c7_fbc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c7_fbc7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l184_c3_8f58]
signal screen_vector_MUX_uxn_c_l184_c3_8f58_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l184_c3_8f58_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l185_c4_60e2]
signal BIN_OP_AND_uxn_c_l185_c4_60e2_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l185_c4_60e2_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l185_c4_60e2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l186_c22_d496]
signal CONST_SL_8_uxn_c_l186_c22_d496_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l186_c22_d496_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l186_c4_e4d0]
signal BIN_OP_OR_uxn_c_l186_c4_e4d0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l186_c4_e4d0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l188_c12_6ee8]
signal BIN_OP_EQ_uxn_c_l188_c12_6ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l188_c12_6ee8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l188_c8_4100]
signal screen_vector_MUX_uxn_c_l188_c8_4100_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_4100_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_4100_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l188_c8_4100_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l189_c4_998c]
signal BIN_OP_AND_uxn_c_l189_c4_998c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c4_998c_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l189_c4_998c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l190_c4_ff82]
signal BIN_OP_OR_uxn_c_l190_c4_ff82_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l190_c4_ff82_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l190_c4_ff82_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l183_c2_4f50
screen_vector_MUX_uxn_c_l183_c2_4f50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l183_c2_4f50_cond,
screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue,
screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse,
screen_vector_MUX_uxn_c_l183_c2_4f50_return_output);

-- BIN_OP_EQ_uxn_c_l184_c7_fbc7
BIN_OP_EQ_uxn_c_l184_c7_fbc7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l184_c7_fbc7_left,
BIN_OP_EQ_uxn_c_l184_c7_fbc7_right,
BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output);

-- screen_vector_MUX_uxn_c_l184_c3_8f58
screen_vector_MUX_uxn_c_l184_c3_8f58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l184_c3_8f58_cond,
screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue,
screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse,
screen_vector_MUX_uxn_c_l184_c3_8f58_return_output);

-- BIN_OP_AND_uxn_c_l185_c4_60e2
BIN_OP_AND_uxn_c_l185_c4_60e2 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l185_c4_60e2_left,
BIN_OP_AND_uxn_c_l185_c4_60e2_right,
BIN_OP_AND_uxn_c_l185_c4_60e2_return_output);

-- CONST_SL_8_uxn_c_l186_c22_d496
CONST_SL_8_uxn_c_l186_c22_d496 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l186_c22_d496_x,
CONST_SL_8_uxn_c_l186_c22_d496_return_output);

-- BIN_OP_OR_uxn_c_l186_c4_e4d0
BIN_OP_OR_uxn_c_l186_c4_e4d0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l186_c4_e4d0_left,
BIN_OP_OR_uxn_c_l186_c4_e4d0_right,
BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output);

-- BIN_OP_EQ_uxn_c_l188_c12_6ee8
BIN_OP_EQ_uxn_c_l188_c12_6ee8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l188_c12_6ee8_left,
BIN_OP_EQ_uxn_c_l188_c12_6ee8_right,
BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output);

-- screen_vector_MUX_uxn_c_l188_c8_4100
screen_vector_MUX_uxn_c_l188_c8_4100 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l188_c8_4100_cond,
screen_vector_MUX_uxn_c_l188_c8_4100_iftrue,
screen_vector_MUX_uxn_c_l188_c8_4100_iffalse,
screen_vector_MUX_uxn_c_l188_c8_4100_return_output);

-- BIN_OP_AND_uxn_c_l189_c4_998c
BIN_OP_AND_uxn_c_l189_c4_998c : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l189_c4_998c_left,
BIN_OP_AND_uxn_c_l189_c4_998c_right,
BIN_OP_AND_uxn_c_l189_c4_998c_return_output);

-- BIN_OP_OR_uxn_c_l190_c4_ff82
BIN_OP_OR_uxn_c_l190_c4_ff82 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l190_c4_ff82_left,
BIN_OP_OR_uxn_c_l190_c4_ff82_right,
BIN_OP_OR_uxn_c_l190_c4_ff82_return_output);



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
 screen_vector_MUX_uxn_c_l183_c2_4f50_return_output,
 BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output,
 screen_vector_MUX_uxn_c_l184_c3_8f58_return_output,
 BIN_OP_AND_uxn_c_l185_c4_60e2_return_output,
 CONST_SL_8_uxn_c_l186_c22_d496_return_output,
 BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output,
 BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output,
 screen_vector_MUX_uxn_c_l188_c8_4100_return_output,
 BIN_OP_AND_uxn_c_l189_c4_998c_return_output,
 BIN_OP_OR_uxn_c_l190_c4_ff82_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_4100_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l186_c22_d496_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l186_c22_d496_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l188_c8_4100_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_998c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_998c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l189_c4_998c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_8b72_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l189_c4_998c_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_right := to_unsigned(32, 8);

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
     VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l189_c4_998c_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iffalse := screen_vector;
     -- CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_8b72 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_8b72_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l184_c7_fbc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l184_c7_fbc7_left <= VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_left;
     BIN_OP_EQ_uxn_c_l184_c7_fbc7_right <= VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output := BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output;

     -- BIN_OP_EQ[uxn_c_l188_c12_6ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l188_c12_6ee8_left <= VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_left;
     BIN_OP_EQ_uxn_c_l188_c12_6ee8_right <= VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output := BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output;

     -- BIN_OP_AND[uxn_c_l189_c4_998c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l189_c4_998c_left <= VAR_BIN_OP_AND_uxn_c_l189_c4_998c_left;
     BIN_OP_AND_uxn_c_l189_c4_998c_right <= VAR_BIN_OP_AND_uxn_c_l189_c4_998c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l189_c4_998c_return_output := BIN_OP_AND_uxn_c_l189_c4_998c_return_output;

     -- BIN_OP_AND[uxn_c_l185_c4_60e2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l185_c4_60e2_left <= VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_left;
     BIN_OP_AND_uxn_c_l185_c4_60e2_right <= VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_return_output := BIN_OP_AND_uxn_c_l185_c4_60e2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_left := VAR_BIN_OP_AND_uxn_c_l185_c4_60e2_return_output;
     VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_left := VAR_BIN_OP_AND_uxn_c_l189_c4_998c_return_output;
     VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_cond := VAR_BIN_OP_EQ_uxn_c_l184_c7_fbc7_return_output;
     VAR_screen_vector_MUX_uxn_c_l188_c8_4100_cond := VAR_BIN_OP_EQ_uxn_c_l188_c12_6ee8_return_output;
     VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_8b72_return_output;
     VAR_CONST_SL_8_uxn_c_l186_c22_d496_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l186_l190_DUPLICATE_8b72_return_output;
     -- BIN_OP_OR[uxn_c_l190_c4_ff82] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l190_c4_ff82_left <= VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_left;
     BIN_OP_OR_uxn_c_l190_c4_ff82_right <= VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_return_output := BIN_OP_OR_uxn_c_l190_c4_ff82_return_output;

     -- CONST_SL_8[uxn_c_l186_c22_d496] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l186_c22_d496_x <= VAR_CONST_SL_8_uxn_c_l186_c22_d496_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l186_c22_d496_return_output := CONST_SL_8_uxn_c_l186_c22_d496_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iftrue := VAR_BIN_OP_OR_uxn_c_l190_c4_ff82_return_output;
     VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_right := VAR_CONST_SL_8_uxn_c_l186_c22_d496_return_output;
     -- BIN_OP_OR[uxn_c_l186_c4_e4d0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l186_c4_e4d0_left <= VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_left;
     BIN_OP_OR_uxn_c_l186_c4_e4d0_right <= VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output := BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output;

     -- screen_vector_MUX[uxn_c_l188_c8_4100] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l188_c8_4100_cond <= VAR_screen_vector_MUX_uxn_c_l188_c8_4100_cond;
     screen_vector_MUX_uxn_c_l188_c8_4100_iftrue <= VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iftrue;
     screen_vector_MUX_uxn_c_l188_c8_4100_iffalse <= VAR_screen_vector_MUX_uxn_c_l188_c8_4100_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l188_c8_4100_return_output := screen_vector_MUX_uxn_c_l188_c8_4100_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue := VAR_BIN_OP_OR_uxn_c_l186_c4_e4d0_return_output;
     VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse := VAR_screen_vector_MUX_uxn_c_l188_c8_4100_return_output;
     -- screen_vector_MUX[uxn_c_l184_c3_8f58] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l184_c3_8f58_cond <= VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_cond;
     screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue <= VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iftrue;
     screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse <= VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_return_output := screen_vector_MUX_uxn_c_l184_c3_8f58_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue := VAR_screen_vector_MUX_uxn_c_l184_c3_8f58_return_output;
     -- screen_vector_MUX[uxn_c_l183_c2_4f50] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l183_c2_4f50_cond <= VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_cond;
     screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue <= VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iftrue;
     screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse <= VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_return_output := screen_vector_MUX_uxn_c_l183_c2_4f50_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l183_c2_4f50_return_output;
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
