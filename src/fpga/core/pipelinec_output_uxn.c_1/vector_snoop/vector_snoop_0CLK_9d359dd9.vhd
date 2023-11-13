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
entity vector_snoop_0CLK_9d359dd9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end vector_snoop_0CLK_9d359dd9;
architecture arch of vector_snoop_0CLK_9d359dd9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_screen_vector : unsigned(15 downto 0);

-- Each function instance gets signals
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_b7ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l186_c2_b3c4]
signal screen_vector_MUX_uxn_c_l186_c2_b3c4_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l187_c7_8a6e]
signal BIN_OP_EQ_uxn_c_l187_c7_8a6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_8a6e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_d4e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_e037]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l187_c3_921b]
signal screen_vector_MUX_uxn_c_l187_c3_921b_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_921b_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_921b_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_921b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l188_c4_3cf8]
signal BIN_OP_AND_uxn_c_l188_c4_3cf8_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_3cf8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l189_c22_ec6d]
signal CONST_SL_8_uxn_c_l189_c22_ec6d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l189_c22_ec6d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l189_c4_3fb4]
signal BIN_OP_OR_uxn_c_l189_c4_3fb4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_3fb4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l190_c4_2d92[uxn_c_l190_c4_2d92]
signal printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l192_c12_0a6b]
signal BIN_OP_EQ_uxn_c_l192_c12_0a6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_0a6b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_0c9c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l192_c8_e037]
signal screen_vector_MUX_uxn_c_l192_c8_e037_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_e037_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_e037_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_e037_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l193_c4_c548]
signal BIN_OP_AND_uxn_c_l193_c4_c548_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_c548_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_c548_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l194_c4_9cc8]
signal BIN_OP_OR_uxn_c_l194_c4_9cc8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_9cc8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l195_c4_5252[uxn_c_l195_c4_5252]
signal printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0 : unsigned(31 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output);

-- screen_vector_MUX_uxn_c_l186_c2_b3c4
screen_vector_MUX_uxn_c_l186_c2_b3c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c2_b3c4_cond,
screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue,
screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse,
screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output);

-- BIN_OP_EQ_uxn_c_l187_c7_8a6e
BIN_OP_EQ_uxn_c_l187_c7_8a6e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l187_c7_8a6e_left,
BIN_OP_EQ_uxn_c_l187_c7_8a6e_right,
BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output);

-- screen_vector_MUX_uxn_c_l187_c3_921b
screen_vector_MUX_uxn_c_l187_c3_921b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l187_c3_921b_cond,
screen_vector_MUX_uxn_c_l187_c3_921b_iftrue,
screen_vector_MUX_uxn_c_l187_c3_921b_iffalse,
screen_vector_MUX_uxn_c_l187_c3_921b_return_output);

-- BIN_OP_AND_uxn_c_l188_c4_3cf8
BIN_OP_AND_uxn_c_l188_c4_3cf8 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c4_3cf8_left,
BIN_OP_AND_uxn_c_l188_c4_3cf8_right,
BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output);

-- CONST_SL_8_uxn_c_l189_c22_ec6d
CONST_SL_8_uxn_c_l189_c22_ec6d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l189_c22_ec6d_x,
CONST_SL_8_uxn_c_l189_c22_ec6d_return_output);

-- BIN_OP_OR_uxn_c_l189_c4_3fb4
BIN_OP_OR_uxn_c_l189_c4_3fb4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l189_c4_3fb4_left,
BIN_OP_OR_uxn_c_l189_c4_3fb4_right,
BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output);

-- printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92
printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92 : entity work.printf_uxn_c_l190_c4_2d92_0CLK_de264c78 port map (
printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE,
printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0);

-- BIN_OP_EQ_uxn_c_l192_c12_0a6b
BIN_OP_EQ_uxn_c_l192_c12_0a6b : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l192_c12_0a6b_left,
BIN_OP_EQ_uxn_c_l192_c12_0a6b_right,
BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output);

-- screen_vector_MUX_uxn_c_l192_c8_e037
screen_vector_MUX_uxn_c_l192_c8_e037 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l192_c8_e037_cond,
screen_vector_MUX_uxn_c_l192_c8_e037_iftrue,
screen_vector_MUX_uxn_c_l192_c8_e037_iffalse,
screen_vector_MUX_uxn_c_l192_c8_e037_return_output);

-- BIN_OP_AND_uxn_c_l193_c4_c548
BIN_OP_AND_uxn_c_l193_c4_c548 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l193_c4_c548_left,
BIN_OP_AND_uxn_c_l193_c4_c548_right,
BIN_OP_AND_uxn_c_l193_c4_c548_return_output);

-- BIN_OP_OR_uxn_c_l194_c4_9cc8
BIN_OP_OR_uxn_c_l194_c4_9cc8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l194_c4_9cc8_left,
BIN_OP_OR_uxn_c_l194_c4_9cc8_right,
BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output);

-- printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252
printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252 : entity work.printf_uxn_c_l195_c4_5252_0CLK_de264c78 port map (
printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE,
printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 -- Registers
 screen_vector,
 -- All submodule outputs
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output,
 screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output,
 BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output,
 screen_vector_MUX_uxn_c_l187_c3_921b_return_output,
 BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output,
 CONST_SL_8_uxn_c_l189_c22_ec6d_return_output,
 BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output,
 BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output,
 screen_vector_MUX_uxn_c_l192_c8_e037_return_output,
 BIN_OP_AND_uxn_c_l193_c4_c548_return_output,
 BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_921b_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l189_c4_a9bd : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_e037_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_921b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l194_c4_837a : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_e037_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_c548_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_c548_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_c548_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_9c03_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_right := to_unsigned(32, 6);
     VAR_BIN_OP_AND_uxn_c_l193_c4_c548_right := to_unsigned(65280, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_right := to_unsigned(33, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_left := VAR_device_ram_address;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond := VAR_is_device_ram_write;
     VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l193_c4_c548_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l188_c4_3cf8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c4_3cf8_left <= VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_left;
     BIN_OP_AND_uxn_c_l188_c4_3cf8_right <= VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output := BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_9c03 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_9c03_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_b7ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output;

     -- BIN_OP_EQ[uxn_c_l187_c7_8a6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l187_c7_8a6e_left <= VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_left;
     BIN_OP_EQ_uxn_c_l187_c7_8a6e_right <= VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output := BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output;

     -- BIN_OP_EQ[uxn_c_l192_c12_0a6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l192_c12_0a6b_left <= VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_left;
     BIN_OP_EQ_uxn_c_l192_c12_0a6b_right <= VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output := BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output;

     -- BIN_OP_AND[uxn_c_l193_c4_c548] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l193_c4_c548_left <= VAR_BIN_OP_AND_uxn_c_l193_c4_c548_left;
     BIN_OP_AND_uxn_c_l193_c4_c548_right <= VAR_BIN_OP_AND_uxn_c_l193_c4_c548_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l193_c4_c548_return_output := BIN_OP_AND_uxn_c_l193_c4_c548_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_left := VAR_BIN_OP_AND_uxn_c_l188_c4_3cf8_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_left := VAR_BIN_OP_AND_uxn_c_l193_c4_c548_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_921b_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8a6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output;
     VAR_screen_vector_MUX_uxn_c_l192_c8_e037_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_0a6b_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_9c03_return_output;
     VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_9c03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_b7ac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_d4e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output;

     -- BIN_OP_OR[uxn_c_l194_c4_9cc8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l194_c4_9cc8_left <= VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_left;
     BIN_OP_OR_uxn_c_l194_c4_9cc8_right <= VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output := BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output;

     -- CONST_SL_8[uxn_c_l189_c22_ec6d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l189_c22_ec6d_x <= VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_return_output := CONST_SL_8_uxn_c_l189_c22_ec6d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_e037] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output;

     -- Submodule level 2
     VAR_screen_vector_uxn_c_l194_c4_837a := VAR_BIN_OP_OR_uxn_c_l194_c4_9cc8_return_output;
     VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_right := VAR_CONST_SL_8_uxn_c_l189_c22_ec6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_e037_return_output;
     VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_d4e6_return_output;
     VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0 := resize(VAR_screen_vector_uxn_c_l194_c4_837a, 32);
     VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iftrue := VAR_screen_vector_uxn_c_l194_c4_837a;
     -- BIN_OP_OR[uxn_c_l189_c4_3fb4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l189_c4_3fb4_left <= VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_left;
     BIN_OP_OR_uxn_c_l189_c4_3fb4_right <= VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output := BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output;

     -- screen_vector_MUX[uxn_c_l192_c8_e037] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l192_c8_e037_cond <= VAR_screen_vector_MUX_uxn_c_l192_c8_e037_cond;
     screen_vector_MUX_uxn_c_l192_c8_e037_iftrue <= VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iftrue;
     screen_vector_MUX_uxn_c_l192_c8_e037_iffalse <= VAR_screen_vector_MUX_uxn_c_l192_c8_e037_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l192_c8_e037_return_output := screen_vector_MUX_uxn_c_l192_c8_e037_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_0c9c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output;

     -- Submodule level 3
     VAR_screen_vector_uxn_c_l189_c4_a9bd := VAR_BIN_OP_OR_uxn_c_l189_c4_3fb4_return_output;
     VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_0c9c_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iffalse := VAR_screen_vector_MUX_uxn_c_l192_c8_e037_return_output;
     VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0 := resize(VAR_screen_vector_uxn_c_l189_c4_a9bd, 32);
     VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iftrue := VAR_screen_vector_uxn_c_l189_c4_a9bd;
     -- printf_uxn_c_l195_c4_5252[uxn_c_l195_c4_5252] LATENCY=0
     -- Clock enable
     printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE <= VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0 <= VAR_printf_uxn_c_l195_c4_5252_uxn_c_l195_c4_5252_arg0;
     -- Outputs

     -- screen_vector_MUX[uxn_c_l187_c3_921b] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l187_c3_921b_cond <= VAR_screen_vector_MUX_uxn_c_l187_c3_921b_cond;
     screen_vector_MUX_uxn_c_l187_c3_921b_iftrue <= VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iftrue;
     screen_vector_MUX_uxn_c_l187_c3_921b_iffalse <= VAR_screen_vector_MUX_uxn_c_l187_c3_921b_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l187_c3_921b_return_output := screen_vector_MUX_uxn_c_l187_c3_921b_return_output;

     -- printf_uxn_c_l190_c4_2d92[uxn_c_l190_c4_2d92] LATENCY=0
     -- Clock enable
     printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE <= VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0 <= VAR_printf_uxn_c_l190_c4_2d92_uxn_c_l190_c4_2d92_arg0;
     -- Outputs

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue := VAR_screen_vector_MUX_uxn_c_l187_c3_921b_return_output;
     -- screen_vector_MUX[uxn_c_l186_c2_b3c4] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c2_b3c4_cond <= VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_cond;
     screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iftrue;
     screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output := screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l186_c2_b3c4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_screen_vector <= REG_VAR_screen_vector;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     screen_vector <= REG_COMB_screen_vector;
 end if;
 end if;
end process;

end arch;
