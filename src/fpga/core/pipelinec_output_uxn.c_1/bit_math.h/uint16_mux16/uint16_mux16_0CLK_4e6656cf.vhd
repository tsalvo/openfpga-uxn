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
-- layer0_node0_MUX[bit_math_h_l18_c3_71bc]
signal layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_fbb9]
signal layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_2a09]
signal layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_819d]
signal layer0_node3_MUX_bit_math_h_l51_c3_819d_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_6b44]
signal layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_5849]
signal layer0_node5_MUX_bit_math_h_l73_c3_5849_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_f0df]
signal layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_cdbc]
signal layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_df2e]
signal layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_b3e2]
signal layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_926d]
signal layer1_node2_MUX_bit_math_h_l134_c3_926d_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_47ad]
signal layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_01e4]
signal layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_8fdf]
signal layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_3e41]
signal layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_71bc
layer0_node0_MUX_bit_math_h_l18_c3_71bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond,
layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_fbb9
layer0_node1_MUX_bit_math_h_l29_c3_fbb9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond,
layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_2a09
layer0_node2_MUX_bit_math_h_l40_c3_2a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond,
layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_819d
layer0_node3_MUX_bit_math_h_l51_c3_819d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_819d_cond,
layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_6b44
layer0_node4_MUX_bit_math_h_l62_c3_6b44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond,
layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_5849
layer0_node5_MUX_bit_math_h_l73_c3_5849 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_5849_cond,
layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_f0df
layer0_node6_MUX_bit_math_h_l84_c3_f0df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond,
layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_cdbc
layer0_node7_MUX_bit_math_h_l95_c3_cdbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond,
layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_df2e
layer1_node0_MUX_bit_math_h_l112_c3_df2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond,
layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_b3e2
layer1_node1_MUX_bit_math_h_l123_c3_b3e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond,
layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_926d
layer1_node2_MUX_bit_math_h_l134_c3_926d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_926d_cond,
layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_47ad
layer1_node3_MUX_bit_math_h_l145_c3_47ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond,
layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_01e4
layer2_node0_MUX_bit_math_h_l162_c3_01e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond,
layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_8fdf
layer2_node1_MUX_bit_math_h_l173_c3_8fdf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond,
layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_3e41
layer3_node0_MUX_bit_math_h_l190_c3_3e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond,
layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_bab2_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_fcc2_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_047d] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_bab2] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_bab2_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_37fe] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_fcc2] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_fcc2_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond := VAR_uint4_0_0_bit_math_h_l14_c10_37fe_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond := VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_cond := VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond := VAR_uint4_1_1_bit_math_h_l108_c10_047d_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond := VAR_uint4_2_2_bit_math_h_l158_c10_bab2_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond := VAR_uint4_2_2_bit_math_h_l158_c10_bab2_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond := VAR_uint4_3_3_bit_math_h_l186_c10_fcc2_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_5849] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_5849_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output := layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_fbb9] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output := layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_2a09] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output := layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_71bc] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output := layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_cdbc] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output := layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_6b44] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output := layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_f0df] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output := layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_819d] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_819d_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output := layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_71bc_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_fbb9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_2a09_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_819d_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_6b44_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_5849_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_f0df_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_cdbc_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_df2e] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output := layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_47ad] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output := layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_b3e2] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output := layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_926d] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_926d_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output := layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_df2e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_b3e2_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_926d_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_47ad_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_01e4] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output := layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_8fdf] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output := layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_01e4_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_8fdf_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_3e41] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output := layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_3e41_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
