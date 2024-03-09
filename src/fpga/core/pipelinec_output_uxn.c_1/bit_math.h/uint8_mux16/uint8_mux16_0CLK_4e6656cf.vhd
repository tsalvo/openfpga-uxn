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
-- layer0_node0_MUX[bit_math_h_l18_c3_8b3d]
signal layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_f559]
signal layer0_node1_MUX_bit_math_h_l29_c3_f559_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_8796]
signal layer0_node2_MUX_bit_math_h_l40_c3_8796_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_7172]
signal layer0_node3_MUX_bit_math_h_l51_c3_7172_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_dcc6]
signal layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_9e6e]
signal layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_cce6]
signal layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_c444]
signal layer0_node7_MUX_bit_math_h_l95_c3_c444_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_e0f5]
signal layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_adc8]
signal layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_66ba]
signal layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_d6ac]
signal layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_9a23]
signal layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_5f62]
signal layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_f5b0]
signal layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_8b3d
layer0_node0_MUX_bit_math_h_l18_c3_8b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond,
layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_f559
layer0_node1_MUX_bit_math_h_l29_c3_f559 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_f559_cond,
layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_8796
layer0_node2_MUX_bit_math_h_l40_c3_8796 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_8796_cond,
layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_7172
layer0_node3_MUX_bit_math_h_l51_c3_7172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_7172_cond,
layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_dcc6
layer0_node4_MUX_bit_math_h_l62_c3_dcc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond,
layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_9e6e
layer0_node5_MUX_bit_math_h_l73_c3_9e6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond,
layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_cce6
layer0_node6_MUX_bit_math_h_l84_c3_cce6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond,
layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_c444
layer0_node7_MUX_bit_math_h_l95_c3_c444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_c444_cond,
layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_e0f5
layer1_node0_MUX_bit_math_h_l112_c3_e0f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond,
layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_adc8
layer1_node1_MUX_bit_math_h_l123_c3_adc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond,
layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_66ba
layer1_node2_MUX_bit_math_h_l134_c3_66ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond,
layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_d6ac
layer1_node3_MUX_bit_math_h_l145_c3_d6ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond,
layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_9a23
layer2_node0_MUX_bit_math_h_l162_c3_9a23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond,
layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_5f62
layer2_node1_MUX_bit_math_h_l173_c3_5f62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond,
layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_f5b0
layer3_node0_MUX_bit_math_h_l190_c3_f5b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond,
layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_2a59_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_ad8f_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_edfc] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_afa7] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_ad8f] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_ad8f_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_2a59] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_2a59_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_cond := VAR_uint4_0_0_bit_math_h_l14_c10_afa7_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond := VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond := VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond := VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond := VAR_uint4_1_1_bit_math_h_l108_c10_edfc_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond := VAR_uint4_2_2_bit_math_h_l158_c10_2a59_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond := VAR_uint4_2_2_bit_math_h_l158_c10_2a59_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond := VAR_uint4_3_3_bit_math_h_l186_c10_ad8f_return_output;
     -- layer0_node7_MUX[bit_math_h_l95_c3_c444] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_c444_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output := layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_7172] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_7172_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output := layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_8b3d] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output := layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_8796] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_8796_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output := layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_f559] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_f559_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output := layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_cce6] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output := layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_9e6e] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output := layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_dcc6] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output := layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_8b3d_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_f559_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_8796_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_7172_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcc6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e6e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_cce6_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_c444_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_d6ac] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output := layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_adc8] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output := layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_e0f5] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output := layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_66ba] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output := layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_e0f5_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_adc8_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_66ba_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_d6ac_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_5f62] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output := layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_9a23] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output := layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_9a23_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_5f62_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_f5b0] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output := layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_f5b0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
