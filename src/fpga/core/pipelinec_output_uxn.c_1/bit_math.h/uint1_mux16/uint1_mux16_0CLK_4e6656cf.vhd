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
-- layer0_node0_MUX[bit_math_h_l18_c3_4d80]
signal layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_b5e5]
signal layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_c6cc]
signal layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_7b36]
signal layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_0d69]
signal layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_b8a8]
signal layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_ba26]
signal layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_ad8d]
signal layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_0f12]
signal layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_272c]
signal layer1_node1_MUX_bit_math_h_l123_c3_272c_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_b9f4]
signal layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_ebe4]
signal layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_7ad8]
signal layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_e252]
signal layer2_node1_MUX_bit_math_h_l173_c3_e252_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_413f]
signal layer3_node0_MUX_bit_math_h_l190_c3_413f_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_4d80
layer0_node0_MUX_bit_math_h_l18_c3_4d80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond,
layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_b5e5
layer0_node1_MUX_bit_math_h_l29_c3_b5e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond,
layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_c6cc
layer0_node2_MUX_bit_math_h_l40_c3_c6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond,
layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_7b36
layer0_node3_MUX_bit_math_h_l51_c3_7b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond,
layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_0d69
layer0_node4_MUX_bit_math_h_l62_c3_0d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond,
layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_b8a8
layer0_node5_MUX_bit_math_h_l73_c3_b8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond,
layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_ba26
layer0_node6_MUX_bit_math_h_l84_c3_ba26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond,
layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_ad8d
layer0_node7_MUX_bit_math_h_l95_c3_ad8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond,
layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_0f12
layer1_node0_MUX_bit_math_h_l112_c3_0f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond,
layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_272c
layer1_node1_MUX_bit_math_h_l123_c3_272c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_272c_cond,
layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_b9f4
layer1_node2_MUX_bit_math_h_l134_c3_b9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond,
layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_ebe4
layer1_node3_MUX_bit_math_h_l145_c3_ebe4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond,
layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_7ad8
layer2_node0_MUX_bit_math_h_l162_c3_7ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond,
layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_e252
layer2_node1_MUX_bit_math_h_l173_c3_e252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_e252_cond,
layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_413f
layer3_node0_MUX_bit_math_h_l190_c3_413f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_413f_cond,
layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_88d3_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_dc1d_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_6aad] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_dc1d] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_dc1d_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_88d3] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_88d3_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_27d9] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_6aad_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond := VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_cond := VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_27d9_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond := VAR_uint4_2_2_bit_math_h_l158_c10_88d3_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_cond := VAR_uint4_2_2_bit_math_h_l158_c10_88d3_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_cond := VAR_uint4_3_3_bit_math_h_l186_c10_dc1d_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_c6cc] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output := layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_b5e5] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output := layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_ad8d] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output := layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_b8a8] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output := layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_ba26] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output := layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_7b36] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output := layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_0d69] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output := layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_4d80] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output := layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_4d80_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_b5e5_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_c6cc_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_7b36_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_0d69_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_b8a8_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_ba26_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_ad8d_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_ebe4] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output := layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_0f12] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output := layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_b9f4] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output := layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_272c] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_272c_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output := layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_0f12_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_272c_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_b9f4_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_ebe4_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_e252] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_e252_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output := layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_7ad8] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output := layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_7ad8_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_e252_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_413f] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_413f_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output := layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_413f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
