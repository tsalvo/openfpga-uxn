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
entity uxn_dei_0CLK_794db3df is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end uxn_dei_0CLK_794db3df;
architecture arch of uxn_dei_0CLK_794db3df is
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
-- BIN_OP_AND[uxn_device_h_l39_c6_3cf2]
signal BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c6_71bf]
signal BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_1f28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_621a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l42_c2_e375]
signal result_MUX_uxn_device_h_l42_c2_e375_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l42_c2_e375_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_e375_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_e375_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l43_c12_e235]
signal screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l43_c12_e235_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l43_c12_e235_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_644e]
signal BIN_OP_EQ_uxn_device_h_l45_c11_644e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_644e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_ead3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_5a41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l45_c7_621a]
signal result_MUX_uxn_device_h_l45_c7_621a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l45_c7_621a_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_621a_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_621a_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l46_c12_9828]
signal datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_9828_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_9828_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l49_c12_a602]
signal peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l49_c12_a602_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l49_c12_a602_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l39_c6_3cf2
BIN_OP_AND_uxn_device_h_l39_c6_3cf2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left,
BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right,
BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c6_71bf
BIN_OP_EQ_uxn_device_h_l42_c6_71bf : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left,
BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right,
BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output);

-- result_MUX_uxn_device_h_l42_c2_e375
result_MUX_uxn_device_h_l42_c2_e375 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l42_c2_e375_cond,
result_MUX_uxn_device_h_l42_c2_e375_iftrue,
result_MUX_uxn_device_h_l42_c2_e375_iffalse,
result_MUX_uxn_device_h_l42_c2_e375_return_output);

-- screen_dei_uxn_device_h_l43_c12_e235
screen_dei_uxn_device_h_l43_c12_e235 : entity work.screen_dei_0CLK_de264c78 port map (
clk,
screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE,
screen_dei_uxn_device_h_l43_c12_e235_addr,
screen_dei_uxn_device_h_l43_c12_e235_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_644e
BIN_OP_EQ_uxn_device_h_l45_c11_644e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_644e_left,
BIN_OP_EQ_uxn_device_h_l45_c11_644e_right,
BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output);

-- result_MUX_uxn_device_h_l45_c7_621a
result_MUX_uxn_device_h_l45_c7_621a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l45_c7_621a_cond,
result_MUX_uxn_device_h_l45_c7_621a_iftrue,
result_MUX_uxn_device_h_l45_c7_621a_iffalse,
result_MUX_uxn_device_h_l45_c7_621a_return_output);

-- datetime_dei_uxn_device_h_l46_c12_9828
datetime_dei_uxn_device_h_l46_c12_9828 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l46_c12_9828_addr,
datetime_dei_uxn_device_h_l46_c12_9828_return_output);

-- peek_dev_uxn_device_h_l49_c12_a602
peek_dev_uxn_device_h_l49_c12_a602 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE,
peek_dev_uxn_device_h_l49_c12_a602_address,
peek_dev_uxn_device_h_l49_c12_a602_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 d,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output,
 result_MUX_uxn_device_h_l42_c2_e375_return_output,
 screen_dei_uxn_device_h_l43_c12_e235_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output,
 result_MUX_uxn_device_h_l45_c7_621a_return_output,
 datetime_dei_uxn_device_h_l46_c12_9828_return_output,
 peek_dev_uxn_device_h_l49_c12_a602_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_e375_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_e375_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_621a_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_e375_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_e375_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_e235_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_e235_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_621a_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_621a_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_621a_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_9828_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_9828_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_a602_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_a602_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_right := to_unsigned(192, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l46_c12_9828_addr := VAR_addr;
     VAR_peek_dev_uxn_device_h_l49_c12_a602_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l43_c12_e235_addr := VAR_addr;
     -- BIN_OP_AND[uxn_device_h_l39_c6_3cf2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_left;
     BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output := BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output;
     REG_VAR_d := VAR_BIN_OP_AND_uxn_device_h_l39_c6_3cf2_return_output;
     -- BIN_OP_EQ[uxn_device_h_l45_c11_644e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_644e_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_644e_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c6_71bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_e375_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_71bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_621a_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_644e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_1f28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_621a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_621a_return_output;
     VAR_screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1f28_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_ead3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output;

     -- screen_dei[uxn_device_h_l43_c12_e235] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l43_c12_e235_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l43_c12_e235_addr <= VAR_screen_dei_uxn_device_h_l43_c12_e235_addr;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l43_c12_e235_return_output := screen_dei_uxn_device_h_l43_c12_e235_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_5a41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output;

     -- Submodule level 4
     VAR_peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_5a41_return_output;
     VAR_datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_ead3_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_e375_iftrue := VAR_screen_dei_uxn_device_h_l43_c12_e235_return_output;
     -- datetime_dei[uxn_device_h_l46_c12_9828] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l46_c12_9828_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l46_c12_9828_addr <= VAR_datetime_dei_uxn_device_h_l46_c12_9828_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l46_c12_9828_return_output := datetime_dei_uxn_device_h_l46_c12_9828_return_output;

     -- peek_dev[uxn_device_h_l49_c12_a602] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l49_c12_a602_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l49_c12_a602_address <= VAR_peek_dev_uxn_device_h_l49_c12_a602_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l49_c12_a602_return_output := peek_dev_uxn_device_h_l49_c12_a602_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l45_c7_621a_iftrue := VAR_datetime_dei_uxn_device_h_l46_c12_9828_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_621a_iffalse := VAR_peek_dev_uxn_device_h_l49_c12_a602_return_output;
     -- result_MUX[uxn_device_h_l45_c7_621a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l45_c7_621a_cond <= VAR_result_MUX_uxn_device_h_l45_c7_621a_cond;
     result_MUX_uxn_device_h_l45_c7_621a_iftrue <= VAR_result_MUX_uxn_device_h_l45_c7_621a_iftrue;
     result_MUX_uxn_device_h_l45_c7_621a_iffalse <= VAR_result_MUX_uxn_device_h_l45_c7_621a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l45_c7_621a_return_output := result_MUX_uxn_device_h_l45_c7_621a_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l42_c2_e375_iffalse := VAR_result_MUX_uxn_device_h_l45_c7_621a_return_output;
     -- result_MUX[uxn_device_h_l42_c2_e375] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l42_c2_e375_cond <= VAR_result_MUX_uxn_device_h_l42_c2_e375_cond;
     result_MUX_uxn_device_h_l42_c2_e375_iftrue <= VAR_result_MUX_uxn_device_h_l42_c2_e375_iftrue;
     result_MUX_uxn_device_h_l42_c2_e375_iffalse <= VAR_result_MUX_uxn_device_h_l42_c2_e375_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l42_c2_e375_return_output := result_MUX_uxn_device_h_l42_c2_e375_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l42_c2_e375_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l42_c2_e375_return_output;
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
