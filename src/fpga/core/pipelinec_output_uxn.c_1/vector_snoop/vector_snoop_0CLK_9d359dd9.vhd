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
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_fabc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l186_c2_26ac]
signal screen_vector_MUX_uxn_c_l186_c2_26ac_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_26ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l187_c7_8e29]
signal BIN_OP_EQ_uxn_c_l187_c7_8e29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_8e29_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_2c44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_0484]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l187_c3_1308]
signal screen_vector_MUX_uxn_c_l187_c3_1308_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1308_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1308_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_1308_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l188_c4_72a4]
signal BIN_OP_AND_uxn_c_l188_c4_72a4_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_72a4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_72a4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l189_c22_4834]
signal CONST_SL_8_uxn_c_l189_c22_4834_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l189_c22_4834_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l189_c4_ba6e]
signal BIN_OP_OR_uxn_c_l189_c4_ba6e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_ba6e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l190_c4_5d39[uxn_c_l190_c4_5d39]
signal printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l192_c12_f508]
signal BIN_OP_EQ_uxn_c_l192_c12_f508_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_f508_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_f508_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_cacd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l192_c8_0484]
signal screen_vector_MUX_uxn_c_l192_c8_0484_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_0484_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_0484_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_0484_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l193_c4_a6d6]
signal BIN_OP_AND_uxn_c_l193_c4_a6d6_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_a6d6_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l194_c4_460b]
signal BIN_OP_OR_uxn_c_l194_c4_460b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_460b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_460b_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l195_c4_56f4[uxn_c_l195_c4_56f4]
signal printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0 : unsigned(31 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output);

-- screen_vector_MUX_uxn_c_l186_c2_26ac
screen_vector_MUX_uxn_c_l186_c2_26ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c2_26ac_cond,
screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue,
screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse,
screen_vector_MUX_uxn_c_l186_c2_26ac_return_output);

-- BIN_OP_EQ_uxn_c_l187_c7_8e29
BIN_OP_EQ_uxn_c_l187_c7_8e29 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l187_c7_8e29_left,
BIN_OP_EQ_uxn_c_l187_c7_8e29_right,
BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output);

-- screen_vector_MUX_uxn_c_l187_c3_1308
screen_vector_MUX_uxn_c_l187_c3_1308 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l187_c3_1308_cond,
screen_vector_MUX_uxn_c_l187_c3_1308_iftrue,
screen_vector_MUX_uxn_c_l187_c3_1308_iffalse,
screen_vector_MUX_uxn_c_l187_c3_1308_return_output);

-- BIN_OP_AND_uxn_c_l188_c4_72a4
BIN_OP_AND_uxn_c_l188_c4_72a4 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c4_72a4_left,
BIN_OP_AND_uxn_c_l188_c4_72a4_right,
BIN_OP_AND_uxn_c_l188_c4_72a4_return_output);

-- CONST_SL_8_uxn_c_l189_c22_4834
CONST_SL_8_uxn_c_l189_c22_4834 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l189_c22_4834_x,
CONST_SL_8_uxn_c_l189_c22_4834_return_output);

-- BIN_OP_OR_uxn_c_l189_c4_ba6e
BIN_OP_OR_uxn_c_l189_c4_ba6e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l189_c4_ba6e_left,
BIN_OP_OR_uxn_c_l189_c4_ba6e_right,
BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output);

-- printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39
printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39 : entity work.printf_uxn_c_l190_c4_5d39_0CLK_de264c78 port map (
printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE,
printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0);

-- BIN_OP_EQ_uxn_c_l192_c12_f508
BIN_OP_EQ_uxn_c_l192_c12_f508 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l192_c12_f508_left,
BIN_OP_EQ_uxn_c_l192_c12_f508_right,
BIN_OP_EQ_uxn_c_l192_c12_f508_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output);

-- screen_vector_MUX_uxn_c_l192_c8_0484
screen_vector_MUX_uxn_c_l192_c8_0484 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l192_c8_0484_cond,
screen_vector_MUX_uxn_c_l192_c8_0484_iftrue,
screen_vector_MUX_uxn_c_l192_c8_0484_iffalse,
screen_vector_MUX_uxn_c_l192_c8_0484_return_output);

-- BIN_OP_AND_uxn_c_l193_c4_a6d6
BIN_OP_AND_uxn_c_l193_c4_a6d6 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l193_c4_a6d6_left,
BIN_OP_AND_uxn_c_l193_c4_a6d6_right,
BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output);

-- BIN_OP_OR_uxn_c_l194_c4_460b
BIN_OP_OR_uxn_c_l194_c4_460b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l194_c4_460b_left,
BIN_OP_OR_uxn_c_l194_c4_460b_right,
BIN_OP_OR_uxn_c_l194_c4_460b_return_output);

-- printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4
printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4 : entity work.printf_uxn_c_l195_c4_56f4_0CLK_de264c78 port map (
printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE,
printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0);



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
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output,
 screen_vector_MUX_uxn_c_l186_c2_26ac_return_output,
 BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output,
 screen_vector_MUX_uxn_c_l187_c3_1308_return_output,
 BIN_OP_AND_uxn_c_l188_c4_72a4_return_output,
 CONST_SL_8_uxn_c_l189_c22_4834_return_output,
 BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output,
 BIN_OP_EQ_uxn_c_l192_c12_f508_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output,
 screen_vector_MUX_uxn_c_l192_c8_0484_return_output,
 BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output,
 BIN_OP_OR_uxn_c_l194_c4_460b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1308_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l189_c4_4be6 : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_0484_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_1308_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_4834_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_4834_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l194_c4_f08d : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_0484_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_460b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_460b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_460b_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_7496_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_right := to_unsigned(255, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_right := to_unsigned(65280, 16);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_left := VAR_device_ram_address;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond := VAR_is_device_ram_write;
     VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l188_c4_72a4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c4_72a4_left <= VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_left;
     BIN_OP_AND_uxn_c_l188_c4_72a4_right <= VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_return_output := BIN_OP_AND_uxn_c_l188_c4_72a4_return_output;

     -- BIN_OP_EQ[uxn_c_l192_c12_f508] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l192_c12_f508_left <= VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_left;
     BIN_OP_EQ_uxn_c_l192_c12_f508_right <= VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_return_output := BIN_OP_EQ_uxn_c_l192_c12_f508_return_output;

     -- BIN_OP_AND[uxn_c_l193_c4_a6d6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l193_c4_a6d6_left <= VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_left;
     BIN_OP_AND_uxn_c_l193_c4_a6d6_right <= VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output := BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output;

     -- BIN_OP_EQ[uxn_c_l187_c7_8e29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l187_c7_8e29_left <= VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_left;
     BIN_OP_EQ_uxn_c_l187_c7_8e29_right <= VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output := BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_fabc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_7496 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_7496_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_left := VAR_BIN_OP_AND_uxn_c_l188_c4_72a4_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_460b_left := VAR_BIN_OP_AND_uxn_c_l193_c4_a6d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_1308_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_8e29_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_return_output;
     VAR_screen_vector_MUX_uxn_c_l192_c8_0484_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_f508_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_460b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_7496_return_output;
     VAR_CONST_SL_8_uxn_c_l189_c22_4834_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l189_l194_DUPLICATE_7496_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_fabc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_0484] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output;

     -- BIN_OP_OR[uxn_c_l194_c4_460b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l194_c4_460b_left <= VAR_BIN_OP_OR_uxn_c_l194_c4_460b_left;
     BIN_OP_OR_uxn_c_l194_c4_460b_right <= VAR_BIN_OP_OR_uxn_c_l194_c4_460b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l194_c4_460b_return_output := BIN_OP_OR_uxn_c_l194_c4_460b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_2c44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output;

     -- CONST_SL_8[uxn_c_l189_c22_4834] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l189_c22_4834_x <= VAR_CONST_SL_8_uxn_c_l189_c22_4834_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l189_c22_4834_return_output := CONST_SL_8_uxn_c_l189_c22_4834_return_output;

     -- Submodule level 2
     VAR_screen_vector_uxn_c_l194_c4_f08d := VAR_BIN_OP_OR_uxn_c_l194_c4_460b_return_output;
     VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_right := VAR_CONST_SL_8_uxn_c_l189_c22_4834_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_0484_return_output;
     VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_2c44_return_output;
     VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0 := resize(VAR_screen_vector_uxn_c_l194_c4_f08d, 32);
     VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iftrue := VAR_screen_vector_uxn_c_l194_c4_f08d;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_cacd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output;

     -- BIN_OP_OR[uxn_c_l189_c4_ba6e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l189_c4_ba6e_left <= VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_left;
     BIN_OP_OR_uxn_c_l189_c4_ba6e_right <= VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output := BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output;

     -- screen_vector_MUX[uxn_c_l192_c8_0484] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l192_c8_0484_cond <= VAR_screen_vector_MUX_uxn_c_l192_c8_0484_cond;
     screen_vector_MUX_uxn_c_l192_c8_0484_iftrue <= VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iftrue;
     screen_vector_MUX_uxn_c_l192_c8_0484_iffalse <= VAR_screen_vector_MUX_uxn_c_l192_c8_0484_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l192_c8_0484_return_output := screen_vector_MUX_uxn_c_l192_c8_0484_return_output;

     -- Submodule level 3
     VAR_screen_vector_uxn_c_l189_c4_4be6 := VAR_BIN_OP_OR_uxn_c_l189_c4_ba6e_return_output;
     VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_cacd_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iffalse := VAR_screen_vector_MUX_uxn_c_l192_c8_0484_return_output;
     VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0 := resize(VAR_screen_vector_uxn_c_l189_c4_4be6, 32);
     VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iftrue := VAR_screen_vector_uxn_c_l189_c4_4be6;
     -- printf_uxn_c_l195_c4_56f4[uxn_c_l195_c4_56f4] LATENCY=0
     -- Clock enable
     printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE <= VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0 <= VAR_printf_uxn_c_l195_c4_56f4_uxn_c_l195_c4_56f4_arg0;
     -- Outputs

     -- screen_vector_MUX[uxn_c_l187_c3_1308] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l187_c3_1308_cond <= VAR_screen_vector_MUX_uxn_c_l187_c3_1308_cond;
     screen_vector_MUX_uxn_c_l187_c3_1308_iftrue <= VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iftrue;
     screen_vector_MUX_uxn_c_l187_c3_1308_iffalse <= VAR_screen_vector_MUX_uxn_c_l187_c3_1308_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l187_c3_1308_return_output := screen_vector_MUX_uxn_c_l187_c3_1308_return_output;

     -- printf_uxn_c_l190_c4_5d39[uxn_c_l190_c4_5d39] LATENCY=0
     -- Clock enable
     printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE <= VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0 <= VAR_printf_uxn_c_l190_c4_5d39_uxn_c_l190_c4_5d39_arg0;
     -- Outputs

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue := VAR_screen_vector_MUX_uxn_c_l187_c3_1308_return_output;
     -- screen_vector_MUX[uxn_c_l186_c2_26ac] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c2_26ac_cond <= VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_cond;
     screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iftrue;
     screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_return_output := screen_vector_MUX_uxn_c_l186_c2_26ac_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l186_c2_26ac_return_output;
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
