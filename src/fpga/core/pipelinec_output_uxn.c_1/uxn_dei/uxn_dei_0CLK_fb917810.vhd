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
-- BIN_OP_AND[uxn_device_h_l39_c6_5d73]
signal BIN_OP_AND_uxn_device_h_l39_c6_5d73_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_5d73_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c6_fc3f]
signal BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_f5fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_4b87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l42_c2_34d5]
signal result_MUX_uxn_device_h_l42_c2_34d5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l42_c2_34d5_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_34d5_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l42_c2_34d5_return_output : unsigned(7 downto 0);

-- screen_dei[uxn_device_h_l43_c12_2384]
signal screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l43_c12_2384_addr : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l43_c12_2384_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_53ad]
signal BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_1625]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_9fc7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l45_c7_4b87]
signal result_MUX_uxn_device_h_l45_c7_4b87_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l45_c7_4b87_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_4b87_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l45_c7_4b87_return_output : unsigned(7 downto 0);

-- datetime_dei[uxn_device_h_l46_c12_cf71]
signal datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_cf71_addr : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l46_c12_cf71_return_output : unsigned(7 downto 0);

-- device_ram_read[uxn_device_h_l49_c12_6f3f]
signal device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l49_c12_6f3f_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l49_c12_6f3f_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l39_c6_5d73
BIN_OP_AND_uxn_device_h_l39_c6_5d73 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l39_c6_5d73_left,
BIN_OP_AND_uxn_device_h_l39_c6_5d73_right,
BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c6_fc3f
BIN_OP_EQ_uxn_device_h_l42_c6_fc3f : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left,
BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right,
BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output);

-- result_MUX_uxn_device_h_l42_c2_34d5
result_MUX_uxn_device_h_l42_c2_34d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l42_c2_34d5_cond,
result_MUX_uxn_device_h_l42_c2_34d5_iftrue,
result_MUX_uxn_device_h_l42_c2_34d5_iffalse,
result_MUX_uxn_device_h_l42_c2_34d5_return_output);

-- screen_dei_uxn_device_h_l43_c12_2384
screen_dei_uxn_device_h_l43_c12_2384 : entity work.screen_dei_0CLK_de264c78 port map (
clk,
screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE,
screen_dei_uxn_device_h_l43_c12_2384_addr,
screen_dei_uxn_device_h_l43_c12_2384_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_53ad
BIN_OP_EQ_uxn_device_h_l45_c11_53ad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left,
BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right,
BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output);

-- result_MUX_uxn_device_h_l45_c7_4b87
result_MUX_uxn_device_h_l45_c7_4b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l45_c7_4b87_cond,
result_MUX_uxn_device_h_l45_c7_4b87_iftrue,
result_MUX_uxn_device_h_l45_c7_4b87_iffalse,
result_MUX_uxn_device_h_l45_c7_4b87_return_output);

-- datetime_dei_uxn_device_h_l46_c12_cf71
datetime_dei_uxn_device_h_l46_c12_cf71 : entity work.datetime_dei_0CLK_de264c78 port map (
clk,
datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l46_c12_cf71_addr,
datetime_dei_uxn_device_h_l46_c12_cf71_return_output);

-- device_ram_read_uxn_device_h_l49_c12_6f3f
device_ram_read_uxn_device_h_l49_c12_6f3f : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l49_c12_6f3f_address,
device_ram_read_uxn_device_h_l49_c12_6f3f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 -- Registers
 d,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output,
 result_MUX_uxn_device_h_l42_c2_34d5_return_output,
 screen_dei_uxn_device_h_l43_c12_2384_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output,
 result_MUX_uxn_device_h_l45_c7_4b87_return_output,
 datetime_dei_uxn_device_h_l46_c12_cf71_return_output,
 device_ram_read_uxn_device_h_l49_c12_6f3f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_34d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_34d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_4b87_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_34d5_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l42_c2_34d5_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2384_addr : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l43_c12_2384_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_4b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_4b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l45_c7_4b87_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_cf71_addr : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l46_c12_cf71_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_left := VAR_addr;
     VAR_datetime_dei_uxn_device_h_l46_c12_cf71_addr := VAR_addr;
     VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_address := VAR_addr;
     VAR_screen_dei_uxn_device_h_l43_c12_2384_addr := VAR_addr;
     -- BIN_OP_AND[uxn_device_h_l39_c6_5d73] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l39_c6_5d73_left <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_left;
     BIN_OP_AND_uxn_device_h_l39_c6_5d73_right <= VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output := BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left := VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output;
     REG_VAR_d := VAR_BIN_OP_AND_uxn_device_h_l39_c6_5d73_return_output;
     -- BIN_OP_EQ[uxn_device_h_l42_c6_fc3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_left;
     BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output := BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_53ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_34d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c6_fc3f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_4b87_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_53ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l42_c1_f5fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_4b87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_4b87_return_output;
     VAR_screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l42_c1_f5fd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c1_1625] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l48_c1_9fc7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output;

     -- screen_dei[uxn_device_h_l43_c12_2384] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l43_c12_2384_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l43_c12_2384_addr <= VAR_screen_dei_uxn_device_h_l43_c12_2384_addr;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l43_c12_2384_return_output := screen_dei_uxn_device_h_l43_c12_2384_return_output;

     -- Submodule level 4
     VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l48_c1_9fc7_return_output;
     VAR_datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c1_1625_return_output;
     VAR_result_MUX_uxn_device_h_l42_c2_34d5_iftrue := VAR_screen_dei_uxn_device_h_l43_c12_2384_return_output;
     -- datetime_dei[uxn_device_h_l46_c12_cf71] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l46_c12_cf71_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l46_c12_cf71_addr <= VAR_datetime_dei_uxn_device_h_l46_c12_cf71_addr;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l46_c12_cf71_return_output := datetime_dei_uxn_device_h_l46_c12_cf71_return_output;

     -- device_ram_read[uxn_device_h_l49_c12_6f3f] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l49_c12_6f3f_address <= VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_return_output := device_ram_read_uxn_device_h_l49_c12_6f3f_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l45_c7_4b87_iftrue := VAR_datetime_dei_uxn_device_h_l46_c12_cf71_return_output;
     VAR_result_MUX_uxn_device_h_l45_c7_4b87_iffalse := VAR_device_ram_read_uxn_device_h_l49_c12_6f3f_return_output;
     -- result_MUX[uxn_device_h_l45_c7_4b87] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l45_c7_4b87_cond <= VAR_result_MUX_uxn_device_h_l45_c7_4b87_cond;
     result_MUX_uxn_device_h_l45_c7_4b87_iftrue <= VAR_result_MUX_uxn_device_h_l45_c7_4b87_iftrue;
     result_MUX_uxn_device_h_l45_c7_4b87_iffalse <= VAR_result_MUX_uxn_device_h_l45_c7_4b87_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l45_c7_4b87_return_output := result_MUX_uxn_device_h_l45_c7_4b87_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l42_c2_34d5_iffalse := VAR_result_MUX_uxn_device_h_l45_c7_4b87_return_output;
     -- result_MUX[uxn_device_h_l42_c2_34d5] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l42_c2_34d5_cond <= VAR_result_MUX_uxn_device_h_l42_c2_34d5_cond;
     result_MUX_uxn_device_h_l42_c2_34d5_iftrue <= VAR_result_MUX_uxn_device_h_l42_c2_34d5_iftrue;
     result_MUX_uxn_device_h_l42_c2_34d5_iffalse <= VAR_result_MUX_uxn_device_h_l42_c2_34d5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l42_c2_34d5_return_output := result_MUX_uxn_device_h_l42_c2_34d5_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l42_c2_34d5_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l42_c2_34d5_return_output;
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
