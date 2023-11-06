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
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l195_c1_0ad3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l195_c2_54f6]
signal screen_vector_MUX_uxn_c_l195_c2_54f6_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_54f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l196_c7_d2e7]
signal BIN_OP_EQ_uxn_c_l196_c7_d2e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l196_c7_d2e7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l196_c1_a753]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l201_c8_f92d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l196_c3_6c9c]
signal screen_vector_MUX_uxn_c_l196_c3_6c9c_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l197_c4_397e]
signal BIN_OP_AND_uxn_c_l197_c4_397e_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_397e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_397e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l198_c22_ecd5]
signal CONST_SL_8_uxn_c_l198_c22_ecd5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l198_c22_ecd5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l198_c4_9bd6]
signal BIN_OP_OR_uxn_c_l198_c4_9bd6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_9bd6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l199_c4_4bda[uxn_c_l199_c4_4bda]
signal printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l201_c12_958d]
signal BIN_OP_EQ_uxn_c_l201_c12_958d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c12_958d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c12_958d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l201_c1_6bb2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l201_c8_f92d]
signal screen_vector_MUX_uxn_c_l201_c8_f92d_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_f92d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l202_c4_8d7b]
signal BIN_OP_AND_uxn_c_l202_c4_8d7b_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_8d7b_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l203_c4_6d1d]
signal BIN_OP_OR_uxn_c_l203_c4_6d1d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_6d1d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l204_c4_01fd[uxn_c_l204_c4_01fd]
signal printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0 : unsigned(31 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output);

-- screen_vector_MUX_uxn_c_l195_c2_54f6
screen_vector_MUX_uxn_c_l195_c2_54f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l195_c2_54f6_cond,
screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue,
screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse,
screen_vector_MUX_uxn_c_l195_c2_54f6_return_output);

-- BIN_OP_EQ_uxn_c_l196_c7_d2e7
BIN_OP_EQ_uxn_c_l196_c7_d2e7 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l196_c7_d2e7_left,
BIN_OP_EQ_uxn_c_l196_c7_d2e7_right,
BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output);

-- screen_vector_MUX_uxn_c_l196_c3_6c9c
screen_vector_MUX_uxn_c_l196_c3_6c9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l196_c3_6c9c_cond,
screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue,
screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse,
screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output);

-- BIN_OP_AND_uxn_c_l197_c4_397e
BIN_OP_AND_uxn_c_l197_c4_397e : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l197_c4_397e_left,
BIN_OP_AND_uxn_c_l197_c4_397e_right,
BIN_OP_AND_uxn_c_l197_c4_397e_return_output);

-- CONST_SL_8_uxn_c_l198_c22_ecd5
CONST_SL_8_uxn_c_l198_c22_ecd5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l198_c22_ecd5_x,
CONST_SL_8_uxn_c_l198_c22_ecd5_return_output);

-- BIN_OP_OR_uxn_c_l198_c4_9bd6
BIN_OP_OR_uxn_c_l198_c4_9bd6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l198_c4_9bd6_left,
BIN_OP_OR_uxn_c_l198_c4_9bd6_right,
BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output);

-- printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda
printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda : entity work.printf_uxn_c_l199_c4_4bda_0CLK_de264c78 port map (
printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE,
printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0);

-- BIN_OP_EQ_uxn_c_l201_c12_958d
BIN_OP_EQ_uxn_c_l201_c12_958d : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l201_c12_958d_left,
BIN_OP_EQ_uxn_c_l201_c12_958d_right,
BIN_OP_EQ_uxn_c_l201_c12_958d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output);

-- screen_vector_MUX_uxn_c_l201_c8_f92d
screen_vector_MUX_uxn_c_l201_c8_f92d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l201_c8_f92d_cond,
screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue,
screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse,
screen_vector_MUX_uxn_c_l201_c8_f92d_return_output);

-- BIN_OP_AND_uxn_c_l202_c4_8d7b
BIN_OP_AND_uxn_c_l202_c4_8d7b : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c4_8d7b_left,
BIN_OP_AND_uxn_c_l202_c4_8d7b_right,
BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output);

-- BIN_OP_OR_uxn_c_l203_c4_6d1d
BIN_OP_OR_uxn_c_l203_c4_6d1d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l203_c4_6d1d_left,
BIN_OP_OR_uxn_c_l203_c4_6d1d_right,
BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output);

-- printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd
printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd : entity work.printf_uxn_c_l204_c4_01fd_0CLK_de264c78 port map (
printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE,
printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0);



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
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output,
 screen_vector_MUX_uxn_c_l195_c2_54f6_return_output,
 BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output,
 screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output,
 BIN_OP_AND_uxn_c_l197_c4_397e_return_output,
 CONST_SL_8_uxn_c_l198_c22_ecd5_return_output,
 BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output,
 BIN_OP_EQ_uxn_c_l201_c12_958d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output,
 screen_vector_MUX_uxn_c_l201_c8_f92d_return_output,
 BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output,
 BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l198_c4_3026 : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_397e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_397e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_397e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l203_c4_e451 : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_f8dc_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l197_c4_397e_right := to_unsigned(255, 8);
     VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_right := to_unsigned(65280, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_right := to_unsigned(33, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_right := to_unsigned(32, 6);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_left := VAR_device_ram_address;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond := VAR_is_device_ram_write;
     VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l197_c4_397e_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse := screen_vector;
     -- CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_f8dc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_f8dc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l202_c4_8d7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c4_8d7b_left <= VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_left;
     BIN_OP_AND_uxn_c_l202_c4_8d7b_right <= VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output := BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l195_c1_0ad3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output;

     -- BIN_OP_EQ[uxn_c_l196_c7_d2e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l196_c7_d2e7_left <= VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_left;
     BIN_OP_EQ_uxn_c_l196_c7_d2e7_right <= VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output := BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output;

     -- BIN_OP_EQ[uxn_c_l201_c12_958d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l201_c12_958d_left <= VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_left;
     BIN_OP_EQ_uxn_c_l201_c12_958d_right <= VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_return_output := BIN_OP_EQ_uxn_c_l201_c12_958d_return_output;

     -- BIN_OP_AND[uxn_c_l197_c4_397e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l197_c4_397e_left <= VAR_BIN_OP_AND_uxn_c_l197_c4_397e_left;
     BIN_OP_AND_uxn_c_l197_c4_397e_right <= VAR_BIN_OP_AND_uxn_c_l197_c4_397e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l197_c4_397e_return_output := BIN_OP_AND_uxn_c_l197_c4_397e_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_left := VAR_BIN_OP_AND_uxn_c_l197_c4_397e_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_left := VAR_BIN_OP_AND_uxn_c_l202_c4_8d7b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output;
     VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_d2e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond := VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_return_output;
     VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_cond := VAR_BIN_OP_EQ_uxn_c_l201_c12_958d_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_f8dc_return_output;
     VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_f8dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_0ad3_return_output;
     -- BIN_OP_OR[uxn_c_l203_c4_6d1d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l203_c4_6d1d_left <= VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_left;
     BIN_OP_OR_uxn_c_l203_c4_6d1d_right <= VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output := BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l201_c8_f92d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output;

     -- CONST_SL_8[uxn_c_l198_c22_ecd5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l198_c22_ecd5_x <= VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_return_output := CONST_SL_8_uxn_c_l198_c22_ecd5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l196_c1_a753] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output;

     -- Submodule level 2
     VAR_screen_vector_uxn_c_l203_c4_e451 := VAR_BIN_OP_OR_uxn_c_l203_c4_6d1d_return_output;
     VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_right := VAR_CONST_SL_8_uxn_c_l198_c22_ecd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_f92d_return_output;
     VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_a753_return_output;
     VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0 := resize(VAR_screen_vector_uxn_c_l203_c4_e451, 32);
     VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue := VAR_screen_vector_uxn_c_l203_c4_e451;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l201_c1_6bb2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output;

     -- screen_vector_MUX[uxn_c_l201_c8_f92d] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l201_c8_f92d_cond <= VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_cond;
     screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue <= VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iftrue;
     screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse <= VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_return_output := screen_vector_MUX_uxn_c_l201_c8_f92d_return_output;

     -- BIN_OP_OR[uxn_c_l198_c4_9bd6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l198_c4_9bd6_left <= VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_left;
     BIN_OP_OR_uxn_c_l198_c4_9bd6_right <= VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output := BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output;

     -- Submodule level 3
     VAR_screen_vector_uxn_c_l198_c4_3026 := VAR_BIN_OP_OR_uxn_c_l198_c4_9bd6_return_output;
     VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_6bb2_return_output;
     VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse := VAR_screen_vector_MUX_uxn_c_l201_c8_f92d_return_output;
     VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0 := resize(VAR_screen_vector_uxn_c_l198_c4_3026, 32);
     VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue := VAR_screen_vector_uxn_c_l198_c4_3026;
     -- printf_uxn_c_l204_c4_01fd[uxn_c_l204_c4_01fd] LATENCY=0
     -- Clock enable
     printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE <= VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0 <= VAR_printf_uxn_c_l204_c4_01fd_uxn_c_l204_c4_01fd_arg0;
     -- Outputs

     -- printf_uxn_c_l199_c4_4bda[uxn_c_l199_c4_4bda] LATENCY=0
     -- Clock enable
     printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE <= VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0 <= VAR_printf_uxn_c_l199_c4_4bda_uxn_c_l199_c4_4bda_arg0;
     -- Outputs

     -- screen_vector_MUX[uxn_c_l196_c3_6c9c] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l196_c3_6c9c_cond <= VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_cond;
     screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue <= VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iftrue;
     screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse <= VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output := screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue := VAR_screen_vector_MUX_uxn_c_l196_c3_6c9c_return_output;
     -- screen_vector_MUX[uxn_c_l195_c2_54f6] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l195_c2_54f6_cond <= VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_cond;
     screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue <= VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iftrue;
     screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse <= VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_return_output := screen_vector_MUX_uxn_c_l195_c2_54f6_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l195_c2_54f6_return_output;
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
