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
-- layer0_node0_MUX[bit_math_h_l18_c3_fcbd]
signal layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_0e38]
signal layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_109c]
signal layer0_node2_MUX_bit_math_h_l40_c3_109c_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_38f5]
signal layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_e8a7]
signal layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_41fb]
signal layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_aecf]
signal layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_8fe9]
signal layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_8468]
signal layer1_node0_MUX_bit_math_h_l112_c3_8468_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_4359]
signal layer1_node1_MUX_bit_math_h_l123_c3_4359_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_67d6]
signal layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_2901]
signal layer1_node3_MUX_bit_math_h_l145_c3_2901_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_24e9]
signal layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_b2a9]
signal layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_4325]
signal layer3_node0_MUX_bit_math_h_l190_c3_4325_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_fcbd
layer0_node0_MUX_bit_math_h_l18_c3_fcbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond,
layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_0e38
layer0_node1_MUX_bit_math_h_l29_c3_0e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond,
layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_109c
layer0_node2_MUX_bit_math_h_l40_c3_109c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_109c_cond,
layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_38f5
layer0_node3_MUX_bit_math_h_l51_c3_38f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond,
layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_e8a7
layer0_node4_MUX_bit_math_h_l62_c3_e8a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond,
layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_41fb
layer0_node5_MUX_bit_math_h_l73_c3_41fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond,
layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_aecf
layer0_node6_MUX_bit_math_h_l84_c3_aecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond,
layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_8fe9
layer0_node7_MUX_bit_math_h_l95_c3_8fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond,
layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_8468
layer1_node0_MUX_bit_math_h_l112_c3_8468 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_8468_cond,
layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_4359
layer1_node1_MUX_bit_math_h_l123_c3_4359 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_4359_cond,
layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_67d6
layer1_node2_MUX_bit_math_h_l134_c3_67d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond,
layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_2901
layer1_node3_MUX_bit_math_h_l145_c3_2901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_2901_cond,
layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_24e9
layer2_node0_MUX_bit_math_h_l162_c3_24e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond,
layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_b2a9
layer2_node1_MUX_bit_math_h_l173_c3_b2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond,
layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_4325
layer3_node0_MUX_bit_math_h_l190_c3_4325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_4325_cond,
layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_f945_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_8abe_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_8abe] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_8abe_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_104f] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_01e7] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_f945] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_f945_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_01e7_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_cond := VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_cond := VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond := VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_cond := VAR_uint4_1_1_bit_math_h_l108_c10_104f_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond := VAR_uint4_2_2_bit_math_h_l158_c10_f945_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond := VAR_uint4_2_2_bit_math_h_l158_c10_f945_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_cond := VAR_uint4_3_3_bit_math_h_l186_c10_8abe_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_aecf] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output := layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_41fb] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output := layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_8fe9] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output := layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_e8a7] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output := layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_109c] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_109c_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output := layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_fcbd] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output := layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_0e38] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output := layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_38f5] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output := layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_fcbd_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_0e38_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_109c_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_38f5_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_e8a7_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_41fb_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_aecf_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_8fe9_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_67d6] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output := layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_8468] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_8468_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output := layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_4359] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_4359_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output := layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_2901] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_2901_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output := layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_8468_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_4359_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_67d6_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_2901_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_b2a9] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output := layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_24e9] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output := layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_24e9_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_b2a9_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_4325] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_4325_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output := layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_4325_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
