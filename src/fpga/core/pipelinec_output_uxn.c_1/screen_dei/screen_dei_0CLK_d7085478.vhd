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
-- BIN_OP_EQ[uxn_device_h_l493_c6_72b6]
signal BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l498_c7_210a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l493_c2_836d]
signal result_MUX_uxn_device_h_l493_c2_836d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l493_c2_836d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l493_c2_836d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l493_c2_836d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l498_c11_c117]
signal BIN_OP_EQ_uxn_device_h_l498_c11_c117_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l498_c11_c117_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l503_c7_36dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l498_c7_210a]
signal result_MUX_uxn_device_h_l498_c7_210a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l498_c7_210a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l498_c7_210a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l498_c7_210a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l503_c11_2263]
signal BIN_OP_EQ_uxn_device_h_l503_c11_2263_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l503_c11_2263_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_007a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l503_c7_36dc]
signal result_MUX_uxn_device_h_l503_c7_36dc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l503_c7_36dc_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l503_c7_36dc_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l503_c7_36dc_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l508_c11_d8d4]
signal BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l513_c1_5187]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l508_c7_007a]
signal result_MUX_uxn_device_h_l508_c7_007a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l508_c7_007a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_007a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l508_c7_007a_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l514_c12_170f]
signal generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l514_c12_170f_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_170f_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l514_c12_170f_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l493_c6_72b6
BIN_OP_EQ_uxn_device_h_l493_c6_72b6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left,
BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right,
BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output);

-- result_MUX_uxn_device_h_l493_c2_836d
result_MUX_uxn_device_h_l493_c2_836d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l493_c2_836d_cond,
result_MUX_uxn_device_h_l493_c2_836d_iftrue,
result_MUX_uxn_device_h_l493_c2_836d_iffalse,
result_MUX_uxn_device_h_l493_c2_836d_return_output);

-- BIN_OP_EQ_uxn_device_h_l498_c11_c117
BIN_OP_EQ_uxn_device_h_l498_c11_c117 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l498_c11_c117_left,
BIN_OP_EQ_uxn_device_h_l498_c11_c117_right,
BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output);

-- result_MUX_uxn_device_h_l498_c7_210a
result_MUX_uxn_device_h_l498_c7_210a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l498_c7_210a_cond,
result_MUX_uxn_device_h_l498_c7_210a_iftrue,
result_MUX_uxn_device_h_l498_c7_210a_iffalse,
result_MUX_uxn_device_h_l498_c7_210a_return_output);

-- BIN_OP_EQ_uxn_device_h_l503_c11_2263
BIN_OP_EQ_uxn_device_h_l503_c11_2263 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l503_c11_2263_left,
BIN_OP_EQ_uxn_device_h_l503_c11_2263_right,
BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output);

-- result_MUX_uxn_device_h_l503_c7_36dc
result_MUX_uxn_device_h_l503_c7_36dc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l503_c7_36dc_cond,
result_MUX_uxn_device_h_l503_c7_36dc_iftrue,
result_MUX_uxn_device_h_l503_c7_36dc_iffalse,
result_MUX_uxn_device_h_l503_c7_36dc_return_output);

-- BIN_OP_EQ_uxn_device_h_l508_c11_d8d4
BIN_OP_EQ_uxn_device_h_l508_c11_d8d4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left,
BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right,
BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output);

-- result_MUX_uxn_device_h_l508_c7_007a
result_MUX_uxn_device_h_l508_c7_007a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l508_c7_007a_cond,
result_MUX_uxn_device_h_l508_c7_007a_iftrue,
result_MUX_uxn_device_h_l508_c7_007a_iffalse,
result_MUX_uxn_device_h_l508_c7_007a_return_output);

-- generic_dei_uxn_device_h_l514_c12_170f
generic_dei_uxn_device_h_l514_c12_170f : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE,
generic_dei_uxn_device_h_l514_c12_170f_device_address,
generic_dei_uxn_device_h_l514_c12_170f_phase,
generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read,
generic_dei_uxn_device_h_l514_c12_170f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output,
 result_MUX_uxn_device_h_l493_c2_836d_return_output,
 BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output,
 result_MUX_uxn_device_h_l498_c7_210a_return_output,
 BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output,
 result_MUX_uxn_device_h_l503_c7_36dc_return_output,
 BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output,
 result_MUX_uxn_device_h_l508_c7_007a_return_output,
 generic_dei_uxn_device_h_l514_c12_170f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l493_c2_836d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_836d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_836d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_210a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_836d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l493_c2_836d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l494_c3_a3ea : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l498_c7_210a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_210a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_210a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_36dc_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l498_c7_210a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l499_c3_e550 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l503_c7_36dc_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_36dc_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_36dc_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_007a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l503_c7_36dc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l504_c3_a8a0 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l508_c7_007a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_007a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_007a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l508_c7_007a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l509_c3_c685 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_170f_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_170f_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l514_c12_170f_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l499_c3_e550 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_right := to_unsigned(4, 4);
     VAR_result_device_ram_address_uxn_device_h_l504_c3_a8a0 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l494_c3_a3ea := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l509_c3_c685 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l498_c7_210a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_210a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l499_c3_e550,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l503_c7_36dc] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_36dc_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l504_c3_a8a0,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l493_c2_836d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_836d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l494_c3_a3ea,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l508_c7_007a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_007a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l509_c3_c685,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l498_c7_210a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l498_c7_210a_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_007a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l508_c7_007a_return_output;
     VAR_result_MUX_uxn_device_h_l493_c2_836d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l493_c2_836d_return_output;
     VAR_result_MUX_uxn_device_h_l503_c7_36dc_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l503_c7_36dc_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l514_c12_170f_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l514_c12_170f_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l492_c16_8965] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l492_c16_8965_return_output;
     -- BIN_OP_EQ[uxn_device_h_l498_c11_c117] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l498_c11_c117_left <= VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_left;
     BIN_OP_EQ_uxn_device_h_l498_c11_c117_right <= VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output := BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output;

     -- BIN_OP_EQ[uxn_device_h_l493_c6_72b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left <= VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_left;
     BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right <= VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output := BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l503_c11_2263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l503_c11_2263_left <= VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_left;
     BIN_OP_EQ_uxn_device_h_l503_c11_2263_right <= VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output := BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output;

     -- BIN_OP_EQ[uxn_device_h_l508_c11_d8d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_left;
     BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right <= VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output := BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond := VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output;
     VAR_result_MUX_uxn_device_h_l493_c2_836d_cond := VAR_BIN_OP_EQ_uxn_device_h_l493_c6_72b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output;
     VAR_result_MUX_uxn_device_h_l498_c7_210a_cond := VAR_BIN_OP_EQ_uxn_device_h_l498_c11_c117_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond := VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output;
     VAR_result_MUX_uxn_device_h_l503_c7_36dc_cond := VAR_BIN_OP_EQ_uxn_device_h_l503_c11_2263_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output;
     VAR_result_MUX_uxn_device_h_l508_c7_007a_cond := VAR_BIN_OP_EQ_uxn_device_h_l508_c11_d8d4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l498_c7_210a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l498_c7_210a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l503_c7_36dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l503_c7_36dc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l508_c7_007a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l508_c7_007a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l513_c1_5187] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l513_c1_5187_return_output;
     -- generic_dei[uxn_device_h_l514_c12_170f] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l514_c12_170f_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l514_c12_170f_device_address <= VAR_generic_dei_uxn_device_h_l514_c12_170f_device_address;
     generic_dei_uxn_device_h_l514_c12_170f_phase <= VAR_generic_dei_uxn_device_h_l514_c12_170f_phase;
     generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l514_c12_170f_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l514_c12_170f_return_output := generic_dei_uxn_device_h_l514_c12_170f_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l508_c7_007a_iffalse := VAR_generic_dei_uxn_device_h_l514_c12_170f_return_output;
     -- result_MUX[uxn_device_h_l508_c7_007a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l508_c7_007a_cond <= VAR_result_MUX_uxn_device_h_l508_c7_007a_cond;
     result_MUX_uxn_device_h_l508_c7_007a_iftrue <= VAR_result_MUX_uxn_device_h_l508_c7_007a_iftrue;
     result_MUX_uxn_device_h_l508_c7_007a_iffalse <= VAR_result_MUX_uxn_device_h_l508_c7_007a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l508_c7_007a_return_output := result_MUX_uxn_device_h_l508_c7_007a_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l503_c7_36dc_iffalse := VAR_result_MUX_uxn_device_h_l508_c7_007a_return_output;
     -- result_MUX[uxn_device_h_l503_c7_36dc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l503_c7_36dc_cond <= VAR_result_MUX_uxn_device_h_l503_c7_36dc_cond;
     result_MUX_uxn_device_h_l503_c7_36dc_iftrue <= VAR_result_MUX_uxn_device_h_l503_c7_36dc_iftrue;
     result_MUX_uxn_device_h_l503_c7_36dc_iffalse <= VAR_result_MUX_uxn_device_h_l503_c7_36dc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l503_c7_36dc_return_output := result_MUX_uxn_device_h_l503_c7_36dc_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l498_c7_210a_iffalse := VAR_result_MUX_uxn_device_h_l503_c7_36dc_return_output;
     -- result_MUX[uxn_device_h_l498_c7_210a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l498_c7_210a_cond <= VAR_result_MUX_uxn_device_h_l498_c7_210a_cond;
     result_MUX_uxn_device_h_l498_c7_210a_iftrue <= VAR_result_MUX_uxn_device_h_l498_c7_210a_iftrue;
     result_MUX_uxn_device_h_l498_c7_210a_iffalse <= VAR_result_MUX_uxn_device_h_l498_c7_210a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l498_c7_210a_return_output := result_MUX_uxn_device_h_l498_c7_210a_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l493_c2_836d_iffalse := VAR_result_MUX_uxn_device_h_l498_c7_210a_return_output;
     -- result_MUX[uxn_device_h_l493_c2_836d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l493_c2_836d_cond <= VAR_result_MUX_uxn_device_h_l493_c2_836d_cond;
     result_MUX_uxn_device_h_l493_c2_836d_iftrue <= VAR_result_MUX_uxn_device_h_l493_c2_836d_iftrue;
     result_MUX_uxn_device_h_l493_c2_836d_iffalse <= VAR_result_MUX_uxn_device_h_l493_c2_836d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l493_c2_836d_return_output := result_MUX_uxn_device_h_l493_c2_836d_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l493_c2_836d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l493_c2_836d_return_output;
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
