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
-- Submodules: 17
entity screen_dei_0CLK_f56ba9de is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_f56ba9de;
architecture arch of screen_dei_0CLK_f56ba9de is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l329_c6_3410]
signal BIN_OP_EQ_uxn_device_h_l329_c6_3410_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c6_3410_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l334_c7_0d31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l329_c2_490f]
signal result_MUX_uxn_device_h_l329_c2_490f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l329_c2_490f_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l329_c2_490f_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l329_c2_490f_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l334_c11_3dd0]
signal BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l339_c7_9c56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l334_c7_0d31]
signal result_MUX_uxn_device_h_l334_c7_0d31_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l334_c7_0d31_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l334_c7_0d31_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l334_c7_0d31_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l339_c11_c7d7]
signal BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l344_c7_3e43]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l339_c7_9c56]
signal result_MUX_uxn_device_h_l339_c7_9c56_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l339_c7_9c56_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l339_c7_9c56_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l339_c7_9c56_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l344_c11_ca1d]
signal BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_0d8c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l344_c7_3e43]
signal result_MUX_uxn_device_h_l344_c7_3e43_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l344_c7_3e43_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l344_c7_3e43_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l344_c7_3e43_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l350_c12_4960]
signal generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l350_c12_4960_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_4960_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l350_c12_4960_return_output : device_in_result_t;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l329_c6_3410
BIN_OP_EQ_uxn_device_h_l329_c6_3410 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l329_c6_3410_left,
BIN_OP_EQ_uxn_device_h_l329_c6_3410_right,
BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output);

-- result_MUX_uxn_device_h_l329_c2_490f
result_MUX_uxn_device_h_l329_c2_490f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l329_c2_490f_cond,
result_MUX_uxn_device_h_l329_c2_490f_iftrue,
result_MUX_uxn_device_h_l329_c2_490f_iffalse,
result_MUX_uxn_device_h_l329_c2_490f_return_output);

-- BIN_OP_EQ_uxn_device_h_l334_c11_3dd0
BIN_OP_EQ_uxn_device_h_l334_c11_3dd0 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left,
BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right,
BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output);

-- result_MUX_uxn_device_h_l334_c7_0d31
result_MUX_uxn_device_h_l334_c7_0d31 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l334_c7_0d31_cond,
result_MUX_uxn_device_h_l334_c7_0d31_iftrue,
result_MUX_uxn_device_h_l334_c7_0d31_iffalse,
result_MUX_uxn_device_h_l334_c7_0d31_return_output);

-- BIN_OP_EQ_uxn_device_h_l339_c11_c7d7
BIN_OP_EQ_uxn_device_h_l339_c11_c7d7 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left,
BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right,
BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output);

-- result_MUX_uxn_device_h_l339_c7_9c56
result_MUX_uxn_device_h_l339_c7_9c56 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l339_c7_9c56_cond,
result_MUX_uxn_device_h_l339_c7_9c56_iftrue,
result_MUX_uxn_device_h_l339_c7_9c56_iffalse,
result_MUX_uxn_device_h_l339_c7_9c56_return_output);

-- BIN_OP_EQ_uxn_device_h_l344_c11_ca1d
BIN_OP_EQ_uxn_device_h_l344_c11_ca1d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left,
BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right,
BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output);

-- result_MUX_uxn_device_h_l344_c7_3e43
result_MUX_uxn_device_h_l344_c7_3e43 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l344_c7_3e43_cond,
result_MUX_uxn_device_h_l344_c7_3e43_iftrue,
result_MUX_uxn_device_h_l344_c7_3e43_iffalse,
result_MUX_uxn_device_h_l344_c7_3e43_return_output);

-- generic_dei_uxn_device_h_l350_c12_4960
generic_dei_uxn_device_h_l350_c12_4960 : entity work.generic_dei_0CLK_5af1a430 port map (
clk,
generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE,
generic_dei_uxn_device_h_l350_c12_4960_device_address,
generic_dei_uxn_device_h_l350_c12_4960_phase,
generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read,
generic_dei_uxn_device_h_l350_c12_4960_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output,
 result_MUX_uxn_device_h_l329_c2_490f_return_output,
 BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output,
 result_MUX_uxn_device_h_l334_c7_0d31_return_output,
 BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output,
 result_MUX_uxn_device_h_l339_c7_9c56_return_output,
 BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output,
 result_MUX_uxn_device_h_l344_c7_3e43_return_output,
 generic_dei_uxn_device_h_l350_c12_4960_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l329_c2_490f_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_490f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_490f_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_0d31_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_490f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l329_c2_490f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l330_c3_f635 : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l331_c3_c241 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l334_c7_0d31_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_0d31_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_0d31_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_9c56_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l334_c7_0d31_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l335_c3_2510 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l339_c7_9c56_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_9c56_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_9c56_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_3e43_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l339_c7_9c56_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l340_c3_958f : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l341_c3_8ede : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l344_c7_3e43_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_3e43_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_3e43_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l344_c7_3e43_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l345_c3_9d5e : unsigned(7 downto 0);
 variable VAR_result_dei_value_uxn_device_h_l346_c3_340b : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_4960_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_4960_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l350_c12_4960_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l340_c3_958f := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l330_c3_f635 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue := to_unsigned(0, 1);
     VAR_result_dei_value_uxn_device_h_l346_c3_340b := resize(to_unsigned(104, 7), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l345_c3_9d5e := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right := to_unsigned(37, 6);
     VAR_result_dei_value_uxn_device_h_l341_c3_8ede := resize(to_unsigned(1, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l335_c3_2510 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right := to_unsigned(36, 6);
     VAR_result_dei_value_uxn_device_h_l331_c3_c241 := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_right := to_unsigned(34, 6);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l329_c2_490f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_490f_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l330_c3_f635,
     VAR_result_dei_value_uxn_device_h_l331_c3_c241,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l339_c7_9c56] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_9c56_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l340_c3_958f,
     VAR_result_dei_value_uxn_device_h_l341_c3_8ede,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l344_c7_3e43] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_3e43_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l345_c3_9d5e,
     VAR_result_dei_value_uxn_device_h_l346_c3_340b,
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l334_c7_0d31] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_0d31_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l335_c3_2510,
     to_unsigned(144, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l344_c7_3e43_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l344_c7_3e43_return_output;
     VAR_result_MUX_uxn_device_h_l339_c7_9c56_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l339_c7_9c56_return_output;
     VAR_result_MUX_uxn_device_h_l329_c2_490f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l329_c2_490f_return_output;
     VAR_result_MUX_uxn_device_h_l334_c7_0d31_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l334_c7_0d31_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_4960_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l350_c12_4960_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l334_c11_3dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left <= VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_left;
     BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right <= VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output := BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l344_c11_ca1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left <= VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_left;
     BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right <= VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output := BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l339_c11_c7d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left <= VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_left;
     BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right <= VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output := BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l329_c6_3410] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l329_c6_3410_left <= VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_left;
     BIN_OP_EQ_uxn_device_h_l329_c6_3410_right <= VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output := BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output;
     VAR_result_MUX_uxn_device_h_l329_c2_490f_cond := VAR_BIN_OP_EQ_uxn_device_h_l329_c6_3410_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output;
     VAR_result_MUX_uxn_device_h_l334_c7_0d31_cond := VAR_BIN_OP_EQ_uxn_device_h_l334_c11_3dd0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output;
     VAR_result_MUX_uxn_device_h_l339_c7_9c56_cond := VAR_BIN_OP_EQ_uxn_device_h_l339_c11_c7d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output;
     VAR_result_MUX_uxn_device_h_l344_c7_3e43_cond := VAR_BIN_OP_EQ_uxn_device_h_l344_c11_ca1d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l334_c7_0d31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l334_c7_0d31_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l339_c7_9c56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l339_c7_9c56_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l344_c7_3e43] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l344_c7_3e43_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l349_c1_0d8c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output;

     -- Submodule level 5
     VAR_generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l349_c1_0d8c_return_output;
     -- generic_dei[uxn_device_h_l350_c12_4960] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l350_c12_4960_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l350_c12_4960_device_address <= VAR_generic_dei_uxn_device_h_l350_c12_4960_device_address;
     generic_dei_uxn_device_h_l350_c12_4960_phase <= VAR_generic_dei_uxn_device_h_l350_c12_4960_phase;
     generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l350_c12_4960_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l350_c12_4960_return_output := generic_dei_uxn_device_h_l350_c12_4960_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l344_c7_3e43_iffalse := VAR_generic_dei_uxn_device_h_l350_c12_4960_return_output;
     -- result_MUX[uxn_device_h_l344_c7_3e43] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l344_c7_3e43_cond <= VAR_result_MUX_uxn_device_h_l344_c7_3e43_cond;
     result_MUX_uxn_device_h_l344_c7_3e43_iftrue <= VAR_result_MUX_uxn_device_h_l344_c7_3e43_iftrue;
     result_MUX_uxn_device_h_l344_c7_3e43_iffalse <= VAR_result_MUX_uxn_device_h_l344_c7_3e43_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l344_c7_3e43_return_output := result_MUX_uxn_device_h_l344_c7_3e43_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l339_c7_9c56_iffalse := VAR_result_MUX_uxn_device_h_l344_c7_3e43_return_output;
     -- result_MUX[uxn_device_h_l339_c7_9c56] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l339_c7_9c56_cond <= VAR_result_MUX_uxn_device_h_l339_c7_9c56_cond;
     result_MUX_uxn_device_h_l339_c7_9c56_iftrue <= VAR_result_MUX_uxn_device_h_l339_c7_9c56_iftrue;
     result_MUX_uxn_device_h_l339_c7_9c56_iffalse <= VAR_result_MUX_uxn_device_h_l339_c7_9c56_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l339_c7_9c56_return_output := result_MUX_uxn_device_h_l339_c7_9c56_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l334_c7_0d31_iffalse := VAR_result_MUX_uxn_device_h_l339_c7_9c56_return_output;
     -- result_MUX[uxn_device_h_l334_c7_0d31] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l334_c7_0d31_cond <= VAR_result_MUX_uxn_device_h_l334_c7_0d31_cond;
     result_MUX_uxn_device_h_l334_c7_0d31_iftrue <= VAR_result_MUX_uxn_device_h_l334_c7_0d31_iftrue;
     result_MUX_uxn_device_h_l334_c7_0d31_iffalse <= VAR_result_MUX_uxn_device_h_l334_c7_0d31_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l334_c7_0d31_return_output := result_MUX_uxn_device_h_l334_c7_0d31_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l329_c2_490f_iffalse := VAR_result_MUX_uxn_device_h_l334_c7_0d31_return_output;
     -- result_MUX[uxn_device_h_l329_c2_490f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l329_c2_490f_cond <= VAR_result_MUX_uxn_device_h_l329_c2_490f_cond;
     result_MUX_uxn_device_h_l329_c2_490f_iftrue <= VAR_result_MUX_uxn_device_h_l329_c2_490f_iftrue;
     result_MUX_uxn_device_h_l329_c2_490f_iffalse <= VAR_result_MUX_uxn_device_h_l329_c2_490f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l329_c2_490f_return_output := result_MUX_uxn_device_h_l329_c2_490f_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l329_c2_490f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l329_c2_490f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
