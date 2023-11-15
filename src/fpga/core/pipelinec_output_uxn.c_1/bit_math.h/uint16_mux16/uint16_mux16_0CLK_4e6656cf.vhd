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
-- layer0_node0_MUX[bit_math_h_l18_c3_f439]
signal layer0_node0_MUX_bit_math_h_l18_c3_f439_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d6a6]
signal layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_5baa]
signal layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_21f6]
signal layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_52e0]
signal layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_53a6]
signal layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_5042]
signal layer0_node6_MUX_bit_math_h_l84_c3_5042_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_2b5d]
signal layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_99cc]
signal layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_61ae]
signal layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_806f]
signal layer1_node2_MUX_bit_math_h_l134_c3_806f_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_8851]
signal layer1_node3_MUX_bit_math_h_l145_c3_8851_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_68f3]
signal layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_f845]
signal layer2_node1_MUX_bit_math_h_l173_c3_f845_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_b2b4]
signal layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_f439
layer0_node0_MUX_bit_math_h_l18_c3_f439 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_f439_cond,
layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d6a6
layer0_node1_MUX_bit_math_h_l29_c3_d6a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_5baa
layer0_node2_MUX_bit_math_h_l40_c3_5baa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond,
layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_21f6
layer0_node3_MUX_bit_math_h_l51_c3_21f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond,
layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_52e0
layer0_node4_MUX_bit_math_h_l62_c3_52e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond,
layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_53a6
layer0_node5_MUX_bit_math_h_l73_c3_53a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond,
layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_5042
layer0_node6_MUX_bit_math_h_l84_c3_5042 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_5042_cond,
layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_2b5d
layer0_node7_MUX_bit_math_h_l95_c3_2b5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond,
layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_99cc
layer1_node0_MUX_bit_math_h_l112_c3_99cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond,
layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_61ae
layer1_node1_MUX_bit_math_h_l123_c3_61ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond,
layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_806f
layer1_node2_MUX_bit_math_h_l134_c3_806f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_806f_cond,
layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_8851
layer1_node3_MUX_bit_math_h_l145_c3_8851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_8851_cond,
layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_68f3
layer2_node0_MUX_bit_math_h_l162_c3_68f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond,
layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_f845
layer2_node1_MUX_bit_math_h_l173_c3_f845 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_f845_cond,
layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_b2b4
layer3_node0_MUX_bit_math_h_l190_c3_b2b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond,
layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_0bad_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_2412_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_0bad] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_0bad_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_fa96] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_2412] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_2412_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_a1e0] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_a1e0_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fa96_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond := VAR_uint4_2_2_bit_math_h_l158_c10_0bad_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_cond := VAR_uint4_2_2_bit_math_h_l158_c10_0bad_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond := VAR_uint4_3_3_bit_math_h_l186_c10_2412_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_53a6] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output := layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_52e0] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output := layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_5042] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_5042_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output := layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_f439] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_f439_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output := layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_2b5d] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output := layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_5baa] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output := layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_21f6] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output := layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d6a6] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_f439_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d6a6_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_5baa_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_21f6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_52e0_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_53a6_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_5042_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_2b5d_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_61ae] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output := layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_806f] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_806f_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output := layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_8851] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_8851_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output := layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_99cc] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output := layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_99cc_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_61ae_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_806f_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_8851_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_68f3] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output := layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_f845] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_f845_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output := layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_68f3_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_f845_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_b2b4] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output := layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_b2b4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
