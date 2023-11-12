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
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_e885]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l186_c2_e4c5]
signal screen_vector_MUX_uxn_c_l186_c2_e4c5_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l187_c7_c93a]
signal BIN_OP_EQ_uxn_c_l187_c7_c93a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_c93a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_9b16]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_a5bb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l187_c3_79f6]
signal screen_vector_MUX_uxn_c_l187_c3_79f6_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l187_c3_79f6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l188_c4_e359]
signal BIN_OP_AND_uxn_c_l188_c4_e359_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_e359_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l188_c4_e359_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l189_c22_4b26]
signal CONST_SL_8_uxn_c_l189_c22_4b26_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l189_c22_4b26_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l189_c4_9696]
signal BIN_OP_OR_uxn_c_l189_c4_9696_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_9696_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l189_c4_9696_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l190_c4_19a0[uxn_c_l190_c4_19a0]
signal printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l192_c12_8e30]
signal BIN_OP_EQ_uxn_c_l192_c12_8e30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_8e30_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_240d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l192_c8_a5bb]
signal screen_vector_MUX_uxn_c_l192_c8_a5bb_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l193_c4_8b88]
signal BIN_OP_AND_uxn_c_l193_c4_8b88_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_8b88_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l193_c4_8b88_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l194_c4_93b8]
signal BIN_OP_OR_uxn_c_l194_c4_93b8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_93b8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l194_c4_93b8_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l195_c4_a3dc[uxn_c_l195_c4_a3dc]
signal printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0 : unsigned(31 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output);

-- screen_vector_MUX_uxn_c_l186_c2_e4c5
screen_vector_MUX_uxn_c_l186_c2_e4c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l186_c2_e4c5_cond,
screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue,
screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse,
screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output);

-- BIN_OP_EQ_uxn_c_l187_c7_c93a
BIN_OP_EQ_uxn_c_l187_c7_c93a : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l187_c7_c93a_left,
BIN_OP_EQ_uxn_c_l187_c7_c93a_right,
BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output);

-- screen_vector_MUX_uxn_c_l187_c3_79f6
screen_vector_MUX_uxn_c_l187_c3_79f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l187_c3_79f6_cond,
screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue,
screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse,
screen_vector_MUX_uxn_c_l187_c3_79f6_return_output);

-- BIN_OP_AND_uxn_c_l188_c4_e359
BIN_OP_AND_uxn_c_l188_c4_e359 : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l188_c4_e359_left,
BIN_OP_AND_uxn_c_l188_c4_e359_right,
BIN_OP_AND_uxn_c_l188_c4_e359_return_output);

-- CONST_SL_8_uxn_c_l189_c22_4b26
CONST_SL_8_uxn_c_l189_c22_4b26 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l189_c22_4b26_x,
CONST_SL_8_uxn_c_l189_c22_4b26_return_output);

-- BIN_OP_OR_uxn_c_l189_c4_9696
BIN_OP_OR_uxn_c_l189_c4_9696 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l189_c4_9696_left,
BIN_OP_OR_uxn_c_l189_c4_9696_right,
BIN_OP_OR_uxn_c_l189_c4_9696_return_output);

-- printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0
printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0 : entity work.printf_uxn_c_l190_c4_19a0_0CLK_de264c78 port map (
printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE,
printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0);

-- BIN_OP_EQ_uxn_c_l192_c12_8e30
BIN_OP_EQ_uxn_c_l192_c12_8e30 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l192_c12_8e30_left,
BIN_OP_EQ_uxn_c_l192_c12_8e30_right,
BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output);

-- screen_vector_MUX_uxn_c_l192_c8_a5bb
screen_vector_MUX_uxn_c_l192_c8_a5bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l192_c8_a5bb_cond,
screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue,
screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse,
screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output);

-- BIN_OP_AND_uxn_c_l193_c4_8b88
BIN_OP_AND_uxn_c_l193_c4_8b88 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l193_c4_8b88_left,
BIN_OP_AND_uxn_c_l193_c4_8b88_right,
BIN_OP_AND_uxn_c_l193_c4_8b88_return_output);

-- BIN_OP_OR_uxn_c_l194_c4_93b8
BIN_OP_OR_uxn_c_l194_c4_93b8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l194_c4_93b8_left,
BIN_OP_OR_uxn_c_l194_c4_93b8_right,
BIN_OP_OR_uxn_c_l194_c4_93b8_return_output);

-- printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc
printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc : entity work.printf_uxn_c_l195_c4_a3dc_0CLK_de264c78 port map (
printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE,
printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0);



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
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output,
 screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output,
 BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output,
 screen_vector_MUX_uxn_c_l187_c3_79f6_return_output,
 BIN_OP_AND_uxn_c_l188_c4_e359_return_output,
 CONST_SL_8_uxn_c_l189_c22_4b26_return_output,
 BIN_OP_OR_uxn_c_l189_c4_9696_return_output,
 BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output,
 screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output,
 BIN_OP_AND_uxn_c_l193_c4_8b88_return_output,
 BIN_OP_OR_uxn_c_l194_c4_93b8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l189_c4_f8bf : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_e359_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_e359_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l188_c4_e359_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_9696_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_9696_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_4b26_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l189_c22_4b26_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l189_c4_9696_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l194_c4_2f4c : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l194_l189_DUPLICATE_4022_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l188_c4_e359_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_right := to_unsigned(32, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_left := VAR_device_ram_address;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond := VAR_is_device_ram_write;
     VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l188_c4_e359_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse := screen_vector;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l186_c1_e885] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output;

     -- BIN_OP_AND[uxn_c_l188_c4_e359] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l188_c4_e359_left <= VAR_BIN_OP_AND_uxn_c_l188_c4_e359_left;
     BIN_OP_AND_uxn_c_l188_c4_e359_right <= VAR_BIN_OP_AND_uxn_c_l188_c4_e359_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l188_c4_e359_return_output := BIN_OP_AND_uxn_c_l188_c4_e359_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l194_l189_DUPLICATE_4022 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l194_l189_DUPLICATE_4022_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l193_c4_8b88] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l193_c4_8b88_left <= VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_left;
     BIN_OP_AND_uxn_c_l193_c4_8b88_right <= VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_return_output := BIN_OP_AND_uxn_c_l193_c4_8b88_return_output;

     -- BIN_OP_EQ[uxn_c_l192_c12_8e30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l192_c12_8e30_left <= VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_left;
     BIN_OP_EQ_uxn_c_l192_c12_8e30_right <= VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output := BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output;

     -- BIN_OP_EQ[uxn_c_l187_c7_c93a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l187_c7_c93a_left <= VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_left;
     BIN_OP_EQ_uxn_c_l187_c7_c93a_right <= VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output := BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l189_c4_9696_left := VAR_BIN_OP_AND_uxn_c_l188_c4_e359_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_left := VAR_BIN_OP_AND_uxn_c_l193_c4_8b88_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_cond := VAR_BIN_OP_EQ_uxn_c_l187_c7_c93a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output;
     VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_cond := VAR_BIN_OP_EQ_uxn_c_l192_c12_8e30_return_output;
     VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l194_l189_DUPLICATE_4022_return_output;
     VAR_CONST_SL_8_uxn_c_l189_c22_4b26_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l194_l189_DUPLICATE_4022_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l186_c1_e885_return_output;
     -- BIN_OP_OR[uxn_c_l194_c4_93b8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l194_c4_93b8_left <= VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_left;
     BIN_OP_OR_uxn_c_l194_c4_93b8_right <= VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_return_output := BIN_OP_OR_uxn_c_l194_c4_93b8_return_output;

     -- CONST_SL_8[uxn_c_l189_c22_4b26] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l189_c22_4b26_x <= VAR_CONST_SL_8_uxn_c_l189_c22_4b26_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l189_c22_4b26_return_output := CONST_SL_8_uxn_c_l189_c22_4b26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l187_c1_9b16] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l192_c8_a5bb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output;

     -- Submodule level 2
     VAR_screen_vector_uxn_c_l194_c4_2f4c := VAR_BIN_OP_OR_uxn_c_l194_c4_93b8_return_output;
     VAR_BIN_OP_OR_uxn_c_l189_c4_9696_right := VAR_CONST_SL_8_uxn_c_l189_c22_4b26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l192_c8_a5bb_return_output;
     VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l187_c1_9b16_return_output;
     VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0 := resize(VAR_screen_vector_uxn_c_l194_c4_2f4c, 32);
     VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue := VAR_screen_vector_uxn_c_l194_c4_2f4c;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l192_c1_240d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output;

     -- BIN_OP_OR[uxn_c_l189_c4_9696] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l189_c4_9696_left <= VAR_BIN_OP_OR_uxn_c_l189_c4_9696_left;
     BIN_OP_OR_uxn_c_l189_c4_9696_right <= VAR_BIN_OP_OR_uxn_c_l189_c4_9696_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l189_c4_9696_return_output := BIN_OP_OR_uxn_c_l189_c4_9696_return_output;

     -- screen_vector_MUX[uxn_c_l192_c8_a5bb] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l192_c8_a5bb_cond <= VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_cond;
     screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue <= VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iftrue;
     screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse <= VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output := screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output;

     -- Submodule level 3
     VAR_screen_vector_uxn_c_l189_c4_f8bf := VAR_BIN_OP_OR_uxn_c_l189_c4_9696_return_output;
     VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l192_c1_240d_return_output;
     VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse := VAR_screen_vector_MUX_uxn_c_l192_c8_a5bb_return_output;
     VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0 := resize(VAR_screen_vector_uxn_c_l189_c4_f8bf, 32);
     VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue := VAR_screen_vector_uxn_c_l189_c4_f8bf;
     -- printf_uxn_c_l195_c4_a3dc[uxn_c_l195_c4_a3dc] LATENCY=0
     -- Clock enable
     printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE <= VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0 <= VAR_printf_uxn_c_l195_c4_a3dc_uxn_c_l195_c4_a3dc_arg0;
     -- Outputs

     -- screen_vector_MUX[uxn_c_l187_c3_79f6] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l187_c3_79f6_cond <= VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_cond;
     screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue <= VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iftrue;
     screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse <= VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_return_output := screen_vector_MUX_uxn_c_l187_c3_79f6_return_output;

     -- printf_uxn_c_l190_c4_19a0[uxn_c_l190_c4_19a0] LATENCY=0
     -- Clock enable
     printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE <= VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0 <= VAR_printf_uxn_c_l190_c4_19a0_uxn_c_l190_c4_19a0_arg0;
     -- Outputs

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue := VAR_screen_vector_MUX_uxn_c_l187_c3_79f6_return_output;
     -- screen_vector_MUX[uxn_c_l186_c2_e4c5] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l186_c2_e4c5_cond <= VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_cond;
     screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue <= VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iftrue;
     screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse <= VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output := screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l186_c2_e4c5_return_output;
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
