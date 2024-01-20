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
-- BIN_OP_EQ[uxn_device_h_l340_c6_26dd]
signal BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l345_c7_3d7e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l340_c2_fb49]
signal result_MUX_uxn_device_h_l340_c2_fb49_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l340_c2_fb49_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l340_c2_fb49_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l340_c2_fb49_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l345_c11_0a8f]
signal BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l350_c7_9219]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l345_c7_3d7e]
signal result_MUX_uxn_device_h_l345_c7_3d7e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l345_c7_3d7e_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l345_c7_3d7e_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l345_c7_3d7e_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l350_c11_53b1]
signal BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l355_c7_cde8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l350_c7_9219]
signal result_MUX_uxn_device_h_l350_c7_9219_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l350_c7_9219_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l350_c7_9219_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l350_c7_9219_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l355_c11_3319]
signal BIN_OP_EQ_uxn_device_h_l355_c11_3319_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l355_c11_3319_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l360_c1_d06b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l355_c7_cde8]
signal result_MUX_uxn_device_h_l355_c7_cde8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l355_c7_cde8_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l355_c7_cde8_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l355_c7_cde8_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l361_c12_734f]
signal generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l361_c12_734f_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l361_c12_734f_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l361_c12_734f_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l340_c6_26dd
BIN_OP_EQ_uxn_device_h_l340_c6_26dd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left,
BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right,
BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output);

-- result_MUX_uxn_device_h_l340_c2_fb49
result_MUX_uxn_device_h_l340_c2_fb49 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l340_c2_fb49_cond,
result_MUX_uxn_device_h_l340_c2_fb49_iftrue,
result_MUX_uxn_device_h_l340_c2_fb49_iffalse,
result_MUX_uxn_device_h_l340_c2_fb49_return_output);

-- BIN_OP_EQ_uxn_device_h_l345_c11_0a8f
BIN_OP_EQ_uxn_device_h_l345_c11_0a8f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left,
BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right,
BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output);

-- result_MUX_uxn_device_h_l345_c7_3d7e
result_MUX_uxn_device_h_l345_c7_3d7e : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l345_c7_3d7e_cond,
result_MUX_uxn_device_h_l345_c7_3d7e_iftrue,
result_MUX_uxn_device_h_l345_c7_3d7e_iffalse,
result_MUX_uxn_device_h_l345_c7_3d7e_return_output);

-- BIN_OP_EQ_uxn_device_h_l350_c11_53b1
BIN_OP_EQ_uxn_device_h_l350_c11_53b1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left,
BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right,
BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output);

-- result_MUX_uxn_device_h_l350_c7_9219
result_MUX_uxn_device_h_l350_c7_9219 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l350_c7_9219_cond,
result_MUX_uxn_device_h_l350_c7_9219_iftrue,
result_MUX_uxn_device_h_l350_c7_9219_iffalse,
result_MUX_uxn_device_h_l350_c7_9219_return_output);

-- BIN_OP_EQ_uxn_device_h_l355_c11_3319
BIN_OP_EQ_uxn_device_h_l355_c11_3319 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l355_c11_3319_left,
BIN_OP_EQ_uxn_device_h_l355_c11_3319_right,
BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output);

-- result_MUX_uxn_device_h_l355_c7_cde8
result_MUX_uxn_device_h_l355_c7_cde8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l355_c7_cde8_cond,
result_MUX_uxn_device_h_l355_c7_cde8_iftrue,
result_MUX_uxn_device_h_l355_c7_cde8_iffalse,
result_MUX_uxn_device_h_l355_c7_cde8_return_output);

-- generic_dei_uxn_device_h_l361_c12_734f
generic_dei_uxn_device_h_l361_c12_734f : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE,
generic_dei_uxn_device_h_l361_c12_734f_device_address,
generic_dei_uxn_device_h_l361_c12_734f_phase,
generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read,
generic_dei_uxn_device_h_l361_c12_734f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output,
 result_MUX_uxn_device_h_l340_c2_fb49_return_output,
 BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output,
 result_MUX_uxn_device_h_l345_c7_3d7e_return_output,
 BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output,
 result_MUX_uxn_device_h_l350_c7_9219_return_output,
 BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output,
 result_MUX_uxn_device_h_l355_c7_cde8_return_output,
 generic_dei_uxn_device_h_l361_c12_734f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l340_c2_fb49_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l340_c2_fb49_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l340_c2_fb49_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l345_c7_3d7e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l340_c2_fb49_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l340_c2_fb49_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l341_c3_e9d8 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l345_c7_3d7e_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l350_c7_9219_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l345_c7_3d7e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l346_c3_cf33 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l350_c7_9219_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l350_c7_9219_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l350_c7_9219_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l355_c7_cde8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l350_c7_9219_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l351_c3_171e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l355_c7_cde8_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l355_c7_cde8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l355_c7_cde8_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l355_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l356_c3_5c4b : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l361_c12_734f_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l361_c12_734f_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l361_c12_734f_return_output : device_in_result_t;
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
     VAR_result_device_ram_address_uxn_device_h_l356_c3_5c4b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l341_c3_e9d8 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l351_c3_171e := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right := to_unsigned(3, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_right := to_unsigned(5, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l346_c3_cf33 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right := to_unsigned(4, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l350_c7_9219] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l350_c7_9219_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l351_c3_171e,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l355_c7_cde8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l355_c7_cde8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l356_c3_5c4b,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l345_c7_3d7e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l345_c7_3d7e_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l346_c3_cf33,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l340_c2_fb49] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l340_c2_fb49_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l341_c3_e9d8,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l350_c7_9219_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l350_c7_9219_return_output;
     VAR_result_MUX_uxn_device_h_l340_c2_fb49_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l340_c2_fb49_return_output;
     VAR_result_MUX_uxn_device_h_l355_c7_cde8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l355_c7_cde8_return_output;
     VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l345_c7_3d7e_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l361_c12_734f_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l361_c12_734f_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l339_c16_3eb7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left := VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left := VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left := VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_left := VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l339_c16_3eb7_return_output;
     -- BIN_OP_EQ[uxn_device_h_l345_c11_0a8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left <= VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_left;
     BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right <= VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output := BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l340_c6_26dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_left;
     BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output := BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l350_c11_53b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_left;
     BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output := BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l355_c11_3319] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l355_c11_3319_left <= VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_left;
     BIN_OP_EQ_uxn_device_h_l355_c11_3319_right <= VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output := BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output;
     VAR_result_MUX_uxn_device_h_l340_c2_fb49_cond := VAR_BIN_OP_EQ_uxn_device_h_l340_c6_26dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond := VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output;
     VAR_result_MUX_uxn_device_h_l345_c7_3d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l345_c11_0a8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output;
     VAR_result_MUX_uxn_device_h_l350_c7_9219_cond := VAR_BIN_OP_EQ_uxn_device_h_l350_c11_53b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond := VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output;
     VAR_result_MUX_uxn_device_h_l355_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_device_h_l355_c11_3319_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l345_c7_3d7e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l345_c7_3d7e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l350_c7_9219] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l350_c7_9219_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l355_c7_cde8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l355_c7_cde8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l360_c1_d06b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l360_c1_d06b_return_output;
     -- generic_dei[uxn_device_h_l361_c12_734f] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l361_c12_734f_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l361_c12_734f_device_address <= VAR_generic_dei_uxn_device_h_l361_c12_734f_device_address;
     generic_dei_uxn_device_h_l361_c12_734f_phase <= VAR_generic_dei_uxn_device_h_l361_c12_734f_phase;
     generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l361_c12_734f_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l361_c12_734f_return_output := generic_dei_uxn_device_h_l361_c12_734f_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l355_c7_cde8_iffalse := VAR_generic_dei_uxn_device_h_l361_c12_734f_return_output;
     -- result_MUX[uxn_device_h_l355_c7_cde8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l355_c7_cde8_cond <= VAR_result_MUX_uxn_device_h_l355_c7_cde8_cond;
     result_MUX_uxn_device_h_l355_c7_cde8_iftrue <= VAR_result_MUX_uxn_device_h_l355_c7_cde8_iftrue;
     result_MUX_uxn_device_h_l355_c7_cde8_iffalse <= VAR_result_MUX_uxn_device_h_l355_c7_cde8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l355_c7_cde8_return_output := result_MUX_uxn_device_h_l355_c7_cde8_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l350_c7_9219_iffalse := VAR_result_MUX_uxn_device_h_l355_c7_cde8_return_output;
     -- result_MUX[uxn_device_h_l350_c7_9219] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l350_c7_9219_cond <= VAR_result_MUX_uxn_device_h_l350_c7_9219_cond;
     result_MUX_uxn_device_h_l350_c7_9219_iftrue <= VAR_result_MUX_uxn_device_h_l350_c7_9219_iftrue;
     result_MUX_uxn_device_h_l350_c7_9219_iffalse <= VAR_result_MUX_uxn_device_h_l350_c7_9219_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l350_c7_9219_return_output := result_MUX_uxn_device_h_l350_c7_9219_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iffalse := VAR_result_MUX_uxn_device_h_l350_c7_9219_return_output;
     -- result_MUX[uxn_device_h_l345_c7_3d7e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l345_c7_3d7e_cond <= VAR_result_MUX_uxn_device_h_l345_c7_3d7e_cond;
     result_MUX_uxn_device_h_l345_c7_3d7e_iftrue <= VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iftrue;
     result_MUX_uxn_device_h_l345_c7_3d7e_iffalse <= VAR_result_MUX_uxn_device_h_l345_c7_3d7e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l345_c7_3d7e_return_output := result_MUX_uxn_device_h_l345_c7_3d7e_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l340_c2_fb49_iffalse := VAR_result_MUX_uxn_device_h_l345_c7_3d7e_return_output;
     -- result_MUX[uxn_device_h_l340_c2_fb49] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l340_c2_fb49_cond <= VAR_result_MUX_uxn_device_h_l340_c2_fb49_cond;
     result_MUX_uxn_device_h_l340_c2_fb49_iftrue <= VAR_result_MUX_uxn_device_h_l340_c2_fb49_iftrue;
     result_MUX_uxn_device_h_l340_c2_fb49_iffalse <= VAR_result_MUX_uxn_device_h_l340_c2_fb49_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l340_c2_fb49_return_output := result_MUX_uxn_device_h_l340_c2_fb49_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l340_c2_fb49_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l340_c2_fb49_return_output;
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
