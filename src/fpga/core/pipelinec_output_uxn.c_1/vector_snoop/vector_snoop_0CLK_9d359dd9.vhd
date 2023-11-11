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
-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l195_c1_99c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l195_c2_cc43]
signal screen_vector_MUX_uxn_c_l195_c2_cc43_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l195_c2_cc43_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l196_c7_12ea]
signal BIN_OP_EQ_uxn_c_l196_c7_12ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l196_c7_12ea_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l196_c1_35e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l201_c8_a918]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l196_c3_8177]
signal screen_vector_MUX_uxn_c_l196_c3_8177_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_8177_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_8177_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l196_c3_8177_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l197_c4_a39c]
signal BIN_OP_AND_uxn_c_l197_c4_a39c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_a39c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_c_l197_c4_a39c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l198_c22_a735]
signal CONST_SL_8_uxn_c_l198_c22_a735_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l198_c22_a735_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l198_c4_e2bb]
signal BIN_OP_OR_uxn_c_l198_c4_e2bb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_e2bb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l199_c4_4293[uxn_c_l199_c4_4293]
signal printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l201_c12_774e]
signal BIN_OP_EQ_uxn_c_l201_c12_774e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c12_774e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_c_l201_c12_774e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l201_c1_5fa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l201_c8_a918]
signal screen_vector_MUX_uxn_c_l201_c8_a918_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_a918_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_a918_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l201_c8_a918_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l202_c4_310c]
signal BIN_OP_AND_uxn_c_l202_c4_310c_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_310c_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l202_c4_310c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l203_c4_78d5]
signal BIN_OP_OR_uxn_c_l203_c4_78d5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_78d5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l203_c4_78d5_return_output : unsigned(15 downto 0);

-- printf_uxn_c_l204_c4_0eaf[uxn_c_l204_c4_0eaf]
signal printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0 : unsigned(31 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output);

-- screen_vector_MUX_uxn_c_l195_c2_cc43
screen_vector_MUX_uxn_c_l195_c2_cc43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l195_c2_cc43_cond,
screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue,
screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse,
screen_vector_MUX_uxn_c_l195_c2_cc43_return_output);

-- BIN_OP_EQ_uxn_c_l196_c7_12ea
BIN_OP_EQ_uxn_c_l196_c7_12ea : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l196_c7_12ea_left,
BIN_OP_EQ_uxn_c_l196_c7_12ea_right,
BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output);

-- screen_vector_MUX_uxn_c_l196_c3_8177
screen_vector_MUX_uxn_c_l196_c3_8177 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l196_c3_8177_cond,
screen_vector_MUX_uxn_c_l196_c3_8177_iftrue,
screen_vector_MUX_uxn_c_l196_c3_8177_iffalse,
screen_vector_MUX_uxn_c_l196_c3_8177_return_output);

-- BIN_OP_AND_uxn_c_l197_c4_a39c
BIN_OP_AND_uxn_c_l197_c4_a39c : entity work.BIN_OP_AND_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l197_c4_a39c_left,
BIN_OP_AND_uxn_c_l197_c4_a39c_right,
BIN_OP_AND_uxn_c_l197_c4_a39c_return_output);

-- CONST_SL_8_uxn_c_l198_c22_a735
CONST_SL_8_uxn_c_l198_c22_a735 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l198_c22_a735_x,
CONST_SL_8_uxn_c_l198_c22_a735_return_output);

-- BIN_OP_OR_uxn_c_l198_c4_e2bb
BIN_OP_OR_uxn_c_l198_c4_e2bb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l198_c4_e2bb_left,
BIN_OP_OR_uxn_c_l198_c4_e2bb_right,
BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output);

-- printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293
printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293 : entity work.printf_uxn_c_l199_c4_4293_0CLK_de264c78 port map (
printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE,
printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0);

-- BIN_OP_EQ_uxn_c_l201_c12_774e
BIN_OP_EQ_uxn_c_l201_c12_774e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l201_c12_774e_left,
BIN_OP_EQ_uxn_c_l201_c12_774e_right,
BIN_OP_EQ_uxn_c_l201_c12_774e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output);

-- screen_vector_MUX_uxn_c_l201_c8_a918
screen_vector_MUX_uxn_c_l201_c8_a918 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l201_c8_a918_cond,
screen_vector_MUX_uxn_c_l201_c8_a918_iftrue,
screen_vector_MUX_uxn_c_l201_c8_a918_iffalse,
screen_vector_MUX_uxn_c_l201_c8_a918_return_output);

-- BIN_OP_AND_uxn_c_l202_c4_310c
BIN_OP_AND_uxn_c_l202_c4_310c : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l202_c4_310c_left,
BIN_OP_AND_uxn_c_l202_c4_310c_right,
BIN_OP_AND_uxn_c_l202_c4_310c_return_output);

-- BIN_OP_OR_uxn_c_l203_c4_78d5
BIN_OP_OR_uxn_c_l203_c4_78d5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l203_c4_78d5_left,
BIN_OP_OR_uxn_c_l203_c4_78d5_right,
BIN_OP_OR_uxn_c_l203_c4_78d5_return_output);

-- printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf
printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf : entity work.printf_uxn_c_l204_c4_0eaf_0CLK_de264c78 port map (
printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE,
printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0);



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
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output,
 screen_vector_MUX_uxn_c_l195_c2_cc43_return_output,
 BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output,
 screen_vector_MUX_uxn_c_l196_c3_8177_return_output,
 BIN_OP_AND_uxn_c_l197_c4_a39c_return_output,
 CONST_SL_8_uxn_c_l198_c22_a735_return_output,
 BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output,
 BIN_OP_EQ_uxn_c_l201_c12_774e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output,
 screen_vector_MUX_uxn_c_l201_c8_a918_return_output,
 BIN_OP_AND_uxn_c_l202_c4_310c_return_output,
 BIN_OP_OR_uxn_c_l203_c4_78d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_8177_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l198_c4_067a : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_a918_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l196_c3_8177_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l198_c22_a735_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l198_c22_a735_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_uxn_c_l203_c4_d113 : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l201_c8_a918_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_310c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_310c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l202_c4_310c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_return_output : unsigned(15 downto 0);
 variable VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_4d3c_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_right := to_unsigned(32, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_c_l202_c4_310c_right := to_unsigned(65280, 16);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_right := to_unsigned(33, 6);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_left := VAR_device_ram_address;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond := VAR_is_device_ram_write;
     VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l202_c4_310c_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l197_c4_a39c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l197_c4_a39c_left <= VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_left;
     BIN_OP_AND_uxn_c_l197_c4_a39c_right <= VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_return_output := BIN_OP_AND_uxn_c_l197_c4_a39c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_4d3c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_4d3c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_EQ[uxn_c_l201_c12_774e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l201_c12_774e_left <= VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_left;
     BIN_OP_EQ_uxn_c_l201_c12_774e_right <= VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_return_output := BIN_OP_EQ_uxn_c_l201_c12_774e_return_output;

     -- BIN_OP_EQ[uxn_c_l196_c7_12ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l196_c7_12ea_left <= VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_left;
     BIN_OP_EQ_uxn_c_l196_c7_12ea_right <= VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output := BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output;

     -- BIN_OP_AND[uxn_c_l202_c4_310c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l202_c4_310c_left <= VAR_BIN_OP_AND_uxn_c_l202_c4_310c_left;
     BIN_OP_AND_uxn_c_l202_c4_310c_right <= VAR_BIN_OP_AND_uxn_c_l202_c4_310c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l202_c4_310c_return_output := BIN_OP_AND_uxn_c_l202_c4_310c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l195_c1_99c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_left := VAR_BIN_OP_AND_uxn_c_l197_c4_a39c_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_left := VAR_BIN_OP_AND_uxn_c_l202_c4_310c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output;
     VAR_screen_vector_MUX_uxn_c_l196_c3_8177_cond := VAR_BIN_OP_EQ_uxn_c_l196_c7_12ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond := VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_return_output;
     VAR_screen_vector_MUX_uxn_c_l201_c8_a918_cond := VAR_BIN_OP_EQ_uxn_c_l201_c12_774e_return_output;
     VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_4d3c_return_output;
     VAR_CONST_SL_8_uxn_c_l198_c22_a735_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l203_l198_DUPLICATE_4d3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l195_c1_99c2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l201_c8_a918] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l196_c1_35e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output;

     -- BIN_OP_OR[uxn_c_l203_c4_78d5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l203_c4_78d5_left <= VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_left;
     BIN_OP_OR_uxn_c_l203_c4_78d5_right <= VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_return_output := BIN_OP_OR_uxn_c_l203_c4_78d5_return_output;

     -- CONST_SL_8[uxn_c_l198_c22_a735] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l198_c22_a735_x <= VAR_CONST_SL_8_uxn_c_l198_c22_a735_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l198_c22_a735_return_output := CONST_SL_8_uxn_c_l198_c22_a735_return_output;

     -- Submodule level 2
     VAR_screen_vector_uxn_c_l203_c4_d113 := VAR_BIN_OP_OR_uxn_c_l203_c4_78d5_return_output;
     VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_right := VAR_CONST_SL_8_uxn_c_l198_c22_a735_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l201_c8_a918_return_output;
     VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l196_c1_35e1_return_output;
     VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0 := resize(VAR_screen_vector_uxn_c_l203_c4_d113, 32);
     VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iftrue := VAR_screen_vector_uxn_c_l203_c4_d113;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l201_c1_5fa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output;

     -- screen_vector_MUX[uxn_c_l201_c8_a918] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l201_c8_a918_cond <= VAR_screen_vector_MUX_uxn_c_l201_c8_a918_cond;
     screen_vector_MUX_uxn_c_l201_c8_a918_iftrue <= VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iftrue;
     screen_vector_MUX_uxn_c_l201_c8_a918_iffalse <= VAR_screen_vector_MUX_uxn_c_l201_c8_a918_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l201_c8_a918_return_output := screen_vector_MUX_uxn_c_l201_c8_a918_return_output;

     -- BIN_OP_OR[uxn_c_l198_c4_e2bb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l198_c4_e2bb_left <= VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_left;
     BIN_OP_OR_uxn_c_l198_c4_e2bb_right <= VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output := BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output;

     -- Submodule level 3
     VAR_screen_vector_uxn_c_l198_c4_067a := VAR_BIN_OP_OR_uxn_c_l198_c4_e2bb_return_output;
     VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l201_c1_5fa0_return_output;
     VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iffalse := VAR_screen_vector_MUX_uxn_c_l201_c8_a918_return_output;
     VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0 := resize(VAR_screen_vector_uxn_c_l198_c4_067a, 32);
     VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iftrue := VAR_screen_vector_uxn_c_l198_c4_067a;
     -- printf_uxn_c_l199_c4_4293[uxn_c_l199_c4_4293] LATENCY=0
     -- Clock enable
     printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE <= VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0 <= VAR_printf_uxn_c_l199_c4_4293_uxn_c_l199_c4_4293_arg0;
     -- Outputs

     -- screen_vector_MUX[uxn_c_l196_c3_8177] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l196_c3_8177_cond <= VAR_screen_vector_MUX_uxn_c_l196_c3_8177_cond;
     screen_vector_MUX_uxn_c_l196_c3_8177_iftrue <= VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iftrue;
     screen_vector_MUX_uxn_c_l196_c3_8177_iffalse <= VAR_screen_vector_MUX_uxn_c_l196_c3_8177_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l196_c3_8177_return_output := screen_vector_MUX_uxn_c_l196_c3_8177_return_output;

     -- printf_uxn_c_l204_c4_0eaf[uxn_c_l204_c4_0eaf] LATENCY=0
     -- Clock enable
     printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE <= VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0 <= VAR_printf_uxn_c_l204_c4_0eaf_uxn_c_l204_c4_0eaf_arg0;
     -- Outputs

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue := VAR_screen_vector_MUX_uxn_c_l196_c3_8177_return_output;
     -- screen_vector_MUX[uxn_c_l195_c2_cc43] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l195_c2_cc43_cond <= VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_cond;
     screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue <= VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iftrue;
     screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse <= VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_return_output := screen_vector_MUX_uxn_c_l195_c2_cc43_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l195_c2_cc43_return_output;
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
