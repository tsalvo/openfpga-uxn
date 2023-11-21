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
entity screen_dei_0CLK_d6d874ab is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_d6d874ab;
architecture arch of screen_dei_0CLK_d6d874ab is
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
-- BIN_OP_EQ[uxn_device_h_l301_c6_1150]
signal BIN_OP_EQ_uxn_device_h_l301_c6_1150_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l301_c6_1150_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l306_c7_b3a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l301_c2_a72d]
signal result_MUX_uxn_device_h_l301_c2_a72d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l301_c2_a72d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l301_c2_a72d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l301_c2_a72d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l306_c11_47d0]
signal BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l311_c7_0c65]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l306_c7_b3a7]
signal result_MUX_uxn_device_h_l306_c7_b3a7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l306_c7_b3a7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l306_c7_b3a7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l306_c7_b3a7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l311_c11_f7b9]
signal BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l316_c7_1fdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l311_c7_0c65]
signal result_MUX_uxn_device_h_l311_c7_0c65_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l311_c7_0c65_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l311_c7_0c65_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l311_c7_0c65_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l316_c11_d217]
signal BIN_OP_EQ_uxn_device_h_l316_c11_d217_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l316_c11_d217_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_f00c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l316_c7_1fdd]
signal result_MUX_uxn_device_h_l316_c7_1fdd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l316_c7_1fdd_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l316_c7_1fdd_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l316_c7_1fdd_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l322_c12_8169]
signal generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l322_c12_8169_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l322_c12_8169_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l322_c12_8169_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l301_c6_1150
BIN_OP_EQ_uxn_device_h_l301_c6_1150 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l301_c6_1150_left,
BIN_OP_EQ_uxn_device_h_l301_c6_1150_right,
BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output);

-- result_MUX_uxn_device_h_l301_c2_a72d
result_MUX_uxn_device_h_l301_c2_a72d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l301_c2_a72d_cond,
result_MUX_uxn_device_h_l301_c2_a72d_iftrue,
result_MUX_uxn_device_h_l301_c2_a72d_iffalse,
result_MUX_uxn_device_h_l301_c2_a72d_return_output);

-- BIN_OP_EQ_uxn_device_h_l306_c11_47d0
BIN_OP_EQ_uxn_device_h_l306_c11_47d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left,
BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right,
BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output);

-- result_MUX_uxn_device_h_l306_c7_b3a7
result_MUX_uxn_device_h_l306_c7_b3a7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l306_c7_b3a7_cond,
result_MUX_uxn_device_h_l306_c7_b3a7_iftrue,
result_MUX_uxn_device_h_l306_c7_b3a7_iffalse,
result_MUX_uxn_device_h_l306_c7_b3a7_return_output);

-- BIN_OP_EQ_uxn_device_h_l311_c11_f7b9
BIN_OP_EQ_uxn_device_h_l311_c11_f7b9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left,
BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right,
BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output);

-- result_MUX_uxn_device_h_l311_c7_0c65
result_MUX_uxn_device_h_l311_c7_0c65 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l311_c7_0c65_cond,
result_MUX_uxn_device_h_l311_c7_0c65_iftrue,
result_MUX_uxn_device_h_l311_c7_0c65_iffalse,
result_MUX_uxn_device_h_l311_c7_0c65_return_output);

-- BIN_OP_EQ_uxn_device_h_l316_c11_d217
BIN_OP_EQ_uxn_device_h_l316_c11_d217 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l316_c11_d217_left,
BIN_OP_EQ_uxn_device_h_l316_c11_d217_right,
BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output);

-- result_MUX_uxn_device_h_l316_c7_1fdd
result_MUX_uxn_device_h_l316_c7_1fdd : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l316_c7_1fdd_cond,
result_MUX_uxn_device_h_l316_c7_1fdd_iftrue,
result_MUX_uxn_device_h_l316_c7_1fdd_iffalse,
result_MUX_uxn_device_h_l316_c7_1fdd_return_output);

-- generic_dei_uxn_device_h_l322_c12_8169
generic_dei_uxn_device_h_l322_c12_8169 : entity work.generic_dei_0CLK_6f2c5aad port map (
clk,
generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE,
generic_dei_uxn_device_h_l322_c12_8169_device_address,
generic_dei_uxn_device_h_l322_c12_8169_phase,
generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read,
generic_dei_uxn_device_h_l322_c12_8169_return_output);



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
 BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output,
 result_MUX_uxn_device_h_l301_c2_a72d_return_output,
 BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output,
 result_MUX_uxn_device_h_l306_c7_b3a7_return_output,
 BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output,
 result_MUX_uxn_device_h_l311_c7_0c65_return_output,
 BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output,
 result_MUX_uxn_device_h_l316_c7_1fdd_return_output,
 generic_dei_uxn_device_h_l322_c12_8169_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l301_c2_a72d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l301_c2_a72d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c2_a72d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l306_c7_b3a7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c2_a72d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l301_c2_a72d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l302_c3_f481 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l306_c7_b3a7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l311_c7_0c65_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l306_c7_b3a7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l307_c3_73ef : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l311_c7_0c65_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l311_c7_0c65_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l311_c7_0c65_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l316_c7_1fdd_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l311_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l312_c3_88f6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l316_c7_1fdd_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l316_c7_1fdd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l317_c3_ec3a : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l322_c12_8169_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l322_c12_8169_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l322_c12_8169_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l312_c3_88f6 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_right := to_unsigned(37, 8);
     VAR_result_device_ram_address_uxn_device_h_l302_c3_f481 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l317_c3_ec3a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right := to_unsigned(36, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_right := to_unsigned(34, 8);
     VAR_result_device_ram_address_uxn_device_h_l307_c3_73ef := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l311_c7_0c65] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l311_c7_0c65_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l312_c3_88f6,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l306_c7_b3a7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l306_c7_b3a7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l307_c3_73ef,
     to_unsigned(64, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l301_c2_a72d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l301_c2_a72d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l302_c3_f481,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l316_c7_1fdd] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l316_c7_1fdd_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l317_c3_ec3a,
     to_unsigned(32, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l311_c7_0c65_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l311_c7_0c65_return_output;
     VAR_result_MUX_uxn_device_h_l301_c2_a72d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l301_c2_a72d_return_output;
     VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l306_c7_b3a7_return_output;
     VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l316_c7_1fdd_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left := VAR_device_address;
     VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l322_c12_8169_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l322_c12_8169_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_EQ[uxn_device_h_l306_c11_47d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_left;
     BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output := BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l316_c11_d217] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l316_c11_d217_left <= VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_left;
     BIN_OP_EQ_uxn_device_h_l316_c11_d217_right <= VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output := BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output;

     -- BIN_OP_EQ[uxn_device_h_l301_c6_1150] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l301_c6_1150_left <= VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_left;
     BIN_OP_EQ_uxn_device_h_l301_c6_1150_right <= VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output := BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output;

     -- BIN_OP_EQ[uxn_device_h_l311_c11_f7b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left <= VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_left;
     BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right <= VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output := BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output;
     VAR_result_MUX_uxn_device_h_l301_c2_a72d_cond := VAR_BIN_OP_EQ_uxn_device_h_l301_c6_1150_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output;
     VAR_result_MUX_uxn_device_h_l306_c7_b3a7_cond := VAR_BIN_OP_EQ_uxn_device_h_l306_c11_47d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output;
     VAR_result_MUX_uxn_device_h_l311_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_device_h_l311_c11_f7b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond := VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output;
     VAR_result_MUX_uxn_device_h_l316_c7_1fdd_cond := VAR_BIN_OP_EQ_uxn_device_h_l316_c11_d217_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l306_c7_b3a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l306_c7_b3a7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l311_c7_0c65] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l311_c7_0c65_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l316_c7_1fdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l316_c7_1fdd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l321_c1_f00c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output;

     -- Submodule level 5
     VAR_generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l321_c1_f00c_return_output;
     -- generic_dei[uxn_device_h_l322_c12_8169] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l322_c12_8169_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l322_c12_8169_device_address <= VAR_generic_dei_uxn_device_h_l322_c12_8169_device_address;
     generic_dei_uxn_device_h_l322_c12_8169_phase <= VAR_generic_dei_uxn_device_h_l322_c12_8169_phase;
     generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l322_c12_8169_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l322_c12_8169_return_output := generic_dei_uxn_device_h_l322_c12_8169_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iffalse := VAR_generic_dei_uxn_device_h_l322_c12_8169_return_output;
     -- result_MUX[uxn_device_h_l316_c7_1fdd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l316_c7_1fdd_cond <= VAR_result_MUX_uxn_device_h_l316_c7_1fdd_cond;
     result_MUX_uxn_device_h_l316_c7_1fdd_iftrue <= VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iftrue;
     result_MUX_uxn_device_h_l316_c7_1fdd_iffalse <= VAR_result_MUX_uxn_device_h_l316_c7_1fdd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l316_c7_1fdd_return_output := result_MUX_uxn_device_h_l316_c7_1fdd_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l311_c7_0c65_iffalse := VAR_result_MUX_uxn_device_h_l316_c7_1fdd_return_output;
     -- result_MUX[uxn_device_h_l311_c7_0c65] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l311_c7_0c65_cond <= VAR_result_MUX_uxn_device_h_l311_c7_0c65_cond;
     result_MUX_uxn_device_h_l311_c7_0c65_iftrue <= VAR_result_MUX_uxn_device_h_l311_c7_0c65_iftrue;
     result_MUX_uxn_device_h_l311_c7_0c65_iffalse <= VAR_result_MUX_uxn_device_h_l311_c7_0c65_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l311_c7_0c65_return_output := result_MUX_uxn_device_h_l311_c7_0c65_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iffalse := VAR_result_MUX_uxn_device_h_l311_c7_0c65_return_output;
     -- result_MUX[uxn_device_h_l306_c7_b3a7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l306_c7_b3a7_cond <= VAR_result_MUX_uxn_device_h_l306_c7_b3a7_cond;
     result_MUX_uxn_device_h_l306_c7_b3a7_iftrue <= VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iftrue;
     result_MUX_uxn_device_h_l306_c7_b3a7_iffalse <= VAR_result_MUX_uxn_device_h_l306_c7_b3a7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l306_c7_b3a7_return_output := result_MUX_uxn_device_h_l306_c7_b3a7_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l301_c2_a72d_iffalse := VAR_result_MUX_uxn_device_h_l306_c7_b3a7_return_output;
     -- result_MUX[uxn_device_h_l301_c2_a72d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l301_c2_a72d_cond <= VAR_result_MUX_uxn_device_h_l301_c2_a72d_cond;
     result_MUX_uxn_device_h_l301_c2_a72d_iftrue <= VAR_result_MUX_uxn_device_h_l301_c2_a72d_iftrue;
     result_MUX_uxn_device_h_l301_c2_a72d_iffalse <= VAR_result_MUX_uxn_device_h_l301_c2_a72d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l301_c2_a72d_return_output := result_MUX_uxn_device_h_l301_c2_a72d_return_output;

     -- Submodule level 10
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l301_c2_a72d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l301_c2_a72d_return_output;
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
