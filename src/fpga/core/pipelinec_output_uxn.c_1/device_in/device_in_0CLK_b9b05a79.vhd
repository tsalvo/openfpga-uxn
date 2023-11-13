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
entity device_in_0CLK_b9b05a79 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_b9b05a79;
architecture arch of device_in_0CLK_b9b05a79 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l360_c11_056a]
signal BIN_OP_AND_uxn_device_h_l360_c11_056a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l360_c11_056a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l362_c6_c7e6]
signal BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l362_c1_ed5f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l365_c7_8150]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l362_c2_8f79]
signal result_MUX_uxn_device_h_l362_c2_8f79_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l362_c2_8f79_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l362_c2_8f79_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l362_c2_8f79_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l363_c12_e2c6]
signal system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l363_c12_e2c6_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l363_c12_e2c6_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l363_c12_e2c6_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l365_c11_1b20]
signal BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l365_c1_2736]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l368_c1_a2c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l365_c7_8150]
signal result_MUX_uxn_device_h_l365_c7_8150_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l365_c7_8150_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l365_c7_8150_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l365_c7_8150_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l366_c12_ecb9]
signal screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l366_c12_ecb9_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l366_c12_ecb9_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l366_c12_ecb9_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l369_c12_8e6b]
signal generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l369_c12_8e6b_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l369_c12_8e6b_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l369_c12_8e6b_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l360_c11_056a
BIN_OP_AND_uxn_device_h_l360_c11_056a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l360_c11_056a_left,
BIN_OP_AND_uxn_device_h_l360_c11_056a_right,
BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output);

-- BIN_OP_EQ_uxn_device_h_l362_c6_c7e6
BIN_OP_EQ_uxn_device_h_l362_c6_c7e6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left,
BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right,
BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output);

-- result_MUX_uxn_device_h_l362_c2_8f79
result_MUX_uxn_device_h_l362_c2_8f79 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l362_c2_8f79_cond,
result_MUX_uxn_device_h_l362_c2_8f79_iftrue,
result_MUX_uxn_device_h_l362_c2_8f79_iffalse,
result_MUX_uxn_device_h_l362_c2_8f79_return_output);

-- system_dei_uxn_device_h_l363_c12_e2c6
system_dei_uxn_device_h_l363_c12_e2c6 : entity work.system_dei_0CLK_ef67fea2 port map (
clk,
system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE,
system_dei_uxn_device_h_l363_c12_e2c6_device_address,
system_dei_uxn_device_h_l363_c12_e2c6_phase,
system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read,
system_dei_uxn_device_h_l363_c12_e2c6_return_output);

-- BIN_OP_EQ_uxn_device_h_l365_c11_1b20
BIN_OP_EQ_uxn_device_h_l365_c11_1b20 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left,
BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right,
BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output);

-- result_MUX_uxn_device_h_l365_c7_8150
result_MUX_uxn_device_h_l365_c7_8150 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l365_c7_8150_cond,
result_MUX_uxn_device_h_l365_c7_8150_iftrue,
result_MUX_uxn_device_h_l365_c7_8150_iffalse,
result_MUX_uxn_device_h_l365_c7_8150_return_output);

-- screen_dei_uxn_device_h_l366_c12_ecb9
screen_dei_uxn_device_h_l366_c12_ecb9 : entity work.screen_dei_0CLK_f56ba9de port map (
clk,
screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE,
screen_dei_uxn_device_h_l366_c12_ecb9_device_address,
screen_dei_uxn_device_h_l366_c12_ecb9_phase,
screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read,
screen_dei_uxn_device_h_l366_c12_ecb9_return_output);

-- generic_dei_uxn_device_h_l369_c12_8e6b
generic_dei_uxn_device_h_l369_c12_8e6b : entity work.generic_dei_0CLK_5af1a430 port map (
clk,
generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE,
generic_dei_uxn_device_h_l369_c12_8e6b_device_address,
generic_dei_uxn_device_h_l369_c12_8e6b_phase,
generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read,
generic_dei_uxn_device_h_l369_c12_8e6b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output,
 BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output,
 result_MUX_uxn_device_h_l362_c2_8f79_return_output,
 system_dei_uxn_device_h_l363_c12_e2c6_return_output,
 BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output,
 result_MUX_uxn_device_h_l365_c7_8150_return_output,
 screen_dei_uxn_device_h_l366_c12_ecb9_return_output,
 generic_dei_uxn_device_h_l369_c12_8e6b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l362_c2_8f79_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l362_c2_8f79_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l365_c7_8150_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l362_c2_8f79_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l362_c2_8f79_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l363_c12_e2c6_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l363_c12_e2c6_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l363_c12_e2c6_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l365_c7_8150_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l365_c7_8150_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l365_c7_8150_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l366_c12_ecb9_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l366_c12_ecb9_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l366_c12_ecb9_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l369_c12_8e6b_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l369_c12_8e6b_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l369_c12_8e6b_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_right := to_unsigned(240, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l369_c12_8e6b_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l366_c12_ecb9_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l363_c12_e2c6_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l369_c12_8e6b_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l366_c12_ecb9_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l363_c12_e2c6_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l360_c11_056a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l360_c11_056a_left <= VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_left;
     BIN_OP_AND_uxn_device_h_l360_c11_056a_right <= VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output := BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left := VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left := VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l360_c11_056a_return_output;
     -- BIN_OP_EQ[uxn_device_h_l362_c6_c7e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left <= VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_left;
     BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right <= VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output := BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l365_c11_1b20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left <= VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_left;
     BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right <= VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output := BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond := VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond := VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output;
     VAR_result_MUX_uxn_device_h_l362_c2_8f79_cond := VAR_BIN_OP_EQ_uxn_device_h_l362_c6_c7e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output;
     VAR_result_MUX_uxn_device_h_l365_c7_8150_cond := VAR_BIN_OP_EQ_uxn_device_h_l365_c11_1b20_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l365_c7_8150] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l362_c1_ed5f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c7_8150_return_output;
     VAR_system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l362_c1_ed5f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l368_c1_a2c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output;

     -- system_dei[uxn_device_h_l363_c12_e2c6] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l363_c12_e2c6_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l363_c12_e2c6_device_address <= VAR_system_dei_uxn_device_h_l363_c12_e2c6_device_address;
     system_dei_uxn_device_h_l363_c12_e2c6_phase <= VAR_system_dei_uxn_device_h_l363_c12_e2c6_phase;
     system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l363_c12_e2c6_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l363_c12_e2c6_return_output := system_dei_uxn_device_h_l363_c12_e2c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l365_c1_2736] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output;

     -- Submodule level 4
     VAR_generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l368_c1_a2c0_return_output;
     VAR_screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l365_c1_2736_return_output;
     VAR_result_MUX_uxn_device_h_l362_c2_8f79_iftrue := VAR_system_dei_uxn_device_h_l363_c12_e2c6_return_output;
     -- generic_dei[uxn_device_h_l369_c12_8e6b] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l369_c12_8e6b_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l369_c12_8e6b_device_address <= VAR_generic_dei_uxn_device_h_l369_c12_8e6b_device_address;
     generic_dei_uxn_device_h_l369_c12_8e6b_phase <= VAR_generic_dei_uxn_device_h_l369_c12_8e6b_phase;
     generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l369_c12_8e6b_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l369_c12_8e6b_return_output := generic_dei_uxn_device_h_l369_c12_8e6b_return_output;

     -- screen_dei[uxn_device_h_l366_c12_ecb9] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l366_c12_ecb9_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l366_c12_ecb9_device_address <= VAR_screen_dei_uxn_device_h_l366_c12_ecb9_device_address;
     screen_dei_uxn_device_h_l366_c12_ecb9_phase <= VAR_screen_dei_uxn_device_h_l366_c12_ecb9_phase;
     screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l366_c12_ecb9_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l366_c12_ecb9_return_output := screen_dei_uxn_device_h_l366_c12_ecb9_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l365_c7_8150_iffalse := VAR_generic_dei_uxn_device_h_l369_c12_8e6b_return_output;
     VAR_result_MUX_uxn_device_h_l365_c7_8150_iftrue := VAR_screen_dei_uxn_device_h_l366_c12_ecb9_return_output;
     -- result_MUX[uxn_device_h_l365_c7_8150] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l365_c7_8150_cond <= VAR_result_MUX_uxn_device_h_l365_c7_8150_cond;
     result_MUX_uxn_device_h_l365_c7_8150_iftrue <= VAR_result_MUX_uxn_device_h_l365_c7_8150_iftrue;
     result_MUX_uxn_device_h_l365_c7_8150_iffalse <= VAR_result_MUX_uxn_device_h_l365_c7_8150_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l365_c7_8150_return_output := result_MUX_uxn_device_h_l365_c7_8150_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l362_c2_8f79_iffalse := VAR_result_MUX_uxn_device_h_l365_c7_8150_return_output;
     -- result_MUX[uxn_device_h_l362_c2_8f79] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l362_c2_8f79_cond <= VAR_result_MUX_uxn_device_h_l362_c2_8f79_cond;
     result_MUX_uxn_device_h_l362_c2_8f79_iftrue <= VAR_result_MUX_uxn_device_h_l362_c2_8f79_iftrue;
     result_MUX_uxn_device_h_l362_c2_8f79_iffalse <= VAR_result_MUX_uxn_device_h_l362_c2_8f79_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l362_c2_8f79_return_output := result_MUX_uxn_device_h_l362_c2_8f79_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l362_c2_8f79_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l362_c2_8f79_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
