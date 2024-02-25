-- Timing params:
--   Fixed?: False
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
-- Submodules: 19
entity uint8_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(7 downto 0);
 in1 : in unsigned(7 downto 0);
 in2 : in unsigned(7 downto 0);
 in3 : in unsigned(7 downto 0);
 in4 : in unsigned(7 downto 0);
 in5 : in unsigned(7 downto 0);
 in6 : in unsigned(7 downto 0);
 in7 : in unsigned(7 downto 0);
 in8 : in unsigned(7 downto 0);
 in9 : in unsigned(7 downto 0);
 in10 : in unsigned(7 downto 0);
 in11 : in unsigned(7 downto 0);
 in12 : in unsigned(7 downto 0);
 in13 : in unsigned(7 downto 0);
 in14 : in unsigned(7 downto 0);
 in15 : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end uint8_mux16_0CLK_4e6656cf;
architecture arch of uint8_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_867a]
signal layer0_node0_MUX_bit_math_h_l18_c3_867a_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_4226]
signal layer0_node1_MUX_bit_math_h_l29_c3_4226_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_4b94]
signal layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_bd69]
signal layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_c9cb]
signal layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_ce5a]
signal layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_ec54]
signal layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_42f9]
signal layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_0158]
signal layer1_node0_MUX_bit_math_h_l112_c3_0158_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_ecf1]
signal layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_365f]
signal layer1_node2_MUX_bit_math_h_l134_c3_365f_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_8b41]
signal layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_abc4]
signal layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_4470]
signal layer2_node1_MUX_bit_math_h_l173_c3_4470_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_a23b]
signal layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output : unsigned(7 downto 0);

function uint4_0_0( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint4_1_1( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint4_2_2( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint4_3_3( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_867a
layer0_node0_MUX_bit_math_h_l18_c3_867a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_867a_cond,
layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_4226
layer0_node1_MUX_bit_math_h_l29_c3_4226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_4226_cond,
layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_4b94
layer0_node2_MUX_bit_math_h_l40_c3_4b94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond,
layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_bd69
layer0_node3_MUX_bit_math_h_l51_c3_bd69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond,
layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_c9cb
layer0_node4_MUX_bit_math_h_l62_c3_c9cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond,
layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_ce5a
layer0_node5_MUX_bit_math_h_l73_c3_ce5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_ec54
layer0_node6_MUX_bit_math_h_l84_c3_ec54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond,
layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_42f9
layer0_node7_MUX_bit_math_h_l95_c3_42f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond,
layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_0158
layer1_node0_MUX_bit_math_h_l112_c3_0158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_0158_cond,
layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_ecf1
layer1_node1_MUX_bit_math_h_l123_c3_ecf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond,
layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_365f
layer1_node2_MUX_bit_math_h_l134_c3_365f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_365f_cond,
layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_8b41
layer1_node3_MUX_bit_math_h_l145_c3_8b41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond,
layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_abc4
layer2_node0_MUX_bit_math_h_l162_c3_abc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond,
layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_4470
layer2_node1_MUX_bit_math_h_l173_c3_4470 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_4470_cond,
layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_a23b
layer3_node0_MUX_bit_math_h_l190_c3_a23b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond,
layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 in4,
 in5,
 in6,
 in7,
 in8,
 in9,
 in10,
 in11,
 in12,
 in13,
 in14,
 in15,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(7 downto 0);
 variable VAR_in1 : unsigned(7 downto 0);
 variable VAR_in2 : unsigned(7 downto 0);
 variable VAR_in3 : unsigned(7 downto 0);
 variable VAR_in4 : unsigned(7 downto 0);
 variable VAR_in5 : unsigned(7 downto 0);
 variable VAR_in6 : unsigned(7 downto 0);
 variable VAR_in7 : unsigned(7 downto 0);
 variable VAR_in8 : unsigned(7 downto 0);
 variable VAR_in9 : unsigned(7 downto 0);
 variable VAR_in10 : unsigned(7 downto 0);
 variable VAR_in11 : unsigned(7 downto 0);
 variable VAR_in12 : unsigned(7 downto 0);
 variable VAR_in13 : unsigned(7 downto 0);
 variable VAR_in14 : unsigned(7 downto 0);
 variable VAR_in15 : unsigned(7 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_b9f2_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_b691_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_sel := sel;
     VAR_in0 := in0;
     VAR_in1 := in1;
     VAR_in2 := in2;
     VAR_in3 := in3;
     VAR_in4 := in4;
     VAR_in5 := in5;
     VAR_in6 := in6;
     VAR_in7 := in7;
     VAR_in8 := in8;
     VAR_in9 := in9;
     VAR_in10 := in10;
     VAR_in11 := in11;
     VAR_in12 := in12;
     VAR_in13 := in13;
     VAR_in14 := in14;
     VAR_in15 := in15;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_b9f2] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_b9f2_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_410e] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_2f77] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_b691] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_b691_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2f77_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_cond := VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond := VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_cond := VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond := VAR_uint4_1_1_bit_math_h_l108_c10_410e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond := VAR_uint4_2_2_bit_math_h_l158_c10_b9f2_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_cond := VAR_uint4_2_2_bit_math_h_l158_c10_b9f2_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond := VAR_uint4_3_3_bit_math_h_l186_c10_b691_return_output;
     -- layer0_node4_MUX[bit_math_h_l62_c3_c9cb] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output := layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_bd69] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output := layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_4226] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_4226_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output := layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_4b94] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output := layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_ec54] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output := layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_ce5a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_42f9] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output := layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_867a] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_867a_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output := layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_867a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_4226_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_4b94_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd69_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_c9cb_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_ce5a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_ec54_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_42f9_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_365f] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_365f_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output := layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_8b41] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output := layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_ecf1] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output := layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_0158] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_0158_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output := layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_0158_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_ecf1_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_365f_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_8b41_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_4470] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_4470_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output := layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_abc4] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output := layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_abc4_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_4470_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_a23b] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output := layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_a23b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
