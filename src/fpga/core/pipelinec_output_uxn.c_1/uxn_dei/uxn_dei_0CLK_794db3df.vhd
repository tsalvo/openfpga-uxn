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
-- BIN_OP_AND[uxn_device_h_l39_c6_bbb7]
signal BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c6_f105]
signal BIN_OP_EQ_uxn_device_h_l42_c6_f105_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_f105_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_895f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_918e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l42_c2_61d9]
signal result_MUX_uxn_device_h_l42_c2_61d9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l42_c2_61d9_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_61d9_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_61d9_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l43_c12_2536]
signal screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l43_c12_2536_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l43_c12_2536_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_0a56]
signal BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_fbd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_9476]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l45_c7_918e]
signal result_MUX_uxn_device_h_l45_c7_918e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l45_c7_918e_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_918e_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_918e_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l46_c12_afd0]
signal datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_afd0_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_afd0_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l49_c12_75fa]
signal peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l49_c12_75fa_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l49_c12_75fa_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l39_c6_bbb7
BIN_OP_AND_uxn_device_h_l39_c6_bbb7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left,
BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right,
BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c6_f105
BIN_OP_EQ_uxn_device_h_l42_c6_f105 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_f105_left,
BIN_OP_EQ_uxn_device_h_l42_c6_f105_right,
BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output);

-- result_MUX_uxn_device_h_l42_c2_61d9
result_MUX_uxn_device_h_l42_c2_61d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l42_c2_61d9_cond,
result_MUX_uxn_device_h_l42_c2_61d9_iftrue,
result_MUX_uxn_device_h_l42_c2_61d9_iffalse,
result_MUX_uxn_device_h_l42_c2_61d9_return_output);

-- screen_dei_uxn_device_h_l43_c12_2536
screen_dei_uxn_device_h_l43_c12_2536 : entity work.screen_dei_0CLK_de264c78 port map (
clk,
screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE,
screen_dei_uxn_device_h_l43_c12_2536_addr,
screen_dei_uxn_device_h_l43_c12_2536_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_0a56
BIN_OP_EQ_uxn_device_h_l45_c11_0a56 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left,
BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right,
BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output);

-- result_MUX_uxn_device_h_l45_c7_918e
result_MUX_uxn_device_h_l45_c7_918e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l45_c7_918e_cond,
result_MUX_uxn_device_h_l45_c7_918e_iftrue,
result_MUX_uxn_device_h_l45_c7_918e_iffalse,
result_MUX_uxn_device_h_l45_c7_918e_return_output);

-- datetime_dei_uxn_device_h_l46_c12_afd0
datetime_dei_uxn_device_h_l46_c12_afd0 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l46_c12_afd0_addr,
datetime_dei_uxn_device_h_l46_c12_afd0_return_output);

-- peek_dev_uxn_device_h_l49_c12_75fa
peek_dev_uxn_device_h_l49_c12_75fa : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE,
peek_dev_uxn_device_h_l49_c12_75fa_address,
peek_dev_uxn_device_h_l49_c12_75fa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 d,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output,
 result_MUX_uxn_device_h_l42_c2_61d9_return_output,
 screen_dei_uxn_device_h_l43_c12_2536_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output,
 result_MUX_uxn_device_h_l45_c7_918e_return_output,
 datetime_dei_uxn_device_h_l46_c12_afd0_return_output,
 peek_dev_uxn_device_h_l49_c12_75fa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_61d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_61d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_918e_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_61d9_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_61d9_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2536_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2536_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_918e_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_918e_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_918e_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_afd0_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_afd0_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_75fa_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l49_c12_75fa_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_right := to_unsigned(32, 6);
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l46_c12_afd0_addr := VAR_addr;
     VAR_peek_dev_uxn_device_h_l49_c12_75fa_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l43_c12_2536_addr := VAR_addr;
     -- BIN_OP_AND[uxn_device_h_l39_c6_bbb7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_left;
     BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output := BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output;
     REG_VAR_d := VAR_BIN_OP_AND_uxn_device_h_l39_c6_bbb7_return_output;
     -- BIN_OP_EQ[uxn_device_h_l45_c11_0a56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output;

     -- BIN_OP_EQ[uxn_device_h_l42_c6_f105] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_f105_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_f105_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_61d9_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_f105_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_918e_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_0a56_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_918e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_895f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_918e_return_output;
     VAR_screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_895f_return_output;
     -- screen_dei[uxn_device_h_l43_c12_2536] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l43_c12_2536_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l43_c12_2536_addr <= VAR_screen_dei_uxn_device_h_l43_c12_2536_addr;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l43_c12_2536_return_output := screen_dei_uxn_device_h_l43_c12_2536_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_fbd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_9476] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output;

     -- Submodule level 4
     VAR_peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9476_return_output;
     VAR_datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_fbd4_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_61d9_iftrue := VAR_screen_dei_uxn_device_h_l43_c12_2536_return_output;
     -- datetime_dei[uxn_device_h_l46_c12_afd0] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l46_c12_afd0_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l46_c12_afd0_addr <= VAR_datetime_dei_uxn_device_h_l46_c12_afd0_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l46_c12_afd0_return_output := datetime_dei_uxn_device_h_l46_c12_afd0_return_output;

     -- peek_dev[uxn_device_h_l49_c12_75fa] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l49_c12_75fa_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l49_c12_75fa_address <= VAR_peek_dev_uxn_device_h_l49_c12_75fa_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l49_c12_75fa_return_output := peek_dev_uxn_device_h_l49_c12_75fa_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l45_c7_918e_iftrue := VAR_datetime_dei_uxn_device_h_l46_c12_afd0_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_918e_iffalse := VAR_peek_dev_uxn_device_h_l49_c12_75fa_return_output;
     -- result_MUX[uxn_device_h_l45_c7_918e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l45_c7_918e_cond <= VAR_result_MUX_uxn_device_h_l45_c7_918e_cond;
     result_MUX_uxn_device_h_l45_c7_918e_iftrue <= VAR_result_MUX_uxn_device_h_l45_c7_918e_iftrue;
     result_MUX_uxn_device_h_l45_c7_918e_iffalse <= VAR_result_MUX_uxn_device_h_l45_c7_918e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l45_c7_918e_return_output := result_MUX_uxn_device_h_l45_c7_918e_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l42_c2_61d9_iffalse := VAR_result_MUX_uxn_device_h_l45_c7_918e_return_output;
     -- result_MUX[uxn_device_h_l42_c2_61d9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l42_c2_61d9_cond <= VAR_result_MUX_uxn_device_h_l42_c2_61d9_cond;
     result_MUX_uxn_device_h_l42_c2_61d9_iftrue <= VAR_result_MUX_uxn_device_h_l42_c2_61d9_iftrue;
     result_MUX_uxn_device_h_l42_c2_61d9_iffalse <= VAR_result_MUX_uxn_device_h_l42_c2_61d9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l42_c2_61d9_return_output := result_MUX_uxn_device_h_l42_c2_61d9_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l42_c2_61d9_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l42_c2_61d9_return_output;
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
