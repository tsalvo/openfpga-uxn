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
-- layer0_node0_MUX[bit_math_h_l18_c3_9e10]
signal layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_04db]
signal layer0_node1_MUX_bit_math_h_l29_c3_04db_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_9b40]
signal layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_44ab]
signal layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_3de6]
signal layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_7aff]
signal layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_5d99]
signal layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_b534]
signal layer0_node7_MUX_bit_math_h_l95_c3_b534_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_0824]
signal layer1_node0_MUX_bit_math_h_l112_c3_0824_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_867a]
signal layer1_node1_MUX_bit_math_h_l123_c3_867a_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_3343]
signal layer1_node2_MUX_bit_math_h_l134_c3_3343_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_0967]
signal layer1_node3_MUX_bit_math_h_l145_c3_0967_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_ad2c]
signal layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_1a35]
signal layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_0139]
signal layer3_node0_MUX_bit_math_h_l190_c3_0139_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_9e10
layer0_node0_MUX_bit_math_h_l18_c3_9e10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond,
layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_04db
layer0_node1_MUX_bit_math_h_l29_c3_04db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_04db_cond,
layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_9b40
layer0_node2_MUX_bit_math_h_l40_c3_9b40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond,
layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_44ab
layer0_node3_MUX_bit_math_h_l51_c3_44ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond,
layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_3de6
layer0_node4_MUX_bit_math_h_l62_c3_3de6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond,
layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_7aff
layer0_node5_MUX_bit_math_h_l73_c3_7aff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond,
layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_5d99
layer0_node6_MUX_bit_math_h_l84_c3_5d99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond,
layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_b534
layer0_node7_MUX_bit_math_h_l95_c3_b534 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_b534_cond,
layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_0824
layer1_node0_MUX_bit_math_h_l112_c3_0824 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_0824_cond,
layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_867a
layer1_node1_MUX_bit_math_h_l123_c3_867a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_867a_cond,
layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_3343
layer1_node2_MUX_bit_math_h_l134_c3_3343 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_3343_cond,
layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_0967
layer1_node3_MUX_bit_math_h_l145_c3_0967 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_0967_cond,
layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_ad2c
layer2_node0_MUX_bit_math_h_l162_c3_ad2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond,
layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_1a35
layer2_node1_MUX_bit_math_h_l173_c3_1a35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond,
layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_0139
layer3_node0_MUX_bit_math_h_l190_c3_0139 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_0139_cond,
layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_3204_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_077d_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_8a27] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_077d] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_077d_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_3204] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_3204_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_3377] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_cond := VAR_uint4_0_0_bit_math_h_l14_c10_8a27_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_cond := VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_cond := VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_cond := VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_cond := VAR_uint4_1_1_bit_math_h_l108_c10_3377_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond := VAR_uint4_2_2_bit_math_h_l158_c10_3204_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond := VAR_uint4_2_2_bit_math_h_l158_c10_3204_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_cond := VAR_uint4_3_3_bit_math_h_l186_c10_077d_return_output;
     -- layer0_node7_MUX[bit_math_h_l95_c3_b534] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_b534_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output := layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_7aff] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output := layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_3de6] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output := layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_9b40] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output := layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_9e10] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output := layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_5d99] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output := layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_04db] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_04db_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output := layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_44ab] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output := layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_9e10_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_04db_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_9b40_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_44ab_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_3de6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_7aff_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_5d99_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_b534_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_0967] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_0967_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output := layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_0824] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_0824_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output := layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_867a] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_867a_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output := layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_3343] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_3343_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output := layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_0824_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_867a_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_3343_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_0967_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_1a35] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output := layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_ad2c] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output := layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_ad2c_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_1a35_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_0139] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_0139_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output := layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_0139_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
