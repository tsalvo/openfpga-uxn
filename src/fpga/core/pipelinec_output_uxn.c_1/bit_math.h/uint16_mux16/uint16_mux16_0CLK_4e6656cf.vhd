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
-- -- use ieee.float_pkg.all;
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
-- layer0_node0_MUX[bit_math_h_l18_c3_23b9]
signal layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_9581]
signal layer0_node1_MUX_bit_math_h_l29_c3_9581_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_1bde]
signal layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_787b]
signal layer0_node3_MUX_bit_math_h_l51_c3_787b_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_9574]
signal layer0_node4_MUX_bit_math_h_l62_c3_9574_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_b035]
signal layer0_node5_MUX_bit_math_h_l73_c3_b035_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_d684]
signal layer0_node6_MUX_bit_math_h_l84_c3_d684_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_cb0f]
signal layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_ca9f]
signal layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_8cf4]
signal layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_7461]
signal layer1_node2_MUX_bit_math_h_l134_c3_7461_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_81f2]
signal layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_5824]
signal layer2_node0_MUX_bit_math_h_l162_c3_5824_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_af87]
signal layer2_node1_MUX_bit_math_h_l173_c3_af87_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_8364]
signal layer3_node0_MUX_bit_math_h_l190_c3_8364_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_23b9
layer0_node0_MUX_bit_math_h_l18_c3_23b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond,
layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_9581
layer0_node1_MUX_bit_math_h_l29_c3_9581 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_9581_cond,
layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_1bde
layer0_node2_MUX_bit_math_h_l40_c3_1bde : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond,
layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_787b
layer0_node3_MUX_bit_math_h_l51_c3_787b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_787b_cond,
layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_9574
layer0_node4_MUX_bit_math_h_l62_c3_9574 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_9574_cond,
layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_b035
layer0_node5_MUX_bit_math_h_l73_c3_b035 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_b035_cond,
layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_d684
layer0_node6_MUX_bit_math_h_l84_c3_d684 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_d684_cond,
layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_cb0f
layer0_node7_MUX_bit_math_h_l95_c3_cb0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond,
layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_ca9f
layer1_node0_MUX_bit_math_h_l112_c3_ca9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond,
layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_8cf4
layer1_node1_MUX_bit_math_h_l123_c3_8cf4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond,
layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_7461
layer1_node2_MUX_bit_math_h_l134_c3_7461 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_7461_cond,
layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_81f2
layer1_node3_MUX_bit_math_h_l145_c3_81f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond,
layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_5824
layer2_node0_MUX_bit_math_h_l162_c3_5824 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_5824_cond,
layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_af87
layer2_node1_MUX_bit_math_h_l173_c3_af87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_af87_cond,
layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_8364
layer3_node0_MUX_bit_math_h_l190_c3_8364 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_8364_cond,
layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_909d_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_32c3_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_32c3] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_32c3_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_445d] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_909d] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_909d_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_ec44] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_445d_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ec44_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_cond := VAR_uint4_2_2_bit_math_h_l158_c10_909d_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_cond := VAR_uint4_2_2_bit_math_h_l158_c10_909d_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_cond := VAR_uint4_3_3_bit_math_h_l186_c10_32c3_return_output;
     -- layer0_node6_MUX[bit_math_h_l84_c3_d684] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_d684_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output := layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_9574] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_9574_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output := layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_787b] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_787b_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output := layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_cb0f] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output := layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_1bde] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output := layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_b035] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_b035_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output := layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_23b9] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output := layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_9581] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_9581_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output := layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_23b9_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_9581_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_1bde_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_787b_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_9574_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_b035_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_d684_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_cb0f_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_8cf4] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output := layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_7461] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_7461_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output := layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_81f2] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output := layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_ca9f] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output := layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_ca9f_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_8cf4_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_7461_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_81f2_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_5824] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_5824_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output := layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_af87] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_af87_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output := layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_5824_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_af87_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_8364] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_8364_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output := layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_8364_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
