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
entity uint16_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(15 downto 0);
 in1 : in unsigned(15 downto 0);
 in2 : in unsigned(15 downto 0);
 in3 : in unsigned(15 downto 0);
 in4 : in unsigned(15 downto 0);
 in5 : in unsigned(15 downto 0);
 in6 : in unsigned(15 downto 0);
 in7 : in unsigned(15 downto 0);
 in8 : in unsigned(15 downto 0);
 in9 : in unsigned(15 downto 0);
 in10 : in unsigned(15 downto 0);
 in11 : in unsigned(15 downto 0);
 in12 : in unsigned(15 downto 0);
 in13 : in unsigned(15 downto 0);
 in14 : in unsigned(15 downto 0);
 in15 : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end uint16_mux16_0CLK_4e6656cf;
architecture arch of uint16_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_d6a7]
signal layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_e3a9]
signal layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_470b]
signal layer0_node2_MUX_bit_math_h_l40_c3_470b_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_4c48]
signal layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_a3e1]
signal layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_547a]
signal layer0_node5_MUX_bit_math_h_l73_c3_547a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_5b0c]
signal layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_585f]
signal layer0_node7_MUX_bit_math_h_l95_c3_585f_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_b256]
signal layer1_node0_MUX_bit_math_h_l112_c3_b256_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_7844]
signal layer1_node1_MUX_bit_math_h_l123_c3_7844_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_3107]
signal layer1_node2_MUX_bit_math_h_l134_c3_3107_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_d0fa]
signal layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_98fe]
signal layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_71d0]
signal layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_9f13]
signal layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_d6a7
layer0_node0_MUX_bit_math_h_l18_c3_d6a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond,
layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_e3a9
layer0_node1_MUX_bit_math_h_l29_c3_e3a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond,
layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_470b
layer0_node2_MUX_bit_math_h_l40_c3_470b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_470b_cond,
layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_4c48
layer0_node3_MUX_bit_math_h_l51_c3_4c48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond,
layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_a3e1
layer0_node4_MUX_bit_math_h_l62_c3_a3e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond,
layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_547a
layer0_node5_MUX_bit_math_h_l73_c3_547a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_547a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_5b0c
layer0_node6_MUX_bit_math_h_l84_c3_5b0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond,
layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_585f
layer0_node7_MUX_bit_math_h_l95_c3_585f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_585f_cond,
layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_b256
layer1_node0_MUX_bit_math_h_l112_c3_b256 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_b256_cond,
layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_7844
layer1_node1_MUX_bit_math_h_l123_c3_7844 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_7844_cond,
layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_3107
layer1_node2_MUX_bit_math_h_l134_c3_3107 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_3107_cond,
layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_d0fa
layer1_node3_MUX_bit_math_h_l145_c3_d0fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond,
layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_98fe
layer2_node0_MUX_bit_math_h_l162_c3_98fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond,
layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_71d0
layer2_node1_MUX_bit_math_h_l173_c3_71d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond,
layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_9f13
layer3_node0_MUX_bit_math_h_l190_c3_9f13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond,
layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(15 downto 0);
 variable VAR_in1 : unsigned(15 downto 0);
 variable VAR_in2 : unsigned(15 downto 0);
 variable VAR_in3 : unsigned(15 downto 0);
 variable VAR_in4 : unsigned(15 downto 0);
 variable VAR_in5 : unsigned(15 downto 0);
 variable VAR_in6 : unsigned(15 downto 0);
 variable VAR_in7 : unsigned(15 downto 0);
 variable VAR_in8 : unsigned(15 downto 0);
 variable VAR_in9 : unsigned(15 downto 0);
 variable VAR_in10 : unsigned(15 downto 0);
 variable VAR_in11 : unsigned(15 downto 0);
 variable VAR_in12 : unsigned(15 downto 0);
 variable VAR_in13 : unsigned(15 downto 0);
 variable VAR_in14 : unsigned(15 downto 0);
 variable VAR_in15 : unsigned(15 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_6e61_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_b442_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_d02f] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_f95a] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_6e61] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_6e61_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_b442] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_b442_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f95a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d02f_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond := VAR_uint4_2_2_bit_math_h_l158_c10_6e61_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond := VAR_uint4_2_2_bit_math_h_l158_c10_6e61_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond := VAR_uint4_3_3_bit_math_h_l186_c10_b442_return_output;
     -- layer0_node3_MUX[bit_math_h_l51_c3_4c48] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output := layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_a3e1] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output := layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_470b] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_470b_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output := layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_547a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_547a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_5b0c] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output := layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_e3a9] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output := layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_585f] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_585f_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output := layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_d6a7] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output := layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_d6a7_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_e3a9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_470b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_4c48_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_a3e1_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_547a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_5b0c_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_585f_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_d0fa] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output := layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_3107] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_3107_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output := layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_b256] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_b256_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output := layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_7844] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_7844_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output := layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_b256_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_7844_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_3107_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_d0fa_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_98fe] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output := layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_71d0] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output := layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_98fe_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_71d0_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_9f13] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output := layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_9f13_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
