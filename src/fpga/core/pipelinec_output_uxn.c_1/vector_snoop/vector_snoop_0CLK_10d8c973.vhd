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
-- screen_vector_MUX[uxn_c_l232_c2_3852]
signal screen_vector_MUX_uxn_c_l232_c2_3852_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3852_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3852_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3852_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l233_c7_3519]
signal BIN_OP_EQ_uxn_c_l233_c7_3519_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l233_c7_3519_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l233_c7_3519_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l233_c3_4391]
signal screen_vector_MUX_uxn_c_l233_c3_4391_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_4391_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_4391_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_4391_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_356e]
signal BIN_OP_AND_uxn_c_l234_c4_356e_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_356e_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_356e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l235_c22_0ae2]
signal CONST_SL_8_uxn_c_l235_c22_0ae2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l235_c22_0ae2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_4593]
signal BIN_OP_OR_uxn_c_l235_c4_4593_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_4593_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_4593_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c12_b7fe]
signal BIN_OP_EQ_uxn_c_l237_c12_b7fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_b7fe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l237_c8_6147]
signal screen_vector_MUX_uxn_c_l237_c8_6147_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6147_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6147_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6147_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l238_c4_5349]
signal BIN_OP_AND_uxn_c_l238_c4_5349_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l238_c4_5349_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l238_c4_5349_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l239_c4_ee34]
signal BIN_OP_OR_uxn_c_l239_c4_ee34_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l239_c4_ee34_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l239_c4_ee34_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l232_c2_3852
screen_vector_MUX_uxn_c_l232_c2_3852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l232_c2_3852_cond,
screen_vector_MUX_uxn_c_l232_c2_3852_iftrue,
screen_vector_MUX_uxn_c_l232_c2_3852_iffalse,
screen_vector_MUX_uxn_c_l232_c2_3852_return_output);

-- BIN_OP_EQ_uxn_c_l233_c7_3519
BIN_OP_EQ_uxn_c_l233_c7_3519 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l233_c7_3519_left,
BIN_OP_EQ_uxn_c_l233_c7_3519_right,
BIN_OP_EQ_uxn_c_l233_c7_3519_return_output);

-- screen_vector_MUX_uxn_c_l233_c3_4391
screen_vector_MUX_uxn_c_l233_c3_4391 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l233_c3_4391_cond,
screen_vector_MUX_uxn_c_l233_c3_4391_iftrue,
screen_vector_MUX_uxn_c_l233_c3_4391_iffalse,
screen_vector_MUX_uxn_c_l233_c3_4391_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_356e
BIN_OP_AND_uxn_c_l234_c4_356e : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_356e_left,
BIN_OP_AND_uxn_c_l234_c4_356e_right,
BIN_OP_AND_uxn_c_l234_c4_356e_return_output);

-- CONST_SL_8_uxn_c_l235_c22_0ae2
CONST_SL_8_uxn_c_l235_c22_0ae2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l235_c22_0ae2_x,
CONST_SL_8_uxn_c_l235_c22_0ae2_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_4593
BIN_OP_OR_uxn_c_l235_c4_4593 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_4593_left,
BIN_OP_OR_uxn_c_l235_c4_4593_right,
BIN_OP_OR_uxn_c_l235_c4_4593_return_output);

-- BIN_OP_EQ_uxn_c_l237_c12_b7fe
BIN_OP_EQ_uxn_c_l237_c12_b7fe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c12_b7fe_left,
BIN_OP_EQ_uxn_c_l237_c12_b7fe_right,
BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output);

-- screen_vector_MUX_uxn_c_l237_c8_6147
screen_vector_MUX_uxn_c_l237_c8_6147 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l237_c8_6147_cond,
screen_vector_MUX_uxn_c_l237_c8_6147_iftrue,
screen_vector_MUX_uxn_c_l237_c8_6147_iffalse,
screen_vector_MUX_uxn_c_l237_c8_6147_return_output);

-- BIN_OP_AND_uxn_c_l238_c4_5349
BIN_OP_AND_uxn_c_l238_c4_5349 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l238_c4_5349_left,
BIN_OP_AND_uxn_c_l238_c4_5349_right,
BIN_OP_AND_uxn_c_l238_c4_5349_return_output);

-- BIN_OP_OR_uxn_c_l239_c4_ee34
BIN_OP_OR_uxn_c_l239_c4_ee34 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l239_c4_ee34_left,
BIN_OP_OR_uxn_c_l239_c4_ee34_right,
BIN_OP_OR_uxn_c_l239_c4_ee34_return_output);



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
 screen_vector_MUX_uxn_c_l232_c2_3852_return_output,
 BIN_OP_EQ_uxn_c_l233_c7_3519_return_output,
 screen_vector_MUX_uxn_c_l233_c3_4391_return_output,
 BIN_OP_AND_uxn_c_l234_c4_356e_return_output,
 CONST_SL_8_uxn_c_l235_c22_0ae2_return_output,
 BIN_OP_OR_uxn_c_l235_c4_4593_return_output,
 BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output,
 screen_vector_MUX_uxn_c_l237_c8_6147_return_output,
 BIN_OP_AND_uxn_c_l238_c4_5349_return_output,
 BIN_OP_OR_uxn_c_l239_c4_ee34_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_4391_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3852_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3852_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6147_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_4391_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_356e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_356e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_356e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_4593_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_4593_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_4593_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6147_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_5349_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_5349_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_5349_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l239_l235_DUPLICATE_7db7_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l238_c4_5349_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l234_c4_356e_right := to_unsigned(255, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l232_c2_3852_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l234_c4_356e_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l238_c4_5349_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iffalse := screen_vector;
     -- BIN_OP_EQ[uxn_c_l233_c7_3519] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l233_c7_3519_left <= VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_left;
     BIN_OP_EQ_uxn_c_l233_c7_3519_right <= VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_return_output := BIN_OP_EQ_uxn_c_l233_c7_3519_return_output;

     -- BIN_OP_AND[uxn_c_l238_c4_5349] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l238_c4_5349_left <= VAR_BIN_OP_AND_uxn_c_l238_c4_5349_left;
     BIN_OP_AND_uxn_c_l238_c4_5349_right <= VAR_BIN_OP_AND_uxn_c_l238_c4_5349_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l238_c4_5349_return_output := BIN_OP_AND_uxn_c_l238_c4_5349_return_output;

     -- BIN_OP_AND[uxn_c_l234_c4_356e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_356e_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_356e_left;
     BIN_OP_AND_uxn_c_l234_c4_356e_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_356e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_356e_return_output := BIN_OP_AND_uxn_c_l234_c4_356e_return_output;

     -- BIN_OP_EQ[uxn_c_l237_c12_b7fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c12_b7fe_left <= VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_left;
     BIN_OP_EQ_uxn_c_l237_c12_b7fe_right <= VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output := BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l239_l235_DUPLICATE_7db7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l239_l235_DUPLICATE_7db7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l235_c4_4593_left := VAR_BIN_OP_AND_uxn_c_l234_c4_356e_return_output;
     VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_left := VAR_BIN_OP_AND_uxn_c_l238_c4_5349_return_output;
     VAR_screen_vector_MUX_uxn_c_l233_c3_4391_cond := VAR_BIN_OP_EQ_uxn_c_l233_c7_3519_return_output;
     VAR_screen_vector_MUX_uxn_c_l237_c8_6147_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_b7fe_return_output;
     VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l239_l235_DUPLICATE_7db7_return_output;
     VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l239_l235_DUPLICATE_7db7_return_output;
     -- BIN_OP_OR[uxn_c_l239_c4_ee34] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l239_c4_ee34_left <= VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_left;
     BIN_OP_OR_uxn_c_l239_c4_ee34_right <= VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_return_output := BIN_OP_OR_uxn_c_l239_c4_ee34_return_output;

     -- CONST_SL_8[uxn_c_l235_c22_0ae2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l235_c22_0ae2_x <= VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_return_output := CONST_SL_8_uxn_c_l235_c22_0ae2_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iftrue := VAR_BIN_OP_OR_uxn_c_l239_c4_ee34_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_4593_right := VAR_CONST_SL_8_uxn_c_l235_c22_0ae2_return_output;
     -- screen_vector_MUX[uxn_c_l237_c8_6147] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l237_c8_6147_cond <= VAR_screen_vector_MUX_uxn_c_l237_c8_6147_cond;
     screen_vector_MUX_uxn_c_l237_c8_6147_iftrue <= VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iftrue;
     screen_vector_MUX_uxn_c_l237_c8_6147_iffalse <= VAR_screen_vector_MUX_uxn_c_l237_c8_6147_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l237_c8_6147_return_output := screen_vector_MUX_uxn_c_l237_c8_6147_return_output;

     -- BIN_OP_OR[uxn_c_l235_c4_4593] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_4593_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_4593_left;
     BIN_OP_OR_uxn_c_l235_c4_4593_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_4593_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_4593_return_output := BIN_OP_OR_uxn_c_l235_c4_4593_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_4593_return_output;
     VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iffalse := VAR_screen_vector_MUX_uxn_c_l237_c8_6147_return_output;
     -- screen_vector_MUX[uxn_c_l233_c3_4391] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l233_c3_4391_cond <= VAR_screen_vector_MUX_uxn_c_l233_c3_4391_cond;
     screen_vector_MUX_uxn_c_l233_c3_4391_iftrue <= VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iftrue;
     screen_vector_MUX_uxn_c_l233_c3_4391_iffalse <= VAR_screen_vector_MUX_uxn_c_l233_c3_4391_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l233_c3_4391_return_output := screen_vector_MUX_uxn_c_l233_c3_4391_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iftrue := VAR_screen_vector_MUX_uxn_c_l233_c3_4391_return_output;
     -- screen_vector_MUX[uxn_c_l232_c2_3852] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l232_c2_3852_cond <= VAR_screen_vector_MUX_uxn_c_l232_c2_3852_cond;
     screen_vector_MUX_uxn_c_l232_c2_3852_iftrue <= VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iftrue;
     screen_vector_MUX_uxn_c_l232_c2_3852_iffalse <= VAR_screen_vector_MUX_uxn_c_l232_c2_3852_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l232_c2_3852_return_output := screen_vector_MUX_uxn_c_l232_c2_3852_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l232_c2_3852_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l232_c2_3852_return_output;
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
