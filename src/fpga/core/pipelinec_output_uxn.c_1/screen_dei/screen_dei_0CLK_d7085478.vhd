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
-- BIN_OP_EQ[uxn_device_h_l444_c6_c984]
signal BIN_OP_EQ_uxn_device_h_l444_c6_c984_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l444_c6_c984_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l449_c7_d08c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l444_c2_3b0b]
signal result_MUX_uxn_device_h_l444_c2_3b0b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l444_c2_3b0b_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l444_c2_3b0b_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l444_c2_3b0b_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l449_c11_a830]
signal BIN_OP_EQ_uxn_device_h_l449_c11_a830_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l449_c11_a830_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l454_c7_1a1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l449_c7_d08c]
signal result_MUX_uxn_device_h_l449_c7_d08c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l449_c7_d08c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l449_c7_d08c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l449_c7_d08c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l454_c11_57fa]
signal BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l459_c7_3a4d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l454_c7_1a1d]
signal result_MUX_uxn_device_h_l454_c7_1a1d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l454_c7_1a1d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l454_c7_1a1d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l454_c7_1a1d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l459_c11_9193]
signal BIN_OP_EQ_uxn_device_h_l459_c11_9193_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l459_c11_9193_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l464_c1_0d86]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l459_c7_3a4d]
signal result_MUX_uxn_device_h_l459_c7_3a4d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l459_c7_3a4d_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l459_c7_3a4d_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l459_c7_3a4d_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l465_c12_7846]
signal generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l465_c12_7846_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l465_c12_7846_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l465_c12_7846_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l444_c6_c984
BIN_OP_EQ_uxn_device_h_l444_c6_c984 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l444_c6_c984_left,
BIN_OP_EQ_uxn_device_h_l444_c6_c984_right,
BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output);

-- result_MUX_uxn_device_h_l444_c2_3b0b
result_MUX_uxn_device_h_l444_c2_3b0b : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l444_c2_3b0b_cond,
result_MUX_uxn_device_h_l444_c2_3b0b_iftrue,
result_MUX_uxn_device_h_l444_c2_3b0b_iffalse,
result_MUX_uxn_device_h_l444_c2_3b0b_return_output);

-- BIN_OP_EQ_uxn_device_h_l449_c11_a830
BIN_OP_EQ_uxn_device_h_l449_c11_a830 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l449_c11_a830_left,
BIN_OP_EQ_uxn_device_h_l449_c11_a830_right,
BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output);

-- result_MUX_uxn_device_h_l449_c7_d08c
result_MUX_uxn_device_h_l449_c7_d08c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l449_c7_d08c_cond,
result_MUX_uxn_device_h_l449_c7_d08c_iftrue,
result_MUX_uxn_device_h_l449_c7_d08c_iffalse,
result_MUX_uxn_device_h_l449_c7_d08c_return_output);

-- BIN_OP_EQ_uxn_device_h_l454_c11_57fa
BIN_OP_EQ_uxn_device_h_l454_c11_57fa : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left,
BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right,
BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output);

-- result_MUX_uxn_device_h_l454_c7_1a1d
result_MUX_uxn_device_h_l454_c7_1a1d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l454_c7_1a1d_cond,
result_MUX_uxn_device_h_l454_c7_1a1d_iftrue,
result_MUX_uxn_device_h_l454_c7_1a1d_iffalse,
result_MUX_uxn_device_h_l454_c7_1a1d_return_output);

-- BIN_OP_EQ_uxn_device_h_l459_c11_9193
BIN_OP_EQ_uxn_device_h_l459_c11_9193 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l459_c11_9193_left,
BIN_OP_EQ_uxn_device_h_l459_c11_9193_right,
BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output);

-- result_MUX_uxn_device_h_l459_c7_3a4d
result_MUX_uxn_device_h_l459_c7_3a4d : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l459_c7_3a4d_cond,
result_MUX_uxn_device_h_l459_c7_3a4d_iftrue,
result_MUX_uxn_device_h_l459_c7_3a4d_iffalse,
result_MUX_uxn_device_h_l459_c7_3a4d_return_output);

-- generic_dei_uxn_device_h_l465_c12_7846
generic_dei_uxn_device_h_l465_c12_7846 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE,
generic_dei_uxn_device_h_l465_c12_7846_device_address,
generic_dei_uxn_device_h_l465_c12_7846_phase,
generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read,
generic_dei_uxn_device_h_l465_c12_7846_return_output);



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
 BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output,
 result_MUX_uxn_device_h_l444_c2_3b0b_return_output,
 BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output,
 result_MUX_uxn_device_h_l449_c7_d08c_return_output,
 BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output,
 result_MUX_uxn_device_h_l454_c7_1a1d_return_output,
 BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output,
 result_MUX_uxn_device_h_l459_c7_3a4d_return_output,
 generic_dei_uxn_device_h_l465_c12_7846_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l444_c2_3b0b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l449_c7_d08c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l444_c2_3b0b_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l444_c2_3b0b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l445_c3_644e : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l449_c7_d08c_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l449_c7_d08c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l449_c7_d08c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l454_c7_1a1d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l449_c7_d08c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l450_c3_b47b : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l454_c7_1a1d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l459_c7_3a4d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l454_c7_1a1d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l455_c3_adeb : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l459_c7_3a4d_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l459_c7_3a4d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l460_c3_ee1c : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l465_c12_7846_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l465_c12_7846_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l465_c12_7846_return_output : device_in_result_t;
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
     VAR_result_device_ram_address_uxn_device_h_l455_c3_adeb := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_right := to_unsigned(3, 4);
     VAR_result_device_ram_address_uxn_device_h_l445_c3_644e := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l450_c3_b47b := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_right := to_unsigned(2, 4);
     VAR_result_device_ram_address_uxn_device_h_l460_c3_ee1c := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right := to_unsigned(4, 4);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l454_c7_1a1d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l454_c7_1a1d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l455_c3_adeb,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l459_c7_3a4d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l459_c7_3a4d_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l460_c3_ee1c,
     to_unsigned(240, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l444_c2_3b0b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l444_c2_3b0b_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l445_c3_644e,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l449_c7_d08c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l449_c7_d08c_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l450_c3_b47b,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l449_c7_d08c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l449_c7_d08c_return_output;
     VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l454_c7_1a1d_return_output;
     VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l459_c7_3a4d_return_output;
     VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l444_c2_3b0b_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l465_c12_7846_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l465_c12_7846_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l443_c16_1cf3] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_left := VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_left := VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left := VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_left := VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l443_c16_1cf3_return_output;
     -- BIN_OP_EQ[uxn_device_h_l459_c11_9193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l459_c11_9193_left <= VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_left;
     BIN_OP_EQ_uxn_device_h_l459_c11_9193_right <= VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output := BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output;

     -- BIN_OP_EQ[uxn_device_h_l449_c11_a830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l449_c11_a830_left <= VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_left;
     BIN_OP_EQ_uxn_device_h_l449_c11_a830_right <= VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output := BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output;

     -- BIN_OP_EQ[uxn_device_h_l444_c6_c984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l444_c6_c984_left <= VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_left;
     BIN_OP_EQ_uxn_device_h_l444_c6_c984_right <= VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output := BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output;

     -- BIN_OP_EQ[uxn_device_h_l454_c11_57fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left <= VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_left;
     BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right <= VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output := BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond := VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output;
     VAR_result_MUX_uxn_device_h_l444_c2_3b0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l444_c6_c984_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond := VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output;
     VAR_result_MUX_uxn_device_h_l449_c7_d08c_cond := VAR_BIN_OP_EQ_uxn_device_h_l449_c11_a830_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond := VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output;
     VAR_result_MUX_uxn_device_h_l454_c7_1a1d_cond := VAR_BIN_OP_EQ_uxn_device_h_l454_c11_57fa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond := VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output;
     VAR_result_MUX_uxn_device_h_l459_c7_3a4d_cond := VAR_BIN_OP_EQ_uxn_device_h_l459_c11_9193_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l449_c7_d08c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l449_c7_d08c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l454_c7_1a1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l454_c7_1a1d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l459_c7_3a4d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l459_c7_3a4d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l464_c1_0d86] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l464_c1_0d86_return_output;
     -- generic_dei[uxn_device_h_l465_c12_7846] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l465_c12_7846_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l465_c12_7846_device_address <= VAR_generic_dei_uxn_device_h_l465_c12_7846_device_address;
     generic_dei_uxn_device_h_l465_c12_7846_phase <= VAR_generic_dei_uxn_device_h_l465_c12_7846_phase;
     generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l465_c12_7846_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l465_c12_7846_return_output := generic_dei_uxn_device_h_l465_c12_7846_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iffalse := VAR_generic_dei_uxn_device_h_l465_c12_7846_return_output;
     -- result_MUX[uxn_device_h_l459_c7_3a4d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l459_c7_3a4d_cond <= VAR_result_MUX_uxn_device_h_l459_c7_3a4d_cond;
     result_MUX_uxn_device_h_l459_c7_3a4d_iftrue <= VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iftrue;
     result_MUX_uxn_device_h_l459_c7_3a4d_iffalse <= VAR_result_MUX_uxn_device_h_l459_c7_3a4d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l459_c7_3a4d_return_output := result_MUX_uxn_device_h_l459_c7_3a4d_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iffalse := VAR_result_MUX_uxn_device_h_l459_c7_3a4d_return_output;
     -- result_MUX[uxn_device_h_l454_c7_1a1d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l454_c7_1a1d_cond <= VAR_result_MUX_uxn_device_h_l454_c7_1a1d_cond;
     result_MUX_uxn_device_h_l454_c7_1a1d_iftrue <= VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iftrue;
     result_MUX_uxn_device_h_l454_c7_1a1d_iffalse <= VAR_result_MUX_uxn_device_h_l454_c7_1a1d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l454_c7_1a1d_return_output := result_MUX_uxn_device_h_l454_c7_1a1d_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l449_c7_d08c_iffalse := VAR_result_MUX_uxn_device_h_l454_c7_1a1d_return_output;
     -- result_MUX[uxn_device_h_l449_c7_d08c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l449_c7_d08c_cond <= VAR_result_MUX_uxn_device_h_l449_c7_d08c_cond;
     result_MUX_uxn_device_h_l449_c7_d08c_iftrue <= VAR_result_MUX_uxn_device_h_l449_c7_d08c_iftrue;
     result_MUX_uxn_device_h_l449_c7_d08c_iffalse <= VAR_result_MUX_uxn_device_h_l449_c7_d08c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l449_c7_d08c_return_output := result_MUX_uxn_device_h_l449_c7_d08c_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iffalse := VAR_result_MUX_uxn_device_h_l449_c7_d08c_return_output;
     -- result_MUX[uxn_device_h_l444_c2_3b0b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l444_c2_3b0b_cond <= VAR_result_MUX_uxn_device_h_l444_c2_3b0b_cond;
     result_MUX_uxn_device_h_l444_c2_3b0b_iftrue <= VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iftrue;
     result_MUX_uxn_device_h_l444_c2_3b0b_iffalse <= VAR_result_MUX_uxn_device_h_l444_c2_3b0b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l444_c2_3b0b_return_output := result_MUX_uxn_device_h_l444_c2_3b0b_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l444_c2_3b0b_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l444_c2_3b0b_return_output;
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
