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
-- layer0_node0_MUX[bit_math_h_l18_c3_b0dd]
signal layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d3d9]
signal layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_e304]
signal layer0_node2_MUX_bit_math_h_l40_c3_e304_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_b872]
signal layer0_node3_MUX_bit_math_h_l51_c3_b872_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_9f54]
signal layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_3c0d]
signal layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_4f4f]
signal layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_8ae8]
signal layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_3a49]
signal layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_95ae]
signal layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_62db]
signal layer1_node2_MUX_bit_math_h_l134_c3_62db_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_4388]
signal layer1_node3_MUX_bit_math_h_l145_c3_4388_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_be5b]
signal layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_2542]
signal layer2_node1_MUX_bit_math_h_l173_c3_2542_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_df22]
signal layer3_node0_MUX_bit_math_h_l190_c3_df22_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_b0dd
layer0_node0_MUX_bit_math_h_l18_c3_b0dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond,
layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d3d9
layer0_node1_MUX_bit_math_h_l29_c3_d3d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_e304
layer0_node2_MUX_bit_math_h_l40_c3_e304 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_e304_cond,
layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_b872
layer0_node3_MUX_bit_math_h_l51_c3_b872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_b872_cond,
layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_9f54
layer0_node4_MUX_bit_math_h_l62_c3_9f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond,
layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_3c0d
layer0_node5_MUX_bit_math_h_l73_c3_3c0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond,
layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_4f4f
layer0_node6_MUX_bit_math_h_l84_c3_4f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond,
layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_8ae8
layer0_node7_MUX_bit_math_h_l95_c3_8ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond,
layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_3a49
layer1_node0_MUX_bit_math_h_l112_c3_3a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond,
layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_95ae
layer1_node1_MUX_bit_math_h_l123_c3_95ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond,
layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_62db
layer1_node2_MUX_bit_math_h_l134_c3_62db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_62db_cond,
layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_4388
layer1_node3_MUX_bit_math_h_l145_c3_4388 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_4388_cond,
layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_be5b
layer2_node0_MUX_bit_math_h_l162_c3_be5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond,
layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_2542
layer2_node1_MUX_bit_math_h_l173_c3_2542 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_2542_cond,
layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_df22
layer3_node0_MUX_bit_math_h_l190_c3_df22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_df22_cond,
layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_2015_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_4c23_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_064e] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_b857] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_2015] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_2015_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_4c23] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_4c23_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b857_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond := VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond := VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_cond := VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_cond := VAR_uint4_1_1_bit_math_h_l108_c10_064e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond := VAR_uint4_2_2_bit_math_h_l158_c10_2015_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_cond := VAR_uint4_2_2_bit_math_h_l158_c10_2015_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_cond := VAR_uint4_3_3_bit_math_h_l186_c10_4c23_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_4f4f] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output := layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_b0dd] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output := layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_e304] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_e304_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output := layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_b872] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_b872_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output := layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d3d9] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_3c0d] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output := layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_9f54] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output := layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_8ae8] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output := layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_b0dd_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d3d9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_e304_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_b872_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_9f54_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_3c0d_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_4f4f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_8ae8_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_4388] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_4388_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output := layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_3a49] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output := layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_95ae] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output := layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_62db] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_62db_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output := layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_3a49_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_95ae_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_62db_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_4388_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_2542] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_2542_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output := layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_be5b] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output := layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_be5b_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_2542_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_df22] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_df22_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output := layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_df22_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
