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
-- layer0_node0_MUX[bit_math_h_l18_c3_1df7]
signal layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_ec77]
signal layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_9acd]
signal layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_aa6e]
signal layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_cb07]
signal layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_4d92]
signal layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_a66f]
signal layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_e8fd]
signal layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_30f4]
signal layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_be09]
signal layer1_node1_MUX_bit_math_h_l123_c3_be09_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_d95d]
signal layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_9849]
signal layer1_node3_MUX_bit_math_h_l145_c3_9849_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_b88d]
signal layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_7231]
signal layer2_node1_MUX_bit_math_h_l173_c3_7231_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_69d4]
signal layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_1df7
layer0_node0_MUX_bit_math_h_l18_c3_1df7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond,
layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_ec77
layer0_node1_MUX_bit_math_h_l29_c3_ec77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond,
layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_9acd
layer0_node2_MUX_bit_math_h_l40_c3_9acd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond,
layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_aa6e
layer0_node3_MUX_bit_math_h_l51_c3_aa6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond,
layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_cb07
layer0_node4_MUX_bit_math_h_l62_c3_cb07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond,
layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_4d92
layer0_node5_MUX_bit_math_h_l73_c3_4d92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond,
layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_a66f
layer0_node6_MUX_bit_math_h_l84_c3_a66f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond,
layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_e8fd
layer0_node7_MUX_bit_math_h_l95_c3_e8fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond,
layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_30f4
layer1_node0_MUX_bit_math_h_l112_c3_30f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond,
layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_be09
layer1_node1_MUX_bit_math_h_l123_c3_be09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_be09_cond,
layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_d95d
layer1_node2_MUX_bit_math_h_l134_c3_d95d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond,
layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_9849
layer1_node3_MUX_bit_math_h_l145_c3_9849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_9849_cond,
layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_b88d
layer2_node0_MUX_bit_math_h_l162_c3_b88d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond,
layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_7231
layer2_node1_MUX_bit_math_h_l173_c3_7231 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_7231_cond,
layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_69d4
layer3_node0_MUX_bit_math_h_l190_c3_69d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond,
layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_219c_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_344c_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_219c] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_219c_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_73db] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_344c] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_344c_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_997d] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_73db_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_cond := VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond := VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_cond := VAR_uint4_1_1_bit_math_h_l108_c10_997d_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond := VAR_uint4_2_2_bit_math_h_l158_c10_219c_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_cond := VAR_uint4_2_2_bit_math_h_l158_c10_219c_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond := VAR_uint4_3_3_bit_math_h_l186_c10_344c_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_9acd] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output := layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_cb07] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output := layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_aa6e] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output := layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_1df7] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output := layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_a66f] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output := layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_e8fd] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output := layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_ec77] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output := layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_4d92] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output := layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_1df7_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_ec77_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_9acd_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_aa6e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_cb07_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_4d92_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_a66f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_e8fd_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_9849] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_9849_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output := layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_30f4] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output := layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_d95d] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output := layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_be09] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_be09_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output := layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_30f4_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_be09_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_d95d_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_9849_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_7231] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_7231_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output := layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_b88d] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output := layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_b88d_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_7231_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_69d4] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output := layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_69d4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
