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
-- layer0_node0_MUX[bit_math_h_l18_c3_d432]
signal layer0_node0_MUX_bit_math_h_l18_c3_d432_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_9c03]
signal layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_112b]
signal layer0_node2_MUX_bit_math_h_l40_c3_112b_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_bffb]
signal layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_5fa3]
signal layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_28cb]
signal layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_6c14]
signal layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_c376]
signal layer0_node7_MUX_bit_math_h_l95_c3_c376_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_201c]
signal layer1_node0_MUX_bit_math_h_l112_c3_201c_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_9939]
signal layer1_node1_MUX_bit_math_h_l123_c3_9939_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_a2b9]
signal layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_1652]
signal layer1_node3_MUX_bit_math_h_l145_c3_1652_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_c59a]
signal layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_8121]
signal layer2_node1_MUX_bit_math_h_l173_c3_8121_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_1640]
signal layer3_node0_MUX_bit_math_h_l190_c3_1640_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_d432
layer0_node0_MUX_bit_math_h_l18_c3_d432 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_d432_cond,
layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_9c03
layer0_node1_MUX_bit_math_h_l29_c3_9c03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond,
layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_112b
layer0_node2_MUX_bit_math_h_l40_c3_112b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_112b_cond,
layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_bffb
layer0_node3_MUX_bit_math_h_l51_c3_bffb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond,
layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_5fa3
layer0_node4_MUX_bit_math_h_l62_c3_5fa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond,
layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_28cb
layer0_node5_MUX_bit_math_h_l73_c3_28cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond,
layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_6c14
layer0_node6_MUX_bit_math_h_l84_c3_6c14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond,
layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_c376
layer0_node7_MUX_bit_math_h_l95_c3_c376 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_c376_cond,
layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_201c
layer1_node0_MUX_bit_math_h_l112_c3_201c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_201c_cond,
layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_9939
layer1_node1_MUX_bit_math_h_l123_c3_9939 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_9939_cond,
layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_a2b9
layer1_node2_MUX_bit_math_h_l134_c3_a2b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond,
layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_1652
layer1_node3_MUX_bit_math_h_l145_c3_1652 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_1652_cond,
layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_c59a
layer2_node0_MUX_bit_math_h_l162_c3_c59a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond,
layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_8121
layer2_node1_MUX_bit_math_h_l173_c3_8121 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_8121_cond,
layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_1640
layer3_node0_MUX_bit_math_h_l190_c3_1640 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_1640_cond,
layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_5f07_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_53a5_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_53a5] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_53a5_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_5f07] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_5f07_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_d69f] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_738e] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_cond := VAR_uint4_0_0_bit_math_h_l14_c10_738e_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d69f_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond := VAR_uint4_2_2_bit_math_h_l158_c10_5f07_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_cond := VAR_uint4_2_2_bit_math_h_l158_c10_5f07_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_cond := VAR_uint4_3_3_bit_math_h_l186_c10_53a5_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_28cb] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output := layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_5fa3] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output := layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_d432] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_d432_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output := layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_6c14] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output := layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_c376] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_c376_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output := layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_112b] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_112b_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output := layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_bffb] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output := layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_9c03] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output := layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_d432_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_9c03_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_112b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_bffb_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_5fa3_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_28cb_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_6c14_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_c376_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_a2b9] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output := layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_1652] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_1652_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output := layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_201c] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_201c_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output := layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_9939] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_9939_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output := layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_201c_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_9939_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_a2b9_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_1652_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_8121] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_8121_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output := layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_c59a] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output := layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_c59a_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_8121_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_1640] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_1640_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output := layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_1640_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
