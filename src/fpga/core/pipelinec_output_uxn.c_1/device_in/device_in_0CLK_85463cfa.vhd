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
entity device_in_0CLK_85463cfa is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_85463cfa;
architecture arch of device_in_0CLK_85463cfa is
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
-- BIN_OP_AND[uxn_device_h_l341_c11_e7f8]
signal BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l343_c6_088e]
signal BIN_OP_EQ_uxn_device_h_l343_c6_088e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l343_c6_088e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l343_c1_61f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l346_c7_08f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l343_c2_3b9d]
signal result_MUX_uxn_device_h_l343_c2_3b9d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l343_c2_3b9d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l343_c2_3b9d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l343_c2_3b9d_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l344_c12_9e72]
signal system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l344_c12_9e72_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l344_c12_9e72_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l344_c12_9e72_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l346_c11_8b5b]
signal BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l346_c1_bab3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_7053]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l346_c7_08f6]
signal result_MUX_uxn_device_h_l346_c7_08f6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l346_c7_08f6_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l346_c7_08f6_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l346_c7_08f6_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l347_c12_5b63]
signal screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l347_c12_5b63_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l347_c12_5b63_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l347_c12_5b63_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l350_c12_c0d8]
signal generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l350_c12_c0d8_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_c0d8_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_c0d8_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l341_c11_e7f8
BIN_OP_AND_uxn_device_h_l341_c11_e7f8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left,
BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right,
BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output);

-- BIN_OP_EQ_uxn_device_h_l343_c6_088e
BIN_OP_EQ_uxn_device_h_l343_c6_088e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l343_c6_088e_left,
BIN_OP_EQ_uxn_device_h_l343_c6_088e_right,
BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output);

-- result_MUX_uxn_device_h_l343_c2_3b9d
result_MUX_uxn_device_h_l343_c2_3b9d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l343_c2_3b9d_cond,
result_MUX_uxn_device_h_l343_c2_3b9d_iftrue,
result_MUX_uxn_device_h_l343_c2_3b9d_iffalse,
result_MUX_uxn_device_h_l343_c2_3b9d_return_output);

-- system_dei_uxn_device_h_l344_c12_9e72
system_dei_uxn_device_h_l344_c12_9e72 : entity work.system_dei_0CLK_69d14ba8 port map (
clk,
system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE,
system_dei_uxn_device_h_l344_c12_9e72_device_address,
system_dei_uxn_device_h_l344_c12_9e72_phase,
system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read,
system_dei_uxn_device_h_l344_c12_9e72_return_output);

-- BIN_OP_EQ_uxn_device_h_l346_c11_8b5b
BIN_OP_EQ_uxn_device_h_l346_c11_8b5b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left,
BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right,
BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output);

-- result_MUX_uxn_device_h_l346_c7_08f6
result_MUX_uxn_device_h_l346_c7_08f6 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l346_c7_08f6_cond,
result_MUX_uxn_device_h_l346_c7_08f6_iftrue,
result_MUX_uxn_device_h_l346_c7_08f6_iffalse,
result_MUX_uxn_device_h_l346_c7_08f6_return_output);

-- screen_dei_uxn_device_h_l347_c12_5b63
screen_dei_uxn_device_h_l347_c12_5b63 : entity work.screen_dei_0CLK_d6d874ab port map (
clk,
screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE,
screen_dei_uxn_device_h_l347_c12_5b63_device_address,
screen_dei_uxn_device_h_l347_c12_5b63_phase,
screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read,
screen_dei_uxn_device_h_l347_c12_5b63_return_output);

-- generic_dei_uxn_device_h_l350_c12_c0d8
generic_dei_uxn_device_h_l350_c12_c0d8 : entity work.generic_dei_0CLK_6f2c5aad port map (
clk,
generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE,
generic_dei_uxn_device_h_l350_c12_c0d8_device_address,
generic_dei_uxn_device_h_l350_c12_c0d8_phase,
generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read,
generic_dei_uxn_device_h_l350_c12_c0d8_return_output);



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
 BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output,
 BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output,
 result_MUX_uxn_device_h_l343_c2_3b9d_return_output,
 system_dei_uxn_device_h_l344_c12_9e72_return_output,
 BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output,
 result_MUX_uxn_device_h_l346_c7_08f6_return_output,
 screen_dei_uxn_device_h_l347_c12_5b63_return_output,
 generic_dei_uxn_device_h_l350_c12_c0d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l346_c7_08f6_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l343_c2_3b9d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l343_c2_3b9d_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l344_c12_9e72_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l344_c12_9e72_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l344_c12_9e72_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l346_c7_08f6_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l346_c7_08f6_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l346_c7_08f6_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l347_c12_5b63_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l347_c12_5b63_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l347_c12_5b63_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l350_c12_c0d8_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_c0d8_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_c0d8_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_right := to_unsigned(0, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right := to_unsigned(240, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_c0d8_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l347_c12_5b63_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l344_c12_9e72_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_c0d8_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l347_c12_5b63_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l344_c12_9e72_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l341_c11_e7f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left <= VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_left;
     BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right <= VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output := BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_left := VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left := VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l341_c11_e7f8_return_output;
     -- BIN_OP_EQ[uxn_device_h_l343_c6_088e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l343_c6_088e_left <= VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_left;
     BIN_OP_EQ_uxn_device_h_l343_c6_088e_right <= VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output := BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l346_c11_8b5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left <= VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_left;
     BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right <= VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output := BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond := VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output;
     VAR_result_MUX_uxn_device_h_l343_c2_3b9d_cond := VAR_BIN_OP_EQ_uxn_device_h_l343_c6_088e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond := VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond := VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output;
     VAR_result_MUX_uxn_device_h_l346_c7_08f6_cond := VAR_BIN_OP_EQ_uxn_device_h_l346_c11_8b5b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l346_c7_08f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l343_c1_61f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c7_08f6_return_output;
     VAR_system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l343_c1_61f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_7053] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l346_c1_bab3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output;

     -- system_dei[uxn_device_h_l344_c12_9e72] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l344_c12_9e72_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l344_c12_9e72_device_address <= VAR_system_dei_uxn_device_h_l344_c12_9e72_device_address;
     system_dei_uxn_device_h_l344_c12_9e72_phase <= VAR_system_dei_uxn_device_h_l344_c12_9e72_phase;
     system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l344_c12_9e72_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l344_c12_9e72_return_output := system_dei_uxn_device_h_l344_c12_9e72_return_output;

     -- Submodule level 4
     VAR_generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_7053_return_output;
     VAR_screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l346_c1_bab3_return_output;
     VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iftrue := VAR_system_dei_uxn_device_h_l344_c12_9e72_return_output;
     -- screen_dei[uxn_device_h_l347_c12_5b63] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l347_c12_5b63_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l347_c12_5b63_device_address <= VAR_screen_dei_uxn_device_h_l347_c12_5b63_device_address;
     screen_dei_uxn_device_h_l347_c12_5b63_phase <= VAR_screen_dei_uxn_device_h_l347_c12_5b63_phase;
     screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l347_c12_5b63_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l347_c12_5b63_return_output := screen_dei_uxn_device_h_l347_c12_5b63_return_output;

     -- generic_dei[uxn_device_h_l350_c12_c0d8] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l350_c12_c0d8_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l350_c12_c0d8_device_address <= VAR_generic_dei_uxn_device_h_l350_c12_c0d8_device_address;
     generic_dei_uxn_device_h_l350_c12_c0d8_phase <= VAR_generic_dei_uxn_device_h_l350_c12_c0d8_phase;
     generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l350_c12_c0d8_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l350_c12_c0d8_return_output := generic_dei_uxn_device_h_l350_c12_c0d8_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l346_c7_08f6_iffalse := VAR_generic_dei_uxn_device_h_l350_c12_c0d8_return_output;
     VAR_result_MUX_uxn_device_h_l346_c7_08f6_iftrue := VAR_screen_dei_uxn_device_h_l347_c12_5b63_return_output;
     -- result_MUX[uxn_device_h_l346_c7_08f6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l346_c7_08f6_cond <= VAR_result_MUX_uxn_device_h_l346_c7_08f6_cond;
     result_MUX_uxn_device_h_l346_c7_08f6_iftrue <= VAR_result_MUX_uxn_device_h_l346_c7_08f6_iftrue;
     result_MUX_uxn_device_h_l346_c7_08f6_iffalse <= VAR_result_MUX_uxn_device_h_l346_c7_08f6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l346_c7_08f6_return_output := result_MUX_uxn_device_h_l346_c7_08f6_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iffalse := VAR_result_MUX_uxn_device_h_l346_c7_08f6_return_output;
     -- result_MUX[uxn_device_h_l343_c2_3b9d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l343_c2_3b9d_cond <= VAR_result_MUX_uxn_device_h_l343_c2_3b9d_cond;
     result_MUX_uxn_device_h_l343_c2_3b9d_iftrue <= VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iftrue;
     result_MUX_uxn_device_h_l343_c2_3b9d_iffalse <= VAR_result_MUX_uxn_device_h_l343_c2_3b9d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l343_c2_3b9d_return_output := result_MUX_uxn_device_h_l343_c2_3b9d_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l343_c2_3b9d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l343_c2_3b9d_return_output;
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
