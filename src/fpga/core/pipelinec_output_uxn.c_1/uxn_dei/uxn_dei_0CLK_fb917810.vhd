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
-- Submodules: 12
entity uxn_dei_0CLK_fb917810 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_dei_0CLK_fb917810;
architecture arch of uxn_dei_0CLK_fb917810 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal d : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_d : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(7 downto 0);

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l37_c6_36c1]
signal BIN_OP_AND_uxn_device_h_l37_c6_36c1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l37_c6_36c1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l40_c6_1757]
signal BIN_OP_EQ_uxn_device_h_l40_c6_1757_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_1757_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l40_c1_3c61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l43_c7_e471]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l40_c2_51d9]
signal result_MUX_uxn_device_h_l40_c2_51d9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l40_c2_51d9_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l40_c2_51d9_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l40_c2_51d9_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l41_c12_bc93]
signal screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l41_c12_bc93_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l41_c12_bc93_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l43_c11_4bc0]
signal BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l43_c1_06a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l46_c1_1ea5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l43_c7_e471]
signal result_MUX_uxn_device_h_l43_c7_e471_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l43_c7_e471_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l43_c7_e471_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l43_c7_e471_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l44_c12_d3c8]
signal datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l44_c12_d3c8_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l44_c12_d3c8_return_output : unsigned(7 downto 0);

-- device_ram_read[uxn_device_h_l47_c12_17d5]
signal device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l47_c12_17d5_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l47_c12_17d5_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l37_c6_36c1
BIN_OP_AND_uxn_device_h_l37_c6_36c1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l37_c6_36c1_left,
BIN_OP_AND_uxn_device_h_l37_c6_36c1_right,
BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output);

-- BIN_OP_EQ_uxn_device_h_l40_c6_1757
BIN_OP_EQ_uxn_device_h_l40_c6_1757 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l40_c6_1757_left,
BIN_OP_EQ_uxn_device_h_l40_c6_1757_right,
BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output);

-- result_MUX_uxn_device_h_l40_c2_51d9
result_MUX_uxn_device_h_l40_c2_51d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l40_c2_51d9_cond,
result_MUX_uxn_device_h_l40_c2_51d9_iftrue,
result_MUX_uxn_device_h_l40_c2_51d9_iffalse,
result_MUX_uxn_device_h_l40_c2_51d9_return_output);

-- screen_dei_uxn_device_h_l41_c12_bc93
screen_dei_uxn_device_h_l41_c12_bc93 : entity work.screen_dei_0CLK_de264c78 port map (
clk,
screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE,
screen_dei_uxn_device_h_l41_c12_bc93_addr,
screen_dei_uxn_device_h_l41_c12_bc93_return_output);

-- BIN_OP_EQ_uxn_device_h_l43_c11_4bc0
BIN_OP_EQ_uxn_device_h_l43_c11_4bc0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left,
BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right,
BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output);

-- result_MUX_uxn_device_h_l43_c7_e471
result_MUX_uxn_device_h_l43_c7_e471 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l43_c7_e471_cond,
result_MUX_uxn_device_h_l43_c7_e471_iftrue,
result_MUX_uxn_device_h_l43_c7_e471_iffalse,
result_MUX_uxn_device_h_l43_c7_e471_return_output);

-- datetime_dei_uxn_device_h_l44_c12_d3c8
datetime_dei_uxn_device_h_l44_c12_d3c8 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l44_c12_d3c8_addr,
datetime_dei_uxn_device_h_l44_c12_d3c8_return_output);

-- device_ram_read_uxn_device_h_l47_c12_17d5
device_ram_read_uxn_device_h_l47_c12_17d5 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l47_c12_17d5_address,
device_ram_read_uxn_device_h_l47_c12_17d5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 d,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output,
 BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output,
 result_MUX_uxn_device_h_l40_c2_51d9_return_output,
 screen_dei_uxn_device_h_l41_c12_bc93_return_output,
 BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output,
 result_MUX_uxn_device_h_l43_c7_e471_return_output,
 datetime_dei_uxn_device_h_l44_c12_d3c8_return_output,
 device_ram_read_uxn_device_h_l47_c12_17d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_51d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_51d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l43_c7_e471_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_51d9_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_51d9_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l41_c12_bc93_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l41_c12_bc93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l43_c7_e471_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l43_c7_e471_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l43_c7_e471_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l47_c12_17d5_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l47_c12_17d5_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_d : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_d := d;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right := to_unsigned(192, 8);
     VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_addr := VAR_addr;
     VAR_device_ram_read_uxn_device_h_l47_c12_17d5_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l41_c12_bc93_addr := VAR_addr;
     -- BIN_OP_AND[uxn_device_h_l37_c6_36c1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l37_c6_36c1_left <= VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_left;
     BIN_OP_AND_uxn_device_h_l37_c6_36c1_right <= VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output := BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_left := VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left := VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output;
     REG_VAR_d := VAR_BIN_OP_AND_uxn_device_h_l37_c6_36c1_return_output;
     -- BIN_OP_EQ[uxn_device_h_l40_c6_1757] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l40_c6_1757_left <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_left;
     BIN_OP_EQ_uxn_device_h_l40_c6_1757_right <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output := BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output;

     -- BIN_OP_EQ[uxn_device_h_l43_c11_4bc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left <= VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_left;
     BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right <= VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output := BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_51d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_1757_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output;
     VAR_result_MUX_uxn_device_h_l43_c7_e471_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c11_4bc0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l40_c1_3c61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l43_c7_e471] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c7_e471_return_output;
     VAR_screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l40_c1_3c61_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l43_c1_06a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output;

     -- screen_dei[uxn_device_h_l41_c12_bc93] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l41_c12_bc93_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l41_c12_bc93_addr <= VAR_screen_dei_uxn_device_h_l41_c12_bc93_addr;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l41_c12_bc93_return_output := screen_dei_uxn_device_h_l41_c12_bc93_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l46_c1_1ea5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output;

     -- Submodule level 4
     VAR_device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l46_c1_1ea5_return_output;
     VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l43_c1_06a2_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_51d9_iftrue := VAR_screen_dei_uxn_device_h_l41_c12_bc93_return_output;
     -- datetime_dei[uxn_device_h_l44_c12_d3c8] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l44_c12_d3c8_addr <= VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_return_output := datetime_dei_uxn_device_h_l44_c12_d3c8_return_output;

     -- device_ram_read[uxn_device_h_l47_c12_17d5] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l47_c12_17d5_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l47_c12_17d5_address <= VAR_device_ram_read_uxn_device_h_l47_c12_17d5_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l47_c12_17d5_return_output := device_ram_read_uxn_device_h_l47_c12_17d5_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l43_c7_e471_iftrue := VAR_datetime_dei_uxn_device_h_l44_c12_d3c8_return_output;
     VAR_result_MUX_uxn_device_h_l43_c7_e471_iffalse := VAR_device_ram_read_uxn_device_h_l47_c12_17d5_return_output;
     -- result_MUX[uxn_device_h_l43_c7_e471] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l43_c7_e471_cond <= VAR_result_MUX_uxn_device_h_l43_c7_e471_cond;
     result_MUX_uxn_device_h_l43_c7_e471_iftrue <= VAR_result_MUX_uxn_device_h_l43_c7_e471_iftrue;
     result_MUX_uxn_device_h_l43_c7_e471_iffalse <= VAR_result_MUX_uxn_device_h_l43_c7_e471_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l43_c7_e471_return_output := result_MUX_uxn_device_h_l43_c7_e471_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l40_c2_51d9_iffalse := VAR_result_MUX_uxn_device_h_l43_c7_e471_return_output;
     -- result_MUX[uxn_device_h_l40_c2_51d9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l40_c2_51d9_cond <= VAR_result_MUX_uxn_device_h_l40_c2_51d9_cond;
     result_MUX_uxn_device_h_l40_c2_51d9_iftrue <= VAR_result_MUX_uxn_device_h_l40_c2_51d9_iftrue;
     result_MUX_uxn_device_h_l40_c2_51d9_iffalse <= VAR_result_MUX_uxn_device_h_l40_c2_51d9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l40_c2_51d9_return_output := result_MUX_uxn_device_h_l40_c2_51d9_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l40_c2_51d9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l40_c2_51d9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_d <= REG_VAR_d;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     d <= REG_COMB_d;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
