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
-- layer0_node0_MUX[bit_math_h_l18_c3_12ca]
signal layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d71e]
signal layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_0fb6]
signal layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_b385]
signal layer0_node3_MUX_bit_math_h_l51_c3_b385_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_09dd]
signal layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_2313]
signal layer0_node5_MUX_bit_math_h_l73_c3_2313_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_7edd]
signal layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_0f78]
signal layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_9fb9]
signal layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_5592]
signal layer1_node1_MUX_bit_math_h_l123_c3_5592_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_5efb]
signal layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_cade]
signal layer1_node3_MUX_bit_math_h_l145_c3_cade_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_2c22]
signal layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_96ed]
signal layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_00bf]
signal layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_12ca
layer0_node0_MUX_bit_math_h_l18_c3_12ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond,
layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d71e
layer0_node1_MUX_bit_math_h_l29_c3_d71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_0fb6
layer0_node2_MUX_bit_math_h_l40_c3_0fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond,
layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_b385
layer0_node3_MUX_bit_math_h_l51_c3_b385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_b385_cond,
layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_09dd
layer0_node4_MUX_bit_math_h_l62_c3_09dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond,
layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_2313
layer0_node5_MUX_bit_math_h_l73_c3_2313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_2313_cond,
layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_7edd
layer0_node6_MUX_bit_math_h_l84_c3_7edd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond,
layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_0f78
layer0_node7_MUX_bit_math_h_l95_c3_0f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond,
layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_9fb9
layer1_node0_MUX_bit_math_h_l112_c3_9fb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond,
layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_5592
layer1_node1_MUX_bit_math_h_l123_c3_5592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_5592_cond,
layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_5efb
layer1_node2_MUX_bit_math_h_l134_c3_5efb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond,
layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_cade
layer1_node3_MUX_bit_math_h_l145_c3_cade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_cade_cond,
layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_2c22
layer2_node0_MUX_bit_math_h_l162_c3_2c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond,
layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_96ed
layer2_node1_MUX_bit_math_h_l173_c3_96ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond,
layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_00bf
layer3_node0_MUX_bit_math_h_l190_c3_00bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond,
layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_fd16_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_987e_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_fd16] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_fd16_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_987e] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_987e_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_9e41] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_2ab0] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2ab0_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_cond := VAR_uint4_1_1_bit_math_h_l108_c10_9e41_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond := VAR_uint4_2_2_bit_math_h_l158_c10_fd16_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond := VAR_uint4_2_2_bit_math_h_l158_c10_fd16_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond := VAR_uint4_3_3_bit_math_h_l186_c10_987e_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_2313] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_2313_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output := layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_b385] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_b385_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output := layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d71e] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_09dd] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output := layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_12ca] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output := layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_7edd] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output := layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_0fb6] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output := layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_0f78] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output := layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_12ca_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d71e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_0fb6_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_b385_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_09dd_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_2313_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_7edd_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_0f78_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_cade] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_cade_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output := layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_5592] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_5592_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output := layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_5efb] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output := layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_9fb9] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output := layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_9fb9_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_5592_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_5efb_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_cade_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_96ed] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output := layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_2c22] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output := layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_2c22_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_96ed_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_00bf] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output := layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_00bf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
