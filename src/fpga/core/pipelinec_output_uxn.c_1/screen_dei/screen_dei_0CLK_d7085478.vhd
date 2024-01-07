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
-- Submodules: 18
entity screen_dei_0CLK_d7085478 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_d7085478;
architecture arch of screen_dei_0CLK_d7085478 is
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
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l295_c6_b888]
signal BIN_OP_EQ_uxn_device_h_l295_c6_b888_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c6_b888_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l300_c7_5a93]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l295_c2_4755]
signal result_MUX_uxn_device_h_l295_c2_4755_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l295_c2_4755_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l295_c2_4755_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l295_c2_4755_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l300_c11_ed2c]
signal BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l305_c7_c146]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l300_c7_5a93]
signal result_MUX_uxn_device_h_l300_c7_5a93_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l300_c7_5a93_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l300_c7_5a93_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l300_c7_5a93_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l305_c11_05ee]
signal BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l310_c7_46c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l305_c7_c146]
signal result_MUX_uxn_device_h_l305_c7_c146_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l305_c7_c146_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l305_c7_c146_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l305_c7_c146_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l310_c11_9d0b]
signal BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c1_4a95]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l310_c7_46c2]
signal result_MUX_uxn_device_h_l310_c7_46c2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l310_c7_46c2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c7_46c2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l310_c7_46c2_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l316_c12_24c8]
signal generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l316_c12_24c8_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l316_c12_24c8_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l316_c12_24c8_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

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
-- BIN_OP_EQ_uxn_device_h_l295_c6_b888
BIN_OP_EQ_uxn_device_h_l295_c6_b888 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l295_c6_b888_left,
BIN_OP_EQ_uxn_device_h_l295_c6_b888_right,
BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output);

-- result_MUX_uxn_device_h_l295_c2_4755
result_MUX_uxn_device_h_l295_c2_4755 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l295_c2_4755_cond,
result_MUX_uxn_device_h_l295_c2_4755_iftrue,
result_MUX_uxn_device_h_l295_c2_4755_iffalse,
result_MUX_uxn_device_h_l295_c2_4755_return_output);

-- BIN_OP_EQ_uxn_device_h_l300_c11_ed2c
BIN_OP_EQ_uxn_device_h_l300_c11_ed2c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left,
BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right,
BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output);

-- result_MUX_uxn_device_h_l300_c7_5a93
result_MUX_uxn_device_h_l300_c7_5a93 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l300_c7_5a93_cond,
result_MUX_uxn_device_h_l300_c7_5a93_iftrue,
result_MUX_uxn_device_h_l300_c7_5a93_iffalse,
result_MUX_uxn_device_h_l300_c7_5a93_return_output);

-- BIN_OP_EQ_uxn_device_h_l305_c11_05ee
BIN_OP_EQ_uxn_device_h_l305_c11_05ee : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left,
BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right,
BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output);

-- result_MUX_uxn_device_h_l305_c7_c146
result_MUX_uxn_device_h_l305_c7_c146 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l305_c7_c146_cond,
result_MUX_uxn_device_h_l305_c7_c146_iftrue,
result_MUX_uxn_device_h_l305_c7_c146_iffalse,
result_MUX_uxn_device_h_l305_c7_c146_return_output);

-- BIN_OP_EQ_uxn_device_h_l310_c11_9d0b
BIN_OP_EQ_uxn_device_h_l310_c11_9d0b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left,
BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right,
BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output);

-- result_MUX_uxn_device_h_l310_c7_46c2
result_MUX_uxn_device_h_l310_c7_46c2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l310_c7_46c2_cond,
result_MUX_uxn_device_h_l310_c7_46c2_iftrue,
result_MUX_uxn_device_h_l310_c7_46c2_iffalse,
result_MUX_uxn_device_h_l310_c7_46c2_return_output);

-- generic_dei_uxn_device_h_l316_c12_24c8
generic_dei_uxn_device_h_l316_c12_24c8 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE,
generic_dei_uxn_device_h_l316_c12_24c8_device_address,
generic_dei_uxn_device_h_l316_c12_24c8_phase,
generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read,
generic_dei_uxn_device_h_l316_c12_24c8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output,
 result_MUX_uxn_device_h_l295_c2_4755_return_output,
 BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output,
 result_MUX_uxn_device_h_l300_c7_5a93_return_output,
 BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output,
 result_MUX_uxn_device_h_l305_c7_c146_return_output,
 BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output,
 result_MUX_uxn_device_h_l310_c7_46c2_return_output,
 generic_dei_uxn_device_h_l316_c12_24c8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l295_c2_4755_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l295_c2_4755_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l295_c2_4755_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l300_c7_5a93_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l295_c2_4755_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l295_c2_4755_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l296_c3_b8f5 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l300_c7_5a93_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l300_c7_5a93_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l300_c7_5a93_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l305_c7_c146_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l300_c7_5a93_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l301_c3_ff06 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l305_c7_c146_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l305_c7_c146_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l305_c7_c146_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_46c2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l305_c7_c146_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l306_c3_6e64 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l310_c7_46c2_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c7_46c2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_46c2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l310_c7_46c2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l311_c3_5d59 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l316_c12_24c8_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l316_c12_24c8_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l316_c12_24c8_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l301_c3_ff06 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right := to_unsigned(3, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right := to_unsigned(5, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l306_c3_6e64 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l296_c3_b8f5 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l311_c3_5d59 := resize(to_unsigned(0, 1), 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l310_c7_46c2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c7_46c2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l311_c3_5d59,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l305_c7_c146] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l305_c7_c146_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l306_c3_6e64,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l295_c2_4755] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l295_c2_4755_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l296_c3_b8f5,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l300_c7_5a93] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l300_c7_5a93_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l301_c3_ff06,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l300_c7_5a93_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l300_c7_5a93_return_output;
     VAR_result_MUX_uxn_device_h_l295_c2_4755_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l295_c2_4755_return_output;
     VAR_result_MUX_uxn_device_h_l305_c7_c146_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l305_c7_c146_return_output;
     VAR_result_MUX_uxn_device_h_l310_c7_46c2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l310_c7_46c2_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l316_c12_24c8_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l316_c12_24c8_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l294_c16_1839] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_left := VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left := VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left := VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left := VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l294_c16_1839_return_output;
     -- BIN_OP_EQ[uxn_device_h_l295_c6_b888] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l295_c6_b888_left <= VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_left;
     BIN_OP_EQ_uxn_device_h_l295_c6_b888_right <= VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output := BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output;

     -- BIN_OP_EQ[uxn_device_h_l305_c11_05ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left <= VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_left;
     BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right <= VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output := BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output;

     -- BIN_OP_EQ[uxn_device_h_l300_c11_ed2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left <= VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_left;
     BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right <= VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output := BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l310_c11_9d0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left <= VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_left;
     BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right <= VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output := BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output;
     VAR_result_MUX_uxn_device_h_l295_c2_4755_cond := VAR_BIN_OP_EQ_uxn_device_h_l295_c6_b888_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond := VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output;
     VAR_result_MUX_uxn_device_h_l300_c7_5a93_cond := VAR_BIN_OP_EQ_uxn_device_h_l300_c11_ed2c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output;
     VAR_result_MUX_uxn_device_h_l305_c7_c146_cond := VAR_BIN_OP_EQ_uxn_device_h_l305_c11_05ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output;
     VAR_result_MUX_uxn_device_h_l310_c7_46c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l310_c11_9d0b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l300_c7_5a93] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l300_c7_5a93_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l305_c7_c146] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l305_c7_c146_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l310_c7_46c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l310_c7_46c2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l315_c1_4a95] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l315_c1_4a95_return_output;
     -- generic_dei[uxn_device_h_l316_c12_24c8] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l316_c12_24c8_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l316_c12_24c8_device_address <= VAR_generic_dei_uxn_device_h_l316_c12_24c8_device_address;
     generic_dei_uxn_device_h_l316_c12_24c8_phase <= VAR_generic_dei_uxn_device_h_l316_c12_24c8_phase;
     generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l316_c12_24c8_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l316_c12_24c8_return_output := generic_dei_uxn_device_h_l316_c12_24c8_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l310_c7_46c2_iffalse := VAR_generic_dei_uxn_device_h_l316_c12_24c8_return_output;
     -- result_MUX[uxn_device_h_l310_c7_46c2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l310_c7_46c2_cond <= VAR_result_MUX_uxn_device_h_l310_c7_46c2_cond;
     result_MUX_uxn_device_h_l310_c7_46c2_iftrue <= VAR_result_MUX_uxn_device_h_l310_c7_46c2_iftrue;
     result_MUX_uxn_device_h_l310_c7_46c2_iffalse <= VAR_result_MUX_uxn_device_h_l310_c7_46c2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l310_c7_46c2_return_output := result_MUX_uxn_device_h_l310_c7_46c2_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l305_c7_c146_iffalse := VAR_result_MUX_uxn_device_h_l310_c7_46c2_return_output;
     -- result_MUX[uxn_device_h_l305_c7_c146] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l305_c7_c146_cond <= VAR_result_MUX_uxn_device_h_l305_c7_c146_cond;
     result_MUX_uxn_device_h_l305_c7_c146_iftrue <= VAR_result_MUX_uxn_device_h_l305_c7_c146_iftrue;
     result_MUX_uxn_device_h_l305_c7_c146_iffalse <= VAR_result_MUX_uxn_device_h_l305_c7_c146_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l305_c7_c146_return_output := result_MUX_uxn_device_h_l305_c7_c146_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l300_c7_5a93_iffalse := VAR_result_MUX_uxn_device_h_l305_c7_c146_return_output;
     -- result_MUX[uxn_device_h_l300_c7_5a93] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l300_c7_5a93_cond <= VAR_result_MUX_uxn_device_h_l300_c7_5a93_cond;
     result_MUX_uxn_device_h_l300_c7_5a93_iftrue <= VAR_result_MUX_uxn_device_h_l300_c7_5a93_iftrue;
     result_MUX_uxn_device_h_l300_c7_5a93_iffalse <= VAR_result_MUX_uxn_device_h_l300_c7_5a93_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l300_c7_5a93_return_output := result_MUX_uxn_device_h_l300_c7_5a93_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l295_c2_4755_iffalse := VAR_result_MUX_uxn_device_h_l300_c7_5a93_return_output;
     -- result_MUX[uxn_device_h_l295_c2_4755] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l295_c2_4755_cond <= VAR_result_MUX_uxn_device_h_l295_c2_4755_cond;
     result_MUX_uxn_device_h_l295_c2_4755_iftrue <= VAR_result_MUX_uxn_device_h_l295_c2_4755_iftrue;
     result_MUX_uxn_device_h_l295_c2_4755_iffalse <= VAR_result_MUX_uxn_device_h_l295_c2_4755_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l295_c2_4755_return_output := result_MUX_uxn_device_h_l295_c2_4755_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l295_c2_4755_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l295_c2_4755_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
