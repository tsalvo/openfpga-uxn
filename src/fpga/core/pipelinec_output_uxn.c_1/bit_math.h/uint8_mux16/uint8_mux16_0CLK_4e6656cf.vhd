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
-- layer0_node0_MUX[bit_math_h_l18_c3_ee7a]
signal layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_22cf]
signal layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_47cf]
signal layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_ca5f]
signal layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_e934]
signal layer0_node4_MUX_bit_math_h_l62_c3_e934_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_904b]
signal layer0_node5_MUX_bit_math_h_l73_c3_904b_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_81dd]
signal layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_7dcd]
signal layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_7a61]
signal layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_d2fc]
signal layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_acdd]
signal layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_2373]
signal layer1_node3_MUX_bit_math_h_l145_c3_2373_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_b1ac]
signal layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_53e2]
signal layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_2609]
signal layer3_node0_MUX_bit_math_h_l190_c3_2609_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_ee7a
layer0_node0_MUX_bit_math_h_l18_c3_ee7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond,
layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_22cf
layer0_node1_MUX_bit_math_h_l29_c3_22cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond,
layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_47cf
layer0_node2_MUX_bit_math_h_l40_c3_47cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond,
layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_ca5f
layer0_node3_MUX_bit_math_h_l51_c3_ca5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond,
layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_e934
layer0_node4_MUX_bit_math_h_l62_c3_e934 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_e934_cond,
layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_904b
layer0_node5_MUX_bit_math_h_l73_c3_904b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_904b_cond,
layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_81dd
layer0_node6_MUX_bit_math_h_l84_c3_81dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond,
layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_7dcd
layer0_node7_MUX_bit_math_h_l95_c3_7dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond,
layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_7a61
layer1_node0_MUX_bit_math_h_l112_c3_7a61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond,
layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_d2fc
layer1_node1_MUX_bit_math_h_l123_c3_d2fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond,
layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_acdd
layer1_node2_MUX_bit_math_h_l134_c3_acdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond,
layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_2373
layer1_node3_MUX_bit_math_h_l145_c3_2373 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_2373_cond,
layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_b1ac
layer2_node0_MUX_bit_math_h_l162_c3_b1ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond,
layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_53e2
layer2_node1_MUX_bit_math_h_l173_c3_53e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond,
layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_2609
layer3_node0_MUX_bit_math_h_l190_c3_2609 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_2609_cond,
layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_78b0_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_948b_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_78b0] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_78b0_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_4488] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_6a8e] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_948b] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_948b_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4488_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6a8e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond := VAR_uint4_2_2_bit_math_h_l158_c10_78b0_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond := VAR_uint4_2_2_bit_math_h_l158_c10_78b0_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_cond := VAR_uint4_3_3_bit_math_h_l186_c10_948b_return_output;
     -- layer0_node0_MUX[bit_math_h_l18_c3_ee7a] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output := layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_22cf] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output := layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_81dd] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output := layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_904b] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_904b_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output := layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_47cf] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output := layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_ca5f] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output := layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_7dcd] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output := layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_e934] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_e934_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output := layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_ee7a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_22cf_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_47cf_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_ca5f_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_e934_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_904b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_81dd_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_7dcd_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_2373] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_2373_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output := layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_acdd] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output := layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_7a61] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output := layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_d2fc] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output := layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_7a61_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_d2fc_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_acdd_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_2373_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_53e2] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output := layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_b1ac] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output := layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_b1ac_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_53e2_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_2609] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_2609_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output := layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_2609_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
