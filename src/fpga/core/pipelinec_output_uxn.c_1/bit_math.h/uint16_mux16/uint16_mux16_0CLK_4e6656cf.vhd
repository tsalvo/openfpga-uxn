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
-- layer0_node0_MUX[bit_math_h_l18_c3_470f]
signal layer0_node0_MUX_bit_math_h_l18_c3_470f_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d56b]
signal layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_0083]
signal layer0_node2_MUX_bit_math_h_l40_c3_0083_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_7994]
signal layer0_node3_MUX_bit_math_h_l51_c3_7994_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_dcf0]
signal layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_560a]
signal layer0_node5_MUX_bit_math_h_l73_c3_560a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_1b17]
signal layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_7411]
signal layer0_node7_MUX_bit_math_h_l95_c3_7411_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_a27e]
signal layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_c1e2]
signal layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_8c96]
signal layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_edfc]
signal layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_2b28]
signal layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_e696]
signal layer2_node1_MUX_bit_math_h_l173_c3_e696_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_5024]
signal layer3_node0_MUX_bit_math_h_l190_c3_5024_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_470f
layer0_node0_MUX_bit_math_h_l18_c3_470f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_470f_cond,
layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d56b
layer0_node1_MUX_bit_math_h_l29_c3_d56b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_0083
layer0_node2_MUX_bit_math_h_l40_c3_0083 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_0083_cond,
layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_7994
layer0_node3_MUX_bit_math_h_l51_c3_7994 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_7994_cond,
layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_dcf0
layer0_node4_MUX_bit_math_h_l62_c3_dcf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond,
layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_560a
layer0_node5_MUX_bit_math_h_l73_c3_560a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_560a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_1b17
layer0_node6_MUX_bit_math_h_l84_c3_1b17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond,
layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_7411
layer0_node7_MUX_bit_math_h_l95_c3_7411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_7411_cond,
layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_a27e
layer1_node0_MUX_bit_math_h_l112_c3_a27e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond,
layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_c1e2
layer1_node1_MUX_bit_math_h_l123_c3_c1e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond,
layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_8c96
layer1_node2_MUX_bit_math_h_l134_c3_8c96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond,
layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_edfc
layer1_node3_MUX_bit_math_h_l145_c3_edfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond,
layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_2b28
layer2_node0_MUX_bit_math_h_l162_c3_2b28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond,
layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_e696
layer2_node1_MUX_bit_math_h_l173_c3_e696 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_e696_cond,
layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_5024
layer3_node0_MUX_bit_math_h_l190_c3_5024 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_5024_cond,
layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_cf64_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_175c_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_cf64] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_cf64_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_8d13] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_cc6d] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_175c] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_175c_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_cond := VAR_uint4_0_0_bit_math_h_l14_c10_cc6d_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8d13_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond := VAR_uint4_2_2_bit_math_h_l158_c10_cf64_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_cond := VAR_uint4_2_2_bit_math_h_l158_c10_cf64_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_cond := VAR_uint4_3_3_bit_math_h_l186_c10_175c_return_output;
     -- layer0_node4_MUX[bit_math_h_l62_c3_dcf0] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output := layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_7411] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_7411_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output := layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_560a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_560a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_1b17] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output := layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_7994] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_7994_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output := layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d56b] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_470f] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_470f_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output := layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_0083] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_0083_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output := layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_470f_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d56b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_0083_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_7994_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_dcf0_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_560a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_1b17_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_7411_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_a27e] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output := layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_edfc] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output := layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_8c96] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output := layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_c1e2] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output := layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_a27e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_c1e2_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_8c96_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_edfc_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_2b28] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output := layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_e696] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_e696_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output := layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_2b28_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_e696_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_5024] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_5024_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output := layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_5024_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
