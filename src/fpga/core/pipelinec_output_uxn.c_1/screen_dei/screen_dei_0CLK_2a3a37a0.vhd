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
entity screen_dei_0CLK_2a3a37a0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end screen_dei_0CLK_2a3a37a0;
architecture arch of screen_dei_0CLK_2a3a37a0 is
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
-- BIN_OP_EQ[uxn_device_h_l299_c6_14a4]
signal BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l304_c7_78de]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l299_c2_9568]
signal result_MUX_uxn_device_h_l299_c2_9568_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l299_c2_9568_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l299_c2_9568_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l299_c2_9568_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l304_c11_c681]
signal BIN_OP_EQ_uxn_device_h_l304_c11_c681_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l304_c11_c681_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l309_c7_9e90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l304_c7_78de]
signal result_MUX_uxn_device_h_l304_c7_78de_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l304_c7_78de_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l304_c7_78de_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l304_c7_78de_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l309_c11_0f18]
signal BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l314_c7_eee2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l309_c7_9e90]
signal result_MUX_uxn_device_h_l309_c7_9e90_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l309_c7_9e90_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l309_c7_9e90_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l309_c7_9e90_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l314_c11_83e0]
signal BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l319_c1_2755]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l314_c7_eee2]
signal result_MUX_uxn_device_h_l314_c7_eee2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l314_c7_eee2_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l314_c7_eee2_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l314_c7_eee2_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l320_c12_0dfa]
signal generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l320_c12_0dfa_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l320_c12_0dfa_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l320_c12_0dfa_return_output : device_in_result_t;

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
-- BIN_OP_EQ_uxn_device_h_l299_c6_14a4
BIN_OP_EQ_uxn_device_h_l299_c6_14a4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left,
BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right,
BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output);

-- result_MUX_uxn_device_h_l299_c2_9568
result_MUX_uxn_device_h_l299_c2_9568 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l299_c2_9568_cond,
result_MUX_uxn_device_h_l299_c2_9568_iftrue,
result_MUX_uxn_device_h_l299_c2_9568_iffalse,
result_MUX_uxn_device_h_l299_c2_9568_return_output);

-- BIN_OP_EQ_uxn_device_h_l304_c11_c681
BIN_OP_EQ_uxn_device_h_l304_c11_c681 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l304_c11_c681_left,
BIN_OP_EQ_uxn_device_h_l304_c11_c681_right,
BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output);

-- result_MUX_uxn_device_h_l304_c7_78de
result_MUX_uxn_device_h_l304_c7_78de : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l304_c7_78de_cond,
result_MUX_uxn_device_h_l304_c7_78de_iftrue,
result_MUX_uxn_device_h_l304_c7_78de_iffalse,
result_MUX_uxn_device_h_l304_c7_78de_return_output);

-- BIN_OP_EQ_uxn_device_h_l309_c11_0f18
BIN_OP_EQ_uxn_device_h_l309_c11_0f18 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left,
BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right,
BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output);

-- result_MUX_uxn_device_h_l309_c7_9e90
result_MUX_uxn_device_h_l309_c7_9e90 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l309_c7_9e90_cond,
result_MUX_uxn_device_h_l309_c7_9e90_iftrue,
result_MUX_uxn_device_h_l309_c7_9e90_iffalse,
result_MUX_uxn_device_h_l309_c7_9e90_return_output);

-- BIN_OP_EQ_uxn_device_h_l314_c11_83e0
BIN_OP_EQ_uxn_device_h_l314_c11_83e0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left,
BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right,
BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output);

-- result_MUX_uxn_device_h_l314_c7_eee2
result_MUX_uxn_device_h_l314_c7_eee2 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l314_c7_eee2_cond,
result_MUX_uxn_device_h_l314_c7_eee2_iftrue,
result_MUX_uxn_device_h_l314_c7_eee2_iffalse,
result_MUX_uxn_device_h_l314_c7_eee2_return_output);

-- generic_dei_uxn_device_h_l320_c12_0dfa
generic_dei_uxn_device_h_l320_c12_0dfa : entity work.generic_dei_0CLK_6f2c5aad port map (
clk,
generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE,
generic_dei_uxn_device_h_l320_c12_0dfa_device_address,
generic_dei_uxn_device_h_l320_c12_0dfa_phase,
generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read,
generic_dei_uxn_device_h_l320_c12_0dfa_return_output);



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
 BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output,
 result_MUX_uxn_device_h_l299_c2_9568_return_output,
 BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output,
 result_MUX_uxn_device_h_l304_c7_78de_return_output,
 BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output,
 result_MUX_uxn_device_h_l309_c7_9e90_return_output,
 BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output,
 result_MUX_uxn_device_h_l314_c7_eee2_return_output,
 generic_dei_uxn_device_h_l320_c12_0dfa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l299_c2_9568_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l299_c2_9568_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l299_c2_9568_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l304_c7_78de_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l299_c2_9568_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l299_c2_9568_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l300_c3_be37 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l304_c7_78de_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l304_c7_78de_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l304_c7_78de_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l309_c7_9e90_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l304_c7_78de_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l305_c3_c2a9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l309_c7_9e90_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l309_c7_9e90_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l309_c7_9e90_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l314_c7_eee2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l309_c7_9e90_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l310_c3_ebdd : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l314_c7_eee2_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l314_c7_eee2_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l314_c7_eee2_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l314_c7_eee2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l315_c3_cb42 : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l320_c12_0dfa_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l320_c12_0dfa_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l320_c12_0dfa_return_output : device_in_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right := to_unsigned(2, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right := to_unsigned(5, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l300_c3_be37 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_right := to_unsigned(3, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right := to_unsigned(4, 4);
     VAR_result_device_ram_address_uxn_device_h_l305_c3_c2a9 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l315_c3_cb42 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l310_c3_ebdd := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue := to_unsigned(0, 1);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l309_c7_9e90] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l309_c7_9e90_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l310_c3_ebdd,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l314_c7_eee2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l314_c7_eee2_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l315_c3_cb42,
     to_unsigned(234, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l299_c2_9568] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l299_c2_9568_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l300_c3_be37,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l304_c7_78de] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l304_c7_78de_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l305_c3_c2a9,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l314_c7_eee2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l314_c7_eee2_return_output;
     VAR_result_MUX_uxn_device_h_l309_c7_9e90_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l309_c7_9e90_return_output;
     VAR_result_MUX_uxn_device_h_l304_c7_78de_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l304_c7_78de_return_output;
     VAR_result_MUX_uxn_device_h_l299_c2_9568_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l299_c2_9568_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l320_c12_0dfa_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l320_c12_0dfa_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l298_c16_36d5] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left := VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_left := VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left := VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left := VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l298_c16_36d5_return_output;
     -- BIN_OP_EQ[uxn_device_h_l314_c11_83e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left <= VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_left;
     BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right <= VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output := BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l309_c11_0f18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left <= VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_left;
     BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right <= VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output := BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output;

     -- BIN_OP_EQ[uxn_device_h_l299_c6_14a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_left;
     BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output := BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l304_c11_c681] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l304_c11_c681_left <= VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_left;
     BIN_OP_EQ_uxn_device_h_l304_c11_c681_right <= VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output := BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output;
     VAR_result_MUX_uxn_device_h_l299_c2_9568_cond := VAR_BIN_OP_EQ_uxn_device_h_l299_c6_14a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output;
     VAR_result_MUX_uxn_device_h_l304_c7_78de_cond := VAR_BIN_OP_EQ_uxn_device_h_l304_c11_c681_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond := VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output;
     VAR_result_MUX_uxn_device_h_l309_c7_9e90_cond := VAR_BIN_OP_EQ_uxn_device_h_l309_c11_0f18_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output;
     VAR_result_MUX_uxn_device_h_l314_c7_eee2_cond := VAR_BIN_OP_EQ_uxn_device_h_l314_c11_83e0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l304_c7_78de] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l304_c7_78de_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l309_c7_9e90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l309_c7_9e90_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l314_c7_eee2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l314_c7_eee2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l319_c1_2755] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l319_c1_2755_return_output;
     -- generic_dei[uxn_device_h_l320_c12_0dfa] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l320_c12_0dfa_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l320_c12_0dfa_device_address <= VAR_generic_dei_uxn_device_h_l320_c12_0dfa_device_address;
     generic_dei_uxn_device_h_l320_c12_0dfa_phase <= VAR_generic_dei_uxn_device_h_l320_c12_0dfa_phase;
     generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l320_c12_0dfa_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l320_c12_0dfa_return_output := generic_dei_uxn_device_h_l320_c12_0dfa_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l314_c7_eee2_iffalse := VAR_generic_dei_uxn_device_h_l320_c12_0dfa_return_output;
     -- result_MUX[uxn_device_h_l314_c7_eee2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l314_c7_eee2_cond <= VAR_result_MUX_uxn_device_h_l314_c7_eee2_cond;
     result_MUX_uxn_device_h_l314_c7_eee2_iftrue <= VAR_result_MUX_uxn_device_h_l314_c7_eee2_iftrue;
     result_MUX_uxn_device_h_l314_c7_eee2_iffalse <= VAR_result_MUX_uxn_device_h_l314_c7_eee2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l314_c7_eee2_return_output := result_MUX_uxn_device_h_l314_c7_eee2_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l309_c7_9e90_iffalse := VAR_result_MUX_uxn_device_h_l314_c7_eee2_return_output;
     -- result_MUX[uxn_device_h_l309_c7_9e90] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l309_c7_9e90_cond <= VAR_result_MUX_uxn_device_h_l309_c7_9e90_cond;
     result_MUX_uxn_device_h_l309_c7_9e90_iftrue <= VAR_result_MUX_uxn_device_h_l309_c7_9e90_iftrue;
     result_MUX_uxn_device_h_l309_c7_9e90_iffalse <= VAR_result_MUX_uxn_device_h_l309_c7_9e90_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l309_c7_9e90_return_output := result_MUX_uxn_device_h_l309_c7_9e90_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l304_c7_78de_iffalse := VAR_result_MUX_uxn_device_h_l309_c7_9e90_return_output;
     -- result_MUX[uxn_device_h_l304_c7_78de] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l304_c7_78de_cond <= VAR_result_MUX_uxn_device_h_l304_c7_78de_cond;
     result_MUX_uxn_device_h_l304_c7_78de_iftrue <= VAR_result_MUX_uxn_device_h_l304_c7_78de_iftrue;
     result_MUX_uxn_device_h_l304_c7_78de_iffalse <= VAR_result_MUX_uxn_device_h_l304_c7_78de_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l304_c7_78de_return_output := result_MUX_uxn_device_h_l304_c7_78de_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l299_c2_9568_iffalse := VAR_result_MUX_uxn_device_h_l304_c7_78de_return_output;
     -- result_MUX[uxn_device_h_l299_c2_9568] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l299_c2_9568_cond <= VAR_result_MUX_uxn_device_h_l299_c2_9568_cond;
     result_MUX_uxn_device_h_l299_c2_9568_iftrue <= VAR_result_MUX_uxn_device_h_l299_c2_9568_iftrue;
     result_MUX_uxn_device_h_l299_c2_9568_iffalse <= VAR_result_MUX_uxn_device_h_l299_c2_9568_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l299_c2_9568_return_output := result_MUX_uxn_device_h_l299_c2_9568_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l299_c2_9568_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l299_c2_9568_return_output;
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
