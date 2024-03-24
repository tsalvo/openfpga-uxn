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
-- layer0_node0_MUX[bit_math_h_l18_c3_8565]
signal layer0_node0_MUX_bit_math_h_l18_c3_8565_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_8483]
signal layer0_node1_MUX_bit_math_h_l29_c3_8483_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_585b]
signal layer0_node2_MUX_bit_math_h_l40_c3_585b_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_ec13]
signal layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_0975]
signal layer0_node4_MUX_bit_math_h_l62_c3_0975_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_1576]
signal layer0_node5_MUX_bit_math_h_l73_c3_1576_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_309a]
signal layer0_node6_MUX_bit_math_h_l84_c3_309a_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_16c0]
signal layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_3eb2]
signal layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_0a3b]
signal layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_8d67]
signal layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_072e]
signal layer1_node3_MUX_bit_math_h_l145_c3_072e_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_7e33]
signal layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_243b]
signal layer2_node1_MUX_bit_math_h_l173_c3_243b_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_0969]
signal layer3_node0_MUX_bit_math_h_l190_c3_0969_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_8565
layer0_node0_MUX_bit_math_h_l18_c3_8565 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_8565_cond,
layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_8483
layer0_node1_MUX_bit_math_h_l29_c3_8483 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_8483_cond,
layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_585b
layer0_node2_MUX_bit_math_h_l40_c3_585b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_585b_cond,
layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_ec13
layer0_node3_MUX_bit_math_h_l51_c3_ec13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond,
layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_0975
layer0_node4_MUX_bit_math_h_l62_c3_0975 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_0975_cond,
layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_1576
layer0_node5_MUX_bit_math_h_l73_c3_1576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_1576_cond,
layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_309a
layer0_node6_MUX_bit_math_h_l84_c3_309a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_309a_cond,
layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_16c0
layer0_node7_MUX_bit_math_h_l95_c3_16c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond,
layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_3eb2
layer1_node0_MUX_bit_math_h_l112_c3_3eb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond,
layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_0a3b
layer1_node1_MUX_bit_math_h_l123_c3_0a3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond,
layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_8d67
layer1_node2_MUX_bit_math_h_l134_c3_8d67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond,
layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_072e
layer1_node3_MUX_bit_math_h_l145_c3_072e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_072e_cond,
layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_7e33
layer2_node0_MUX_bit_math_h_l162_c3_7e33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond,
layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_243b
layer2_node1_MUX_bit_math_h_l173_c3_243b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_243b_cond,
layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_0969
layer3_node0_MUX_bit_math_h_l190_c3_0969 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_0969_cond,
layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_cd02_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_6ef4_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_cd02] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_cd02_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_6ef4] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_6ef4_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_2c05] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_b060] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b060_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond := VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond := VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_2c05_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond := VAR_uint4_2_2_bit_math_h_l158_c10_cd02_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_cond := VAR_uint4_2_2_bit_math_h_l158_c10_cd02_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_cond := VAR_uint4_3_3_bit_math_h_l186_c10_6ef4_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_309a] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_309a_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output := layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_ec13] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output := layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_1576] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_1576_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output := layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_8565] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_8565_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output := layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_8483] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_8483_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output := layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_16c0] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output := layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_585b] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_585b_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output := layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_0975] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_0975_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output := layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_8565_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_8483_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_585b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_ec13_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_0975_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_1576_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_309a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_16c0_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_072e] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_072e_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output := layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_0a3b] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output := layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_3eb2] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output := layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_8d67] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output := layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_3eb2_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_0a3b_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_8d67_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_072e_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_7e33] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output := layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_243b] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_243b_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output := layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_7e33_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_243b_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_0969] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_0969_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output := layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_0969_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
