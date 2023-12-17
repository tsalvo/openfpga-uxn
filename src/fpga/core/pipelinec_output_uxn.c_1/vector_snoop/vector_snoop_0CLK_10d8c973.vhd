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
-- screen_vector_MUX[uxn_c_l186_c2_b559]
signal screen_vector_MUX_uxn_c_l186_c2_b559_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b559_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b559_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b559_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l187_c7_b561]
signal BIN_OP_EQ_uxn_c_l187_c7_b561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_b561_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_b561_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l187_c3_1ffd]
signal screen_vector_MUX_uxn_c_l187_c3_1ffd_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l188_c4_d3b7]
signal BIN_OP_AND_uxn_c_l188_c4_d3b7_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_d3b7_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l189_c22_ff1b]
signal CONST_SL_8_uxn_c_l189_c22_ff1b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l189_c22_ff1b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l189_c4_1201]
signal BIN_OP_OR_uxn_c_l189_c4_1201_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_1201_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_1201_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l191_c12_4155]
signal BIN_OP_EQ_uxn_c_l191_c12_4155_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c12_4155_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l191_c12_4155_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l191_c8_fa67]
signal screen_vector_MUX_uxn_c_l191_c8_fa67_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l191_c8_fa67_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l192_c4_e027]
signal BIN_OP_AND_uxn_c_l192_c4_e027_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l192_c4_e027_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l192_c4_e027_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l193_c4_4f01]
signal BIN_OP_OR_uxn_c_l193_c4_4f01_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l193_c4_4f01_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l193_c4_4f01_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l186_c2_b559
screen_vector_MUX_uxn_c_l186_c2_b559 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c2_b559_cond,
screen_vector_MUX_uxn_c_l186_c2_b559_iftrue,
screen_vector_MUX_uxn_c_l186_c2_b559_iffalse,
screen_vector_MUX_uxn_c_l186_c2_b559_return_output);

-- BIN_OP_EQ_uxn_c_l187_c7_b561
BIN_OP_EQ_uxn_c_l187_c7_b561 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l187_c7_b561_left,
BIN_OP_EQ_uxn_c_l187_c7_b561_right,
BIN_OP_EQ_uxn_c_l187_c7_b561_return_output);

-- screen_vector_MUX_uxn_c_l187_c3_1ffd
screen_vector_MUX_uxn_c_l187_c3_1ffd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l187_c3_1ffd_cond,
screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue,
screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse,
screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output);

-- BIN_OP_AND_uxn_c_l188_c4_d3b7
BIN_OP_AND_uxn_c_l188_c4_d3b7 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c4_d3b7_left,
BIN_OP_AND_uxn_c_l188_c4_d3b7_right,
BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output);

-- CONST_SL_8_uxn_c_l189_c22_ff1b
CONST_SL_8_uxn_c_l189_c22_ff1b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l189_c22_ff1b_x,
CONST_SL_8_uxn_c_l189_c22_ff1b_return_output);

-- BIN_OP_OR_uxn_c_l189_c4_1201
BIN_OP_OR_uxn_c_l189_c4_1201 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l189_c4_1201_left,
BIN_OP_OR_uxn_c_l189_c4_1201_right,
BIN_OP_OR_uxn_c_l189_c4_1201_return_output);

-- BIN_OP_EQ_uxn_c_l191_c12_4155
BIN_OP_EQ_uxn_c_l191_c12_4155 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l191_c12_4155_left,
BIN_OP_EQ_uxn_c_l191_c12_4155_right,
BIN_OP_EQ_uxn_c_l191_c12_4155_return_output);

-- screen_vector_MUX_uxn_c_l191_c8_fa67
screen_vector_MUX_uxn_c_l191_c8_fa67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l191_c8_fa67_cond,
screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue,
screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse,
screen_vector_MUX_uxn_c_l191_c8_fa67_return_output);

-- BIN_OP_AND_uxn_c_l192_c4_e027
BIN_OP_AND_uxn_c_l192_c4_e027 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l192_c4_e027_left,
BIN_OP_AND_uxn_c_l192_c4_e027_right,
BIN_OP_AND_uxn_c_l192_c4_e027_return_output);

-- BIN_OP_OR_uxn_c_l193_c4_4f01
BIN_OP_OR_uxn_c_l193_c4_4f01 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l193_c4_4f01_left,
BIN_OP_OR_uxn_c_l193_c4_4f01_right,
BIN_OP_OR_uxn_c_l193_c4_4f01_return_output);



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
 screen_vector_MUX_uxn_c_l186_c2_b559_return_output,
 BIN_OP_EQ_uxn_c_l187_c7_b561_return_output,
 screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output,
 BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output,
 CONST_SL_8_uxn_c_l189_c22_ff1b_return_output,
 BIN_OP_OR_uxn_c_l189_c4_1201_return_output,
 BIN_OP_EQ_uxn_c_l191_c12_4155_return_output,
 screen_vector_MUX_uxn_c_l191_c8_fa67_return_output,
 BIN_OP_AND_uxn_c_l192_c4_e027_return_output,
 BIN_OP_OR_uxn_c_l193_c4_4f01_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b559_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b559_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_1201_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_1201_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_1201_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_e027_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_e027_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l192_c4_e027_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l193_DUPLICATE_ca2e_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l192_c4_e027_right := to_unsigned(65280, 16);
     VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_right := to_unsigned(33, 8);

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
     VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l186_c2_b559_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l192_c4_e027_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse := screen_vector;
     -- BIN_OP_EQ[uxn_c_l187_c7_b561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l187_c7_b561_left <= VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_left;
     BIN_OP_EQ_uxn_c_l187_c7_b561_right <= VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_return_output := BIN_OP_EQ_uxn_c_l187_c7_b561_return_output;

     -- BIN_OP_AND[uxn_c_l188_c4_d3b7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c4_d3b7_left <= VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_left;
     BIN_OP_AND_uxn_c_l188_c4_d3b7_right <= VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output := BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l189_l193_DUPLICATE_ca2e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l193_DUPLICATE_ca2e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l192_c4_e027] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l192_c4_e027_left <= VAR_BIN_OP_AND_uxn_c_l192_c4_e027_left;
     BIN_OP_AND_uxn_c_l192_c4_e027_right <= VAR_BIN_OP_AND_uxn_c_l192_c4_e027_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l192_c4_e027_return_output := BIN_OP_AND_uxn_c_l192_c4_e027_return_output;

     -- BIN_OP_EQ[uxn_c_l191_c12_4155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l191_c12_4155_left <= VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_left;
     BIN_OP_EQ_uxn_c_l191_c12_4155_right <= VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_return_output := BIN_OP_EQ_uxn_c_l191_c12_4155_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l189_c4_1201_left := VAR_BIN_OP_AND_uxn_c_l188_c4_d3b7_return_output;
     VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_left := VAR_BIN_OP_AND_uxn_c_l192_c4_e027_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_b561_return_output;
     VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_cond := VAR_BIN_OP_EQ_uxn_c_l191_c12_4155_return_output;
     VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l193_DUPLICATE_ca2e_return_output;
     VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l193_DUPLICATE_ca2e_return_output;
     -- CONST_SL_8[uxn_c_l189_c22_ff1b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l189_c22_ff1b_x <= VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_return_output := CONST_SL_8_uxn_c_l189_c22_ff1b_return_output;

     -- BIN_OP_OR[uxn_c_l193_c4_4f01] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l193_c4_4f01_left <= VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_left;
     BIN_OP_OR_uxn_c_l193_c4_4f01_right <= VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_return_output := BIN_OP_OR_uxn_c_l193_c4_4f01_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue := VAR_BIN_OP_OR_uxn_c_l193_c4_4f01_return_output;
     VAR_BIN_OP_OR_uxn_c_l189_c4_1201_right := VAR_CONST_SL_8_uxn_c_l189_c22_ff1b_return_output;
     -- screen_vector_MUX[uxn_c_l191_c8_fa67] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l191_c8_fa67_cond <= VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_cond;
     screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue <= VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iftrue;
     screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse <= VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_return_output := screen_vector_MUX_uxn_c_l191_c8_fa67_return_output;

     -- BIN_OP_OR[uxn_c_l189_c4_1201] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l189_c4_1201_left <= VAR_BIN_OP_OR_uxn_c_l189_c4_1201_left;
     BIN_OP_OR_uxn_c_l189_c4_1201_right <= VAR_BIN_OP_OR_uxn_c_l189_c4_1201_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l189_c4_1201_return_output := BIN_OP_OR_uxn_c_l189_c4_1201_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue := VAR_BIN_OP_OR_uxn_c_l189_c4_1201_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse := VAR_screen_vector_MUX_uxn_c_l191_c8_fa67_return_output;
     -- screen_vector_MUX[uxn_c_l187_c3_1ffd] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l187_c3_1ffd_cond <= VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_cond;
     screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue <= VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iftrue;
     screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse <= VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output := screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iftrue := VAR_screen_vector_MUX_uxn_c_l187_c3_1ffd_return_output;
     -- screen_vector_MUX[uxn_c_l186_c2_b559] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c2_b559_cond <= VAR_screen_vector_MUX_uxn_c_l186_c2_b559_cond;
     screen_vector_MUX_uxn_c_l186_c2_b559_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iftrue;
     screen_vector_MUX_uxn_c_l186_c2_b559_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c2_b559_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c2_b559_return_output := screen_vector_MUX_uxn_c_l186_c2_b559_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l186_c2_b559_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l186_c2_b559_return_output;
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
