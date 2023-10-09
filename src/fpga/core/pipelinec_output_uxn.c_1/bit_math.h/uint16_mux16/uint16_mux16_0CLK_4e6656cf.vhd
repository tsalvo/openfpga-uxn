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
-- layer0_node0_MUX[bit_math_h_l18_c3_878e]
signal layer0_node0_MUX_bit_math_h_l18_c3_878e_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_10d0]
signal layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_4e04]
signal layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_b74d]
signal layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_379f]
signal layer0_node4_MUX_bit_math_h_l62_c3_379f_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_060f]
signal layer0_node5_MUX_bit_math_h_l73_c3_060f_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_8c03]
signal layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_7268]
signal layer0_node7_MUX_bit_math_h_l95_c3_7268_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_d27c]
signal layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_aa5a]
signal layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_51ab]
signal layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_4e00]
signal layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_759c]
signal layer2_node0_MUX_bit_math_h_l162_c3_759c_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_ba01]
signal layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_1d31]
signal layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_878e
layer0_node0_MUX_bit_math_h_l18_c3_878e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_878e_cond,
layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_10d0
layer0_node1_MUX_bit_math_h_l29_c3_10d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond,
layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_4e04
layer0_node2_MUX_bit_math_h_l40_c3_4e04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond,
layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_b74d
layer0_node3_MUX_bit_math_h_l51_c3_b74d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond,
layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_379f
layer0_node4_MUX_bit_math_h_l62_c3_379f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_379f_cond,
layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_060f
layer0_node5_MUX_bit_math_h_l73_c3_060f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_060f_cond,
layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_8c03
layer0_node6_MUX_bit_math_h_l84_c3_8c03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond,
layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_7268
layer0_node7_MUX_bit_math_h_l95_c3_7268 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_7268_cond,
layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_d27c
layer1_node0_MUX_bit_math_h_l112_c3_d27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond,
layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_aa5a
layer1_node1_MUX_bit_math_h_l123_c3_aa5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond,
layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_51ab
layer1_node2_MUX_bit_math_h_l134_c3_51ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond,
layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_4e00
layer1_node3_MUX_bit_math_h_l145_c3_4e00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond,
layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_759c
layer2_node0_MUX_bit_math_h_l162_c3_759c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_759c_cond,
layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_ba01
layer2_node1_MUX_bit_math_h_l173_c3_ba01 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond,
layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_1d31
layer3_node0_MUX_bit_math_h_l190_c3_1d31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond,
layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_3582_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_99d7_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_3582] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_3582_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_99d7] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_99d7_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_f1cc] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_f5aa] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5aa_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond := VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond := VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond := VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond := VAR_uint4_1_1_bit_math_h_l108_c10_f1cc_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_cond := VAR_uint4_2_2_bit_math_h_l158_c10_3582_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond := VAR_uint4_2_2_bit_math_h_l158_c10_3582_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond := VAR_uint4_3_3_bit_math_h_l186_c10_99d7_return_output;
     -- layer0_node0_MUX[bit_math_h_l18_c3_878e] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_878e_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output := layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_b74d] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output := layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_7268] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_7268_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output := layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_060f] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_060f_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output := layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_4e04] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output := layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_8c03] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output := layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_379f] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_379f_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output := layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_10d0] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output := layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_878e_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_10d0_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_4e04_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_b74d_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_379f_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_060f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_8c03_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_7268_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_51ab] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output := layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_d27c] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output := layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_aa5a] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output := layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_4e00] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output := layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_d27c_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_aa5a_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_51ab_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_4e00_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_ba01] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output := layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_759c] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_759c_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output := layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_759c_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_ba01_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_1d31] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output := layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_1d31_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
