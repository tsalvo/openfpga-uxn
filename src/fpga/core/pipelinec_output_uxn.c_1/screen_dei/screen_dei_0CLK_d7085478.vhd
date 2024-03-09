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
-- BIN_OP_EQ[uxn_device_h_l493_c6_c819]
signal BIN_OP_EQ_uxn_device_h_l493_c6_c819_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l493_c6_c819_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l498_c7_7d76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l493_c2_ec26]
signal result_MUX_uxn_device_h_l493_c2_ec26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l493_c2_ec26_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l493_c2_ec26_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l493_c2_ec26_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l498_c11_7c8f]
signal BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l503_c7_19ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l498_c7_7d76]
signal result_MUX_uxn_device_h_l498_c7_7d76_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l498_c7_7d76_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l498_c7_7d76_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l498_c7_7d76_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l503_c11_4268]
signal BIN_OP_EQ_uxn_device_h_l503_c11_4268_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l503_c11_4268_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_a60c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l503_c7_19ff]
signal result_MUX_uxn_device_h_l503_c7_19ff_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l503_c7_19ff_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l503_c7_19ff_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l503_c7_19ff_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l508_c11_4a31]
signal BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l513_c1_92ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l508_c7_a60c]
signal result_MUX_uxn_device_h_l508_c7_a60c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l508_c7_a60c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_a60c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_a60c_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l514_c12_4a6a]
signal generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l514_c12_4a6a_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_4a6a_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_4a6a_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l493_c6_c819
BIN_OP_EQ_uxn_device_h_l493_c6_c819 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l493_c6_c819_left,
BIN_OP_EQ_uxn_device_h_l493_c6_c819_right,
BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output);

-- result_MUX_uxn_device_h_l493_c2_ec26
result_MUX_uxn_device_h_l493_c2_ec26 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l493_c2_ec26_cond,
result_MUX_uxn_device_h_l493_c2_ec26_iftrue,
result_MUX_uxn_device_h_l493_c2_ec26_iffalse,
result_MUX_uxn_device_h_l493_c2_ec26_return_output);

-- BIN_OP_EQ_uxn_device_h_l498_c11_7c8f
BIN_OP_EQ_uxn_device_h_l498_c11_7c8f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left,
BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right,
BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output);

-- result_MUX_uxn_device_h_l498_c7_7d76
result_MUX_uxn_device_h_l498_c7_7d76 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l498_c7_7d76_cond,
result_MUX_uxn_device_h_l498_c7_7d76_iftrue,
result_MUX_uxn_device_h_l498_c7_7d76_iffalse,
result_MUX_uxn_device_h_l498_c7_7d76_return_output);

-- BIN_OP_EQ_uxn_device_h_l503_c11_4268
BIN_OP_EQ_uxn_device_h_l503_c11_4268 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l503_c11_4268_left,
BIN_OP_EQ_uxn_device_h_l503_c11_4268_right,
BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output);

-- result_MUX_uxn_device_h_l503_c7_19ff
result_MUX_uxn_device_h_l503_c7_19ff : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l503_c7_19ff_cond,
result_MUX_uxn_device_h_l503_c7_19ff_iftrue,
result_MUX_uxn_device_h_l503_c7_19ff_iffalse,
result_MUX_uxn_device_h_l503_c7_19ff_return_output);

-- BIN_OP_EQ_uxn_device_h_l508_c11_4a31
BIN_OP_EQ_uxn_device_h_l508_c11_4a31 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left,
BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right,
BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output);

-- result_MUX_uxn_device_h_l508_c7_a60c
result_MUX_uxn_device_h_l508_c7_a60c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l508_c7_a60c_cond,
result_MUX_uxn_device_h_l508_c7_a60c_iftrue,
result_MUX_uxn_device_h_l508_c7_a60c_iffalse,
result_MUX_uxn_device_h_l508_c7_a60c_return_output);

-- generic_dei_uxn_device_h_l514_c12_4a6a
generic_dei_uxn_device_h_l514_c12_4a6a : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE,
generic_dei_uxn_device_h_l514_c12_4a6a_device_address,
generic_dei_uxn_device_h_l514_c12_4a6a_phase,
generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read,
generic_dei_uxn_device_h_l514_c12_4a6a_return_output);



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
 BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output,
 result_MUX_uxn_device_h_l493_c2_ec26_return_output,
 BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output,
 result_MUX_uxn_device_h_l498_c7_7d76_return_output,
 BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output,
 result_MUX_uxn_device_h_l503_c7_19ff_return_output,
 BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output,
 result_MUX_uxn_device_h_l508_c7_a60c_return_output,
 generic_dei_uxn_device_h_l514_c12_4a6a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l493_c2_ec26_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_ec26_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_ec26_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_7d76_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_ec26_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_ec26_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l494_c3_91c6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l498_c7_7d76_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_7d76_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_7d76_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_19ff_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_7d76_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l499_c3_595f : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l503_c7_19ff_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_19ff_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_19ff_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_a60c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_19ff_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l504_c3_a38c : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l508_c7_a60c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_a60c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_a60c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_a60c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l509_c3_a5a6 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_4a6a_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_4a6a_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_4a6a_return_output : device_in_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right := to_unsigned(5, 4);
     VAR_result_device_ram_address_uxn_device_h_l504_c3_a38c := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l499_c3_595f := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_uxn_device_h_l509_c3_a5a6 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l494_c3_91c6 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l508_c7_a60c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_a60c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l509_c3_a5a6,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l503_c7_19ff] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_19ff_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l504_c3_a38c,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l498_c7_7d76] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_7d76_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l499_c3_595f,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l493_c2_ec26] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_ec26_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l494_c3_91c6,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l498_c7_7d76_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_7d76_return_output;
     VAR_result_MUX_uxn_device_h_l503_c7_19ff_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_19ff_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_a60c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_a60c_return_output;
     VAR_result_MUX_uxn_device_h_l493_c2_ec26_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_ec26_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l514_c12_4a6a_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l514_c12_4a6a_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l492_c16_18f4] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_18f4_return_output;
     -- BIN_OP_EQ[uxn_device_h_l503_c11_4268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l503_c11_4268_left <= VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_left;
     BIN_OP_EQ_uxn_device_h_l503_c11_4268_right <= VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output := BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output;

     -- BIN_OP_EQ[uxn_device_h_l498_c11_7c8f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left <= VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_left;
     BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right <= VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output := BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l493_c6_c819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l493_c6_c819_left <= VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_left;
     BIN_OP_EQ_uxn_device_h_l493_c6_c819_right <= VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output := BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output;

     -- BIN_OP_EQ[uxn_device_h_l508_c11_4a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_left;
     BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output := BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond := VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output;
     VAR_result_MUX_uxn_device_h_l493_c2_ec26_cond := VAR_BIN_OP_EQ_uxn_device_h_l493_c6_c819_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output;
     VAR_result_MUX_uxn_device_h_l498_c7_7d76_cond := VAR_BIN_OP_EQ_uxn_device_h_l498_c11_7c8f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond := VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output;
     VAR_result_MUX_uxn_device_h_l503_c7_19ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l503_c11_4268_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_a60c_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_4a31_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l498_c7_7d76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_7d76_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l503_c7_19ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_19ff_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_a60c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_a60c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l513_c1_92ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_92ff_return_output;
     -- generic_dei[uxn_device_h_l514_c12_4a6a] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l514_c12_4a6a_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l514_c12_4a6a_device_address <= VAR_generic_dei_uxn_device_h_l514_c12_4a6a_device_address;
     generic_dei_uxn_device_h_l514_c12_4a6a_phase <= VAR_generic_dei_uxn_device_h_l514_c12_4a6a_phase;
     generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l514_c12_4a6a_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l514_c12_4a6a_return_output := generic_dei_uxn_device_h_l514_c12_4a6a_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l508_c7_a60c_iffalse := VAR_generic_dei_uxn_device_h_l514_c12_4a6a_return_output;
     -- result_MUX[uxn_device_h_l508_c7_a60c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l508_c7_a60c_cond <= VAR_result_MUX_uxn_device_h_l508_c7_a60c_cond;
     result_MUX_uxn_device_h_l508_c7_a60c_iftrue <= VAR_result_MUX_uxn_device_h_l508_c7_a60c_iftrue;
     result_MUX_uxn_device_h_l508_c7_a60c_iffalse <= VAR_result_MUX_uxn_device_h_l508_c7_a60c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l508_c7_a60c_return_output := result_MUX_uxn_device_h_l508_c7_a60c_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l503_c7_19ff_iffalse := VAR_result_MUX_uxn_device_h_l508_c7_a60c_return_output;
     -- result_MUX[uxn_device_h_l503_c7_19ff] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l503_c7_19ff_cond <= VAR_result_MUX_uxn_device_h_l503_c7_19ff_cond;
     result_MUX_uxn_device_h_l503_c7_19ff_iftrue <= VAR_result_MUX_uxn_device_h_l503_c7_19ff_iftrue;
     result_MUX_uxn_device_h_l503_c7_19ff_iffalse <= VAR_result_MUX_uxn_device_h_l503_c7_19ff_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l503_c7_19ff_return_output := result_MUX_uxn_device_h_l503_c7_19ff_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l498_c7_7d76_iffalse := VAR_result_MUX_uxn_device_h_l503_c7_19ff_return_output;
     -- result_MUX[uxn_device_h_l498_c7_7d76] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l498_c7_7d76_cond <= VAR_result_MUX_uxn_device_h_l498_c7_7d76_cond;
     result_MUX_uxn_device_h_l498_c7_7d76_iftrue <= VAR_result_MUX_uxn_device_h_l498_c7_7d76_iftrue;
     result_MUX_uxn_device_h_l498_c7_7d76_iffalse <= VAR_result_MUX_uxn_device_h_l498_c7_7d76_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l498_c7_7d76_return_output := result_MUX_uxn_device_h_l498_c7_7d76_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l493_c2_ec26_iffalse := VAR_result_MUX_uxn_device_h_l498_c7_7d76_return_output;
     -- result_MUX[uxn_device_h_l493_c2_ec26] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l493_c2_ec26_cond <= VAR_result_MUX_uxn_device_h_l493_c2_ec26_cond;
     result_MUX_uxn_device_h_l493_c2_ec26_iftrue <= VAR_result_MUX_uxn_device_h_l493_c2_ec26_iftrue;
     result_MUX_uxn_device_h_l493_c2_ec26_iffalse <= VAR_result_MUX_uxn_device_h_l493_c2_ec26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l493_c2_ec26_return_output := result_MUX_uxn_device_h_l493_c2_ec26_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l493_c2_ec26_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l493_c2_ec26_return_output;
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
