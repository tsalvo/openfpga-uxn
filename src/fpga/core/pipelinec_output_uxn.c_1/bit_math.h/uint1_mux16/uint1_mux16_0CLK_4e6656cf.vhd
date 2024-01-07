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
entity uint1_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(0 downto 0);
 in1 : in unsigned(0 downto 0);
 in2 : in unsigned(0 downto 0);
 in3 : in unsigned(0 downto 0);
 in4 : in unsigned(0 downto 0);
 in5 : in unsigned(0 downto 0);
 in6 : in unsigned(0 downto 0);
 in7 : in unsigned(0 downto 0);
 in8 : in unsigned(0 downto 0);
 in9 : in unsigned(0 downto 0);
 in10 : in unsigned(0 downto 0);
 in11 : in unsigned(0 downto 0);
 in12 : in unsigned(0 downto 0);
 in13 : in unsigned(0 downto 0);
 in14 : in unsigned(0 downto 0);
 in15 : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end uint1_mux16_0CLK_4e6656cf;
architecture arch of uint1_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_39e2]
signal layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_b83c]
signal layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_62de]
signal layer0_node2_MUX_bit_math_h_l40_c3_62de_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_0496]
signal layer0_node3_MUX_bit_math_h_l51_c3_0496_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_1860]
signal layer0_node4_MUX_bit_math_h_l62_c3_1860_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_9322]
signal layer0_node5_MUX_bit_math_h_l73_c3_9322_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_e053]
signal layer0_node6_MUX_bit_math_h_l84_c3_e053_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_2ea0]
signal layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_68f9]
signal layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_8dd1]
signal layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_2ce3]
signal layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_c061]
signal layer1_node3_MUX_bit_math_h_l145_c3_c061_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_3824]
signal layer2_node0_MUX_bit_math_h_l162_c3_3824_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_9d44]
signal layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_098a]
signal layer3_node0_MUX_bit_math_h_l190_c3_098a_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_39e2
layer0_node0_MUX_bit_math_h_l18_c3_39e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond,
layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_b83c
layer0_node1_MUX_bit_math_h_l29_c3_b83c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond,
layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_62de
layer0_node2_MUX_bit_math_h_l40_c3_62de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_62de_cond,
layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_0496
layer0_node3_MUX_bit_math_h_l51_c3_0496 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_0496_cond,
layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_1860
layer0_node4_MUX_bit_math_h_l62_c3_1860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_1860_cond,
layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_9322
layer0_node5_MUX_bit_math_h_l73_c3_9322 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_9322_cond,
layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_e053
layer0_node6_MUX_bit_math_h_l84_c3_e053 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_e053_cond,
layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_2ea0
layer0_node7_MUX_bit_math_h_l95_c3_2ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond,
layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_68f9
layer1_node0_MUX_bit_math_h_l112_c3_68f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond,
layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_8dd1
layer1_node1_MUX_bit_math_h_l123_c3_8dd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond,
layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_2ce3
layer1_node2_MUX_bit_math_h_l134_c3_2ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond,
layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_c061
layer1_node3_MUX_bit_math_h_l145_c3_c061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_c061_cond,
layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_3824
layer2_node0_MUX_bit_math_h_l162_c3_3824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_3824_cond,
layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_9d44
layer2_node1_MUX_bit_math_h_l173_c3_9d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond,
layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_098a
layer3_node0_MUX_bit_math_h_l190_c3_098a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_098a_cond,
layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(0 downto 0);
 variable VAR_in1 : unsigned(0 downto 0);
 variable VAR_in2 : unsigned(0 downto 0);
 variable VAR_in3 : unsigned(0 downto 0);
 variable VAR_in4 : unsigned(0 downto 0);
 variable VAR_in5 : unsigned(0 downto 0);
 variable VAR_in6 : unsigned(0 downto 0);
 variable VAR_in7 : unsigned(0 downto 0);
 variable VAR_in8 : unsigned(0 downto 0);
 variable VAR_in9 : unsigned(0 downto 0);
 variable VAR_in10 : unsigned(0 downto 0);
 variable VAR_in11 : unsigned(0 downto 0);
 variable VAR_in12 : unsigned(0 downto 0);
 variable VAR_in13 : unsigned(0 downto 0);
 variable VAR_in14 : unsigned(0 downto 0);
 variable VAR_in15 : unsigned(0 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_ec83_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_b811_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_9587] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_ec83] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_ec83_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_b811] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_b811_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_7b47] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_9587_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond := VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond := VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_cond := VAR_uint4_1_1_bit_math_h_l108_c10_7b47_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_cond := VAR_uint4_2_2_bit_math_h_l158_c10_ec83_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond := VAR_uint4_2_2_bit_math_h_l158_c10_ec83_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_cond := VAR_uint4_3_3_bit_math_h_l186_c10_b811_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_e053] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_e053_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output := layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_9322] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_9322_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output := layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_62de] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_62de_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output := layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_2ea0] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output := layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_1860] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_1860_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output := layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_0496] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_0496_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output := layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_b83c] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output := layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_39e2] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output := layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_39e2_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_b83c_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_62de_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_0496_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_1860_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_9322_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_e053_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_2ea0_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_c061] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_c061_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output := layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_68f9] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output := layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_2ce3] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output := layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_8dd1] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output := layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_68f9_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_8dd1_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_2ce3_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_c061_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_9d44] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output := layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_3824] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_3824_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output := layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_3824_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_9d44_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_098a] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_098a_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output := layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_098a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
