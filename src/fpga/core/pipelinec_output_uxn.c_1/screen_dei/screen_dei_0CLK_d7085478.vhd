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
-- BIN_OP_EQ[uxn_device_h_l315_c6_1496]
signal BIN_OP_EQ_uxn_device_h_l315_c6_1496_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c6_1496_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c7_64e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l315_c2_09cb]
signal result_MUX_uxn_device_h_l315_c2_09cb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l315_c2_09cb_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c2_09cb_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l315_c2_09cb_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l320_c11_62a0]
signal BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l325_c7_1167]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l320_c7_64e7]
signal result_MUX_uxn_device_h_l320_c7_64e7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l320_c7_64e7_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l320_c7_64e7_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l320_c7_64e7_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l325_c11_9d35]
signal BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l330_c7_6da1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l325_c7_1167]
signal result_MUX_uxn_device_h_l325_c7_1167_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l325_c7_1167_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l325_c7_1167_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l325_c7_1167_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l330_c11_79af]
signal BIN_OP_EQ_uxn_device_h_l330_c11_79af_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l330_c11_79af_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c1_07e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l330_c7_6da1]
signal result_MUX_uxn_device_h_l330_c7_6da1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l330_c7_6da1_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l330_c7_6da1_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l330_c7_6da1_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l336_c12_fb59]
signal generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l336_c12_fb59_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l336_c12_fb59_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l336_c12_fb59_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l315_c6_1496
BIN_OP_EQ_uxn_device_h_l315_c6_1496 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l315_c6_1496_left,
BIN_OP_EQ_uxn_device_h_l315_c6_1496_right,
BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output);

-- result_MUX_uxn_device_h_l315_c2_09cb
result_MUX_uxn_device_h_l315_c2_09cb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l315_c2_09cb_cond,
result_MUX_uxn_device_h_l315_c2_09cb_iftrue,
result_MUX_uxn_device_h_l315_c2_09cb_iffalse,
result_MUX_uxn_device_h_l315_c2_09cb_return_output);

-- BIN_OP_EQ_uxn_device_h_l320_c11_62a0
BIN_OP_EQ_uxn_device_h_l320_c11_62a0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left,
BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right,
BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output);

-- result_MUX_uxn_device_h_l320_c7_64e7
result_MUX_uxn_device_h_l320_c7_64e7 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l320_c7_64e7_cond,
result_MUX_uxn_device_h_l320_c7_64e7_iftrue,
result_MUX_uxn_device_h_l320_c7_64e7_iffalse,
result_MUX_uxn_device_h_l320_c7_64e7_return_output);

-- BIN_OP_EQ_uxn_device_h_l325_c11_9d35
BIN_OP_EQ_uxn_device_h_l325_c11_9d35 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left,
BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right,
BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output);

-- result_MUX_uxn_device_h_l325_c7_1167
result_MUX_uxn_device_h_l325_c7_1167 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l325_c7_1167_cond,
result_MUX_uxn_device_h_l325_c7_1167_iftrue,
result_MUX_uxn_device_h_l325_c7_1167_iffalse,
result_MUX_uxn_device_h_l325_c7_1167_return_output);

-- BIN_OP_EQ_uxn_device_h_l330_c11_79af
BIN_OP_EQ_uxn_device_h_l330_c11_79af : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l330_c11_79af_left,
BIN_OP_EQ_uxn_device_h_l330_c11_79af_right,
BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output);

-- result_MUX_uxn_device_h_l330_c7_6da1
result_MUX_uxn_device_h_l330_c7_6da1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l330_c7_6da1_cond,
result_MUX_uxn_device_h_l330_c7_6da1_iftrue,
result_MUX_uxn_device_h_l330_c7_6da1_iffalse,
result_MUX_uxn_device_h_l330_c7_6da1_return_output);

-- generic_dei_uxn_device_h_l336_c12_fb59
generic_dei_uxn_device_h_l336_c12_fb59 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE,
generic_dei_uxn_device_h_l336_c12_fb59_device_address,
generic_dei_uxn_device_h_l336_c12_fb59_phase,
generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read,
generic_dei_uxn_device_h_l336_c12_fb59_return_output);



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
 BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output,
 result_MUX_uxn_device_h_l315_c2_09cb_return_output,
 BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output,
 result_MUX_uxn_device_h_l320_c7_64e7_return_output,
 BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output,
 result_MUX_uxn_device_h_l325_c7_1167_return_output,
 BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output,
 result_MUX_uxn_device_h_l330_c7_6da1_return_output,
 generic_dei_uxn_device_h_l336_c12_fb59_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l315_c2_09cb_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c2_09cb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c2_09cb_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_64e7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c2_09cb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l315_c2_09cb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l316_c3_9c06 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l320_c7_64e7_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_64e7_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_64e7_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_1167_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l320_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l321_c3_f51e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l325_c7_1167_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_1167_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_1167_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c7_6da1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l325_c7_1167_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l326_c3_14cc : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l330_c7_6da1_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l330_c7_6da1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c7_6da1_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l330_c7_6da1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l331_c3_5379 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l336_c12_fb59_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l336_c12_fb59_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l336_c12_fb59_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l316_c3_9c06 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l326_c3_14cc := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right := to_unsigned(4, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_right := to_unsigned(5, 4);
     VAR_result_device_ram_address_uxn_device_h_l331_c3_5379 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l321_c3_f51e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l315_c2_09cb] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c2_09cb_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l316_c3_9c06,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l325_c7_1167] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_1167_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l326_c3_14cc,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l320_c7_64e7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_64e7_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l321_c3_f51e,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l330_c7_6da1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l330_c7_6da1_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l331_c3_5379,
     to_unsigned(234, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l320_c7_64e7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l320_c7_64e7_return_output;
     VAR_result_MUX_uxn_device_h_l330_c7_6da1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l330_c7_6da1_return_output;
     VAR_result_MUX_uxn_device_h_l325_c7_1167_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l325_c7_1167_return_output;
     VAR_result_MUX_uxn_device_h_l315_c2_09cb_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l315_c2_09cb_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l336_c12_fb59_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l336_c12_fb59_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l314_c16_7b67] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_left := VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left := VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left := VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_left := VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l314_c16_7b67_return_output;
     -- BIN_OP_EQ[uxn_device_h_l330_c11_79af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l330_c11_79af_left <= VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_left;
     BIN_OP_EQ_uxn_device_h_l330_c11_79af_right <= VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output := BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output;

     -- BIN_OP_EQ[uxn_device_h_l315_c6_1496] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l315_c6_1496_left <= VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_left;
     BIN_OP_EQ_uxn_device_h_l315_c6_1496_right <= VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output := BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output;

     -- BIN_OP_EQ[uxn_device_h_l325_c11_9d35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left <= VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_left;
     BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right <= VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output := BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output;

     -- BIN_OP_EQ[uxn_device_h_l320_c11_62a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left <= VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_left;
     BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right <= VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output := BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output;
     VAR_result_MUX_uxn_device_h_l315_c2_09cb_cond := VAR_BIN_OP_EQ_uxn_device_h_l315_c6_1496_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond := VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output;
     VAR_result_MUX_uxn_device_h_l320_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_device_h_l320_c11_62a0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond := VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output;
     VAR_result_MUX_uxn_device_h_l325_c7_1167_cond := VAR_BIN_OP_EQ_uxn_device_h_l325_c11_9d35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond := VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output;
     VAR_result_MUX_uxn_device_h_l330_c7_6da1_cond := VAR_BIN_OP_EQ_uxn_device_h_l330_c11_79af_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l320_c7_64e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l320_c7_64e7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l325_c7_1167] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l325_c7_1167_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l330_c7_6da1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l330_c7_6da1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c1_07e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_07e4_return_output;
     -- generic_dei[uxn_device_h_l336_c12_fb59] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l336_c12_fb59_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l336_c12_fb59_device_address <= VAR_generic_dei_uxn_device_h_l336_c12_fb59_device_address;
     generic_dei_uxn_device_h_l336_c12_fb59_phase <= VAR_generic_dei_uxn_device_h_l336_c12_fb59_phase;
     generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l336_c12_fb59_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l336_c12_fb59_return_output := generic_dei_uxn_device_h_l336_c12_fb59_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l330_c7_6da1_iffalse := VAR_generic_dei_uxn_device_h_l336_c12_fb59_return_output;
     -- result_MUX[uxn_device_h_l330_c7_6da1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l330_c7_6da1_cond <= VAR_result_MUX_uxn_device_h_l330_c7_6da1_cond;
     result_MUX_uxn_device_h_l330_c7_6da1_iftrue <= VAR_result_MUX_uxn_device_h_l330_c7_6da1_iftrue;
     result_MUX_uxn_device_h_l330_c7_6da1_iffalse <= VAR_result_MUX_uxn_device_h_l330_c7_6da1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l330_c7_6da1_return_output := result_MUX_uxn_device_h_l330_c7_6da1_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l325_c7_1167_iffalse := VAR_result_MUX_uxn_device_h_l330_c7_6da1_return_output;
     -- result_MUX[uxn_device_h_l325_c7_1167] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l325_c7_1167_cond <= VAR_result_MUX_uxn_device_h_l325_c7_1167_cond;
     result_MUX_uxn_device_h_l325_c7_1167_iftrue <= VAR_result_MUX_uxn_device_h_l325_c7_1167_iftrue;
     result_MUX_uxn_device_h_l325_c7_1167_iffalse <= VAR_result_MUX_uxn_device_h_l325_c7_1167_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l325_c7_1167_return_output := result_MUX_uxn_device_h_l325_c7_1167_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l320_c7_64e7_iffalse := VAR_result_MUX_uxn_device_h_l325_c7_1167_return_output;
     -- result_MUX[uxn_device_h_l320_c7_64e7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l320_c7_64e7_cond <= VAR_result_MUX_uxn_device_h_l320_c7_64e7_cond;
     result_MUX_uxn_device_h_l320_c7_64e7_iftrue <= VAR_result_MUX_uxn_device_h_l320_c7_64e7_iftrue;
     result_MUX_uxn_device_h_l320_c7_64e7_iffalse <= VAR_result_MUX_uxn_device_h_l320_c7_64e7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l320_c7_64e7_return_output := result_MUX_uxn_device_h_l320_c7_64e7_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l315_c2_09cb_iffalse := VAR_result_MUX_uxn_device_h_l320_c7_64e7_return_output;
     -- result_MUX[uxn_device_h_l315_c2_09cb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l315_c2_09cb_cond <= VAR_result_MUX_uxn_device_h_l315_c2_09cb_cond;
     result_MUX_uxn_device_h_l315_c2_09cb_iftrue <= VAR_result_MUX_uxn_device_h_l315_c2_09cb_iftrue;
     result_MUX_uxn_device_h_l315_c2_09cb_iffalse <= VAR_result_MUX_uxn_device_h_l315_c2_09cb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l315_c2_09cb_return_output := result_MUX_uxn_device_h_l315_c2_09cb_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l315_c2_09cb_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l315_c2_09cb_return_output;
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
