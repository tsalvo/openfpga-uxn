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
-- layer0_node0_MUX[bit_math_h_l18_c3_26c0]
signal layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_c973]
signal layer0_node1_MUX_bit_math_h_l29_c3_c973_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_028c]
signal layer0_node2_MUX_bit_math_h_l40_c3_028c_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_d0b7]
signal layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_6015]
signal layer0_node4_MUX_bit_math_h_l62_c3_6015_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_762b]
signal layer0_node5_MUX_bit_math_h_l73_c3_762b_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_ad0b]
signal layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_fe27]
signal layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_e143]
signal layer1_node0_MUX_bit_math_h_l112_c3_e143_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_1305]
signal layer1_node1_MUX_bit_math_h_l123_c3_1305_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_25c9]
signal layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_bac6]
signal layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_832f]
signal layer2_node0_MUX_bit_math_h_l162_c3_832f_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_2145]
signal layer2_node1_MUX_bit_math_h_l173_c3_2145_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_7482]
signal layer3_node0_MUX_bit_math_h_l190_c3_7482_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_26c0
layer0_node0_MUX_bit_math_h_l18_c3_26c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond,
layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_c973
layer0_node1_MUX_bit_math_h_l29_c3_c973 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_c973_cond,
layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_028c
layer0_node2_MUX_bit_math_h_l40_c3_028c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_028c_cond,
layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_d0b7
layer0_node3_MUX_bit_math_h_l51_c3_d0b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond,
layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_6015
layer0_node4_MUX_bit_math_h_l62_c3_6015 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_6015_cond,
layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_762b
layer0_node5_MUX_bit_math_h_l73_c3_762b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_762b_cond,
layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_ad0b
layer0_node6_MUX_bit_math_h_l84_c3_ad0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond,
layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_fe27
layer0_node7_MUX_bit_math_h_l95_c3_fe27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond,
layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_e143
layer1_node0_MUX_bit_math_h_l112_c3_e143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_e143_cond,
layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_1305
layer1_node1_MUX_bit_math_h_l123_c3_1305 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_1305_cond,
layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_25c9
layer1_node2_MUX_bit_math_h_l134_c3_25c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond,
layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_bac6
layer1_node3_MUX_bit_math_h_l145_c3_bac6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond,
layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_832f
layer2_node0_MUX_bit_math_h_l162_c3_832f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_832f_cond,
layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_2145
layer2_node1_MUX_bit_math_h_l173_c3_2145 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_2145_cond,
layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_7482
layer3_node0_MUX_bit_math_h_l190_c3_7482 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_7482_cond,
layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_5a7c_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_84c8_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_cb86] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_715d] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_5a7c] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_5a7c_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_84c8] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_84c8_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond := VAR_uint4_0_0_bit_math_h_l14_c10_715d_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_cond := VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_cond := VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond := VAR_uint4_1_1_bit_math_h_l108_c10_cb86_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_cond := VAR_uint4_2_2_bit_math_h_l158_c10_5a7c_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_cond := VAR_uint4_2_2_bit_math_h_l158_c10_5a7c_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_cond := VAR_uint4_3_3_bit_math_h_l186_c10_84c8_return_output;
     -- layer0_node7_MUX[bit_math_h_l95_c3_fe27] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output := layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_6015] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_6015_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output := layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_ad0b] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output := layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_d0b7] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output := layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_762b] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_762b_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output := layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_028c] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_028c_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output := layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_26c0] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output := layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_c973] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_c973_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output := layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_26c0_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_c973_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_028c_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_d0b7_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_6015_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_762b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_ad0b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_fe27_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_25c9] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output := layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_1305] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_1305_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output := layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_e143] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_e143_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output := layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_bac6] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output := layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_e143_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_1305_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_25c9_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_bac6_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_2145] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_2145_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output := layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_832f] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_832f_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output := layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_832f_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_2145_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_7482] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_7482_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output := layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_7482_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
