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
-- BIN_OP_AND[uxn_device_h_l39_c6_32e4]
signal BIN_OP_AND_uxn_device_h_l39_c6_32e4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_32e4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c6_88ac]
signal BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_1255]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_5f9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l42_c2_4cbd]
signal result_MUX_uxn_device_h_l42_c2_4cbd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l42_c2_4cbd_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_4cbd_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_4cbd_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l43_c12_cf18]
signal screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l43_c12_cf18_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l43_c12_cf18_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_bcd0]
signal BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_c4a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_d819]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l45_c7_5f9b]
signal result_MUX_uxn_device_h_l45_c7_5f9b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l45_c7_5f9b_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_5f9b_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_5f9b_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l46_c12_1b35]
signal datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_1b35_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_1b35_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l49_c12_eabd]
signal peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l49_c12_eabd_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l49_c12_eabd_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l39_c6_32e4
BIN_OP_AND_uxn_device_h_l39_c6_32e4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l39_c6_32e4_left,
BIN_OP_AND_uxn_device_h_l39_c6_32e4_right,
BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c6_88ac
BIN_OP_EQ_uxn_device_h_l42_c6_88ac : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left,
BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right,
BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output);

-- result_MUX_uxn_device_h_l42_c2_4cbd
result_MUX_uxn_device_h_l42_c2_4cbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l42_c2_4cbd_cond,
result_MUX_uxn_device_h_l42_c2_4cbd_iftrue,
result_MUX_uxn_device_h_l42_c2_4cbd_iffalse,
result_MUX_uxn_device_h_l42_c2_4cbd_return_output);

-- screen_dei_uxn_device_h_l43_c12_cf18
screen_dei_uxn_device_h_l43_c12_cf18 : entity work.screen_dei_0CLK_de264c78 port map (
clk,
screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE,
screen_dei_uxn_device_h_l43_c12_cf18_addr,
screen_dei_uxn_device_h_l43_c12_cf18_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_bcd0
BIN_OP_EQ_uxn_device_h_l45_c11_bcd0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left,
BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right,
BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output);

-- result_MUX_uxn_device_h_l45_c7_5f9b
result_MUX_uxn_device_h_l45_c7_5f9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l45_c7_5f9b_cond,
result_MUX_uxn_device_h_l45_c7_5f9b_iftrue,
result_MUX_uxn_device_h_l45_c7_5f9b_iffalse,
result_MUX_uxn_device_h_l45_c7_5f9b_return_output);

-- datetime_dei_uxn_device_h_l46_c12_1b35
datetime_dei_uxn_device_h_l46_c12_1b35 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l46_c12_1b35_addr,
datetime_dei_uxn_device_h_l46_c12_1b35_return_output);

-- peek_dev_uxn_device_h_l49_c12_eabd
peek_dev_uxn_device_h_l49_c12_eabd : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE,
peek_dev_uxn_device_h_l49_c12_eabd_address,
peek_dev_uxn_device_h_l49_c12_eabd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 d,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output,
 result_MUX_uxn_device_h_l42_c2_4cbd_return_output,
 screen_dei_uxn_device_h_l43_c12_cf18_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output,
 result_MUX_uxn_device_h_l45_c7_5f9b_return_output,
 datetime_dei_uxn_device_h_l46_c12_1b35_return_output,
 peek_dev_uxn_device_h_l49_c12_eabd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_5f9b_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_4cbd_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_4cbd_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_cf18_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_cf18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_5f9b_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_1b35_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_1b35_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_eabd_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_eabd_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right := to_unsigned(192, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l46_c12_1b35_addr := VAR_addr;
     VAR_peek_dev_uxn_device_h_l49_c12_eabd_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l43_c12_cf18_addr := VAR_addr;
     -- BIN_OP_AND[uxn_device_h_l39_c6_32e4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l39_c6_32e4_left <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_left;
     BIN_OP_AND_uxn_device_h_l39_c6_32e4_right <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output := BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output;
     REG_VAR_d := VAR_BIN_OP_AND_uxn_device_h_l39_c6_32e4_return_output;
     -- BIN_OP_EQ[uxn_device_h_l45_c11_bcd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c6_88ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_4cbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_88ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_5f9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_bcd0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_5f9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_1255] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_5f9b_return_output;
     VAR_screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_1255_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_c4a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_d819] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output;

     -- screen_dei[uxn_device_h_l43_c12_cf18] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l43_c12_cf18_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l43_c12_cf18_addr <= VAR_screen_dei_uxn_device_h_l43_c12_cf18_addr;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l43_c12_cf18_return_output := screen_dei_uxn_device_h_l43_c12_cf18_return_output;

     -- Submodule level 4
     VAR_peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_d819_return_output;
     VAR_datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_c4a1_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iftrue := VAR_screen_dei_uxn_device_h_l43_c12_cf18_return_output;
     -- datetime_dei[uxn_device_h_l46_c12_1b35] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l46_c12_1b35_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l46_c12_1b35_addr <= VAR_datetime_dei_uxn_device_h_l46_c12_1b35_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l46_c12_1b35_return_output := datetime_dei_uxn_device_h_l46_c12_1b35_return_output;

     -- peek_dev[uxn_device_h_l49_c12_eabd] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l49_c12_eabd_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l49_c12_eabd_address <= VAR_peek_dev_uxn_device_h_l49_c12_eabd_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l49_c12_eabd_return_output := peek_dev_uxn_device_h_l49_c12_eabd_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iftrue := VAR_datetime_dei_uxn_device_h_l46_c12_1b35_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iffalse := VAR_peek_dev_uxn_device_h_l49_c12_eabd_return_output;
     -- result_MUX[uxn_device_h_l45_c7_5f9b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l45_c7_5f9b_cond <= VAR_result_MUX_uxn_device_h_l45_c7_5f9b_cond;
     result_MUX_uxn_device_h_l45_c7_5f9b_iftrue <= VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iftrue;
     result_MUX_uxn_device_h_l45_c7_5f9b_iffalse <= VAR_result_MUX_uxn_device_h_l45_c7_5f9b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l45_c7_5f9b_return_output := result_MUX_uxn_device_h_l45_c7_5f9b_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iffalse := VAR_result_MUX_uxn_device_h_l45_c7_5f9b_return_output;
     -- result_MUX[uxn_device_h_l42_c2_4cbd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l42_c2_4cbd_cond <= VAR_result_MUX_uxn_device_h_l42_c2_4cbd_cond;
     result_MUX_uxn_device_h_l42_c2_4cbd_iftrue <= VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iftrue;
     result_MUX_uxn_device_h_l42_c2_4cbd_iffalse <= VAR_result_MUX_uxn_device_h_l42_c2_4cbd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l42_c2_4cbd_return_output := result_MUX_uxn_device_h_l42_c2_4cbd_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l42_c2_4cbd_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l42_c2_4cbd_return_output;
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
