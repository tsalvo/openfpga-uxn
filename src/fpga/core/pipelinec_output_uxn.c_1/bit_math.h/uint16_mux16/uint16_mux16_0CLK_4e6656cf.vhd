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
-- layer0_node0_MUX[bit_math_h_l18_c3_e797]
signal layer0_node0_MUX_bit_math_h_l18_c3_e797_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_48a4]
signal layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_81e1]
signal layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_a357]
signal layer0_node3_MUX_bit_math_h_l51_c3_a357_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_3af4]
signal layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_7572]
signal layer0_node5_MUX_bit_math_h_l73_c3_7572_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_9a4e]
signal layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_3114]
signal layer0_node7_MUX_bit_math_h_l95_c3_3114_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_80c4]
signal layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_ec61]
signal layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_b176]
signal layer1_node2_MUX_bit_math_h_l134_c3_b176_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_dd0e]
signal layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_64df]
signal layer2_node0_MUX_bit_math_h_l162_c3_64df_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_85be]
signal layer2_node1_MUX_bit_math_h_l173_c3_85be_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_6eaa]
signal layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_e797
layer0_node0_MUX_bit_math_h_l18_c3_e797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_e797_cond,
layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_48a4
layer0_node1_MUX_bit_math_h_l29_c3_48a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond,
layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_81e1
layer0_node2_MUX_bit_math_h_l40_c3_81e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond,
layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_a357
layer0_node3_MUX_bit_math_h_l51_c3_a357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_a357_cond,
layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_3af4
layer0_node4_MUX_bit_math_h_l62_c3_3af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond,
layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_7572
layer0_node5_MUX_bit_math_h_l73_c3_7572 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_7572_cond,
layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_9a4e
layer0_node6_MUX_bit_math_h_l84_c3_9a4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond,
layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_3114
layer0_node7_MUX_bit_math_h_l95_c3_3114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_3114_cond,
layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_80c4
layer1_node0_MUX_bit_math_h_l112_c3_80c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond,
layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_ec61
layer1_node1_MUX_bit_math_h_l123_c3_ec61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond,
layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_b176
layer1_node2_MUX_bit_math_h_l134_c3_b176 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_b176_cond,
layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_dd0e
layer1_node3_MUX_bit_math_h_l145_c3_dd0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond,
layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_64df
layer2_node0_MUX_bit_math_h_l162_c3_64df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_64df_cond,
layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_85be
layer2_node1_MUX_bit_math_h_l173_c3_85be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_85be_cond,
layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_6eaa
layer3_node0_MUX_bit_math_h_l190_c3_6eaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond,
layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_6744_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_52a2_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_6744] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_6744_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_34f8] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_abde] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_52a2] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_52a2_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_cond := VAR_uint4_0_0_bit_math_h_l14_c10_abde_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond := VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_cond := VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_34f8_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_cond := VAR_uint4_2_2_bit_math_h_l158_c10_6744_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_cond := VAR_uint4_2_2_bit_math_h_l158_c10_6744_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond := VAR_uint4_3_3_bit_math_h_l186_c10_52a2_return_output;
     -- layer0_node4_MUX[bit_math_h_l62_c3_3af4] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output := layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_e797] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_e797_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output := layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_3114] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_3114_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output := layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_48a4] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output := layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_7572] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_7572_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output := layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_81e1] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output := layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_9a4e] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output := layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_a357] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_a357_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output := layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_e797_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_48a4_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_81e1_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_a357_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_3af4_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_7572_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_9a4e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_3114_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_80c4] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output := layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_ec61] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output := layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_dd0e] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output := layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_b176] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_b176_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output := layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_80c4_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_ec61_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_b176_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_dd0e_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_64df] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_64df_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output := layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_85be] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_85be_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output := layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_64df_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_85be_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_6eaa] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output := layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_6eaa_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
