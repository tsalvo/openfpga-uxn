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
-- screen_vector_MUX[uxn_c_l189_c2_d10a]
signal screen_vector_MUX_uxn_c_l189_c2_d10a_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l189_c2_d10a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l190_c7_0fc7]
signal BIN_OP_EQ_uxn_c_l190_c7_0fc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c7_0fc7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l190_c3_08ed]
signal screen_vector_MUX_uxn_c_l190_c3_08ed_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l190_c3_08ed_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l191_c4_f43b]
signal BIN_OP_AND_uxn_c_l191_c4_f43b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_f43b_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l191_c4_f43b_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l192_c22_77ad]
signal CONST_SL_8_uxn_c_l192_c22_77ad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l192_c22_77ad_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l192_c4_2f77]
signal BIN_OP_OR_uxn_c_l192_c4_2f77_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_2f77_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l192_c4_2f77_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l194_c12_b8df]
signal BIN_OP_EQ_uxn_c_l194_c12_b8df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c12_b8df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l194_c8_076b]
signal screen_vector_MUX_uxn_c_l194_c8_076b_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_076b_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_076b_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l194_c8_076b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l195_c4_d844]
signal BIN_OP_AND_uxn_c_l195_c4_d844_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l195_c4_d844_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l195_c4_d844_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l196_c4_ee11]
signal BIN_OP_OR_uxn_c_l196_c4_ee11_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l196_c4_ee11_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l196_c4_ee11_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l189_c2_d10a
screen_vector_MUX_uxn_c_l189_c2_d10a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l189_c2_d10a_cond,
screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue,
screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse,
screen_vector_MUX_uxn_c_l189_c2_d10a_return_output);

-- BIN_OP_EQ_uxn_c_l190_c7_0fc7
BIN_OP_EQ_uxn_c_l190_c7_0fc7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l190_c7_0fc7_left,
BIN_OP_EQ_uxn_c_l190_c7_0fc7_right,
BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output);

-- screen_vector_MUX_uxn_c_l190_c3_08ed
screen_vector_MUX_uxn_c_l190_c3_08ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l190_c3_08ed_cond,
screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue,
screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse,
screen_vector_MUX_uxn_c_l190_c3_08ed_return_output);

-- BIN_OP_AND_uxn_c_l191_c4_f43b
BIN_OP_AND_uxn_c_l191_c4_f43b : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l191_c4_f43b_left,
BIN_OP_AND_uxn_c_l191_c4_f43b_right,
BIN_OP_AND_uxn_c_l191_c4_f43b_return_output);

-- CONST_SL_8_uxn_c_l192_c22_77ad
CONST_SL_8_uxn_c_l192_c22_77ad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l192_c22_77ad_x,
CONST_SL_8_uxn_c_l192_c22_77ad_return_output);

-- BIN_OP_OR_uxn_c_l192_c4_2f77
BIN_OP_OR_uxn_c_l192_c4_2f77 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l192_c4_2f77_left,
BIN_OP_OR_uxn_c_l192_c4_2f77_right,
BIN_OP_OR_uxn_c_l192_c4_2f77_return_output);

-- BIN_OP_EQ_uxn_c_l194_c12_b8df
BIN_OP_EQ_uxn_c_l194_c12_b8df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l194_c12_b8df_left,
BIN_OP_EQ_uxn_c_l194_c12_b8df_right,
BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output);

-- screen_vector_MUX_uxn_c_l194_c8_076b
screen_vector_MUX_uxn_c_l194_c8_076b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l194_c8_076b_cond,
screen_vector_MUX_uxn_c_l194_c8_076b_iftrue,
screen_vector_MUX_uxn_c_l194_c8_076b_iffalse,
screen_vector_MUX_uxn_c_l194_c8_076b_return_output);

-- BIN_OP_AND_uxn_c_l195_c4_d844
BIN_OP_AND_uxn_c_l195_c4_d844 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l195_c4_d844_left,
BIN_OP_AND_uxn_c_l195_c4_d844_right,
BIN_OP_AND_uxn_c_l195_c4_d844_return_output);

-- BIN_OP_OR_uxn_c_l196_c4_ee11
BIN_OP_OR_uxn_c_l196_c4_ee11 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l196_c4_ee11_left,
BIN_OP_OR_uxn_c_l196_c4_ee11_right,
BIN_OP_OR_uxn_c_l196_c4_ee11_return_output);



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
 screen_vector_MUX_uxn_c_l189_c2_d10a_return_output,
 BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output,
 screen_vector_MUX_uxn_c_l190_c3_08ed_return_output,
 BIN_OP_AND_uxn_c_l191_c4_f43b_return_output,
 CONST_SL_8_uxn_c_l192_c22_77ad_return_output,
 BIN_OP_OR_uxn_c_l192_c4_2f77_return_output,
 BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output,
 screen_vector_MUX_uxn_c_l194_c8_076b_return_output,
 BIN_OP_AND_uxn_c_l195_c4_d844_return_output,
 BIN_OP_OR_uxn_c_l196_c4_ee11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_076b_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l192_c22_77ad_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l192_c22_77ad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l194_c8_076b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_d844_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_d844_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l195_c4_d844_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_92ce_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_right := to_unsigned(255, 16);
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_c_l195_c4_d844_right := to_unsigned(65280, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l195_c4_d844_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iffalse := screen_vector;
     -- BIN_OP_EQ[uxn_c_l190_c7_0fc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l190_c7_0fc7_left <= VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_left;
     BIN_OP_EQ_uxn_c_l190_c7_0fc7_right <= VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output := BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output;

     -- BIN_OP_EQ[uxn_c_l194_c12_b8df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l194_c12_b8df_left <= VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_left;
     BIN_OP_EQ_uxn_c_l194_c12_b8df_right <= VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output := BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output;

     -- BIN_OP_AND[uxn_c_l195_c4_d844] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l195_c4_d844_left <= VAR_BIN_OP_AND_uxn_c_l195_c4_d844_left;
     BIN_OP_AND_uxn_c_l195_c4_d844_right <= VAR_BIN_OP_AND_uxn_c_l195_c4_d844_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l195_c4_d844_return_output := BIN_OP_AND_uxn_c_l195_c4_d844_return_output;

     -- BIN_OP_AND[uxn_c_l191_c4_f43b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l191_c4_f43b_left <= VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_left;
     BIN_OP_AND_uxn_c_l191_c4_f43b_right <= VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_return_output := BIN_OP_AND_uxn_c_l191_c4_f43b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_92ce LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_92ce_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_left := VAR_BIN_OP_AND_uxn_c_l191_c4_f43b_return_output;
     VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_left := VAR_BIN_OP_AND_uxn_c_l195_c4_d844_return_output;
     VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_cond := VAR_BIN_OP_EQ_uxn_c_l190_c7_0fc7_return_output;
     VAR_screen_vector_MUX_uxn_c_l194_c8_076b_cond := VAR_BIN_OP_EQ_uxn_c_l194_c12_b8df_return_output;
     VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_92ce_return_output;
     VAR_CONST_SL_8_uxn_c_l192_c22_77ad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l192_l196_DUPLICATE_92ce_return_output;
     -- CONST_SL_8[uxn_c_l192_c22_77ad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l192_c22_77ad_x <= VAR_CONST_SL_8_uxn_c_l192_c22_77ad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l192_c22_77ad_return_output := CONST_SL_8_uxn_c_l192_c22_77ad_return_output;

     -- BIN_OP_OR[uxn_c_l196_c4_ee11] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l196_c4_ee11_left <= VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_left;
     BIN_OP_OR_uxn_c_l196_c4_ee11_right <= VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_return_output := BIN_OP_OR_uxn_c_l196_c4_ee11_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iftrue := VAR_BIN_OP_OR_uxn_c_l196_c4_ee11_return_output;
     VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_right := VAR_CONST_SL_8_uxn_c_l192_c22_77ad_return_output;
     -- screen_vector_MUX[uxn_c_l194_c8_076b] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l194_c8_076b_cond <= VAR_screen_vector_MUX_uxn_c_l194_c8_076b_cond;
     screen_vector_MUX_uxn_c_l194_c8_076b_iftrue <= VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iftrue;
     screen_vector_MUX_uxn_c_l194_c8_076b_iffalse <= VAR_screen_vector_MUX_uxn_c_l194_c8_076b_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l194_c8_076b_return_output := screen_vector_MUX_uxn_c_l194_c8_076b_return_output;

     -- BIN_OP_OR[uxn_c_l192_c4_2f77] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l192_c4_2f77_left <= VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_left;
     BIN_OP_OR_uxn_c_l192_c4_2f77_right <= VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_return_output := BIN_OP_OR_uxn_c_l192_c4_2f77_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue := VAR_BIN_OP_OR_uxn_c_l192_c4_2f77_return_output;
     VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse := VAR_screen_vector_MUX_uxn_c_l194_c8_076b_return_output;
     -- screen_vector_MUX[uxn_c_l190_c3_08ed] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l190_c3_08ed_cond <= VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_cond;
     screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue <= VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iftrue;
     screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse <= VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_return_output := screen_vector_MUX_uxn_c_l190_c3_08ed_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue := VAR_screen_vector_MUX_uxn_c_l190_c3_08ed_return_output;
     -- screen_vector_MUX[uxn_c_l189_c2_d10a] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l189_c2_d10a_cond <= VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_cond;
     screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue <= VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iftrue;
     screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse <= VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_return_output := screen_vector_MUX_uxn_c_l189_c2_d10a_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l189_c2_d10a_return_output;
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
