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
-- layer0_node0_MUX[bit_math_h_l18_c3_45bc]
signal layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_2325]
signal layer0_node1_MUX_bit_math_h_l29_c3_2325_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_524e]
signal layer0_node2_MUX_bit_math_h_l40_c3_524e_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_5018]
signal layer0_node3_MUX_bit_math_h_l51_c3_5018_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_3bb3]
signal layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_c02a]
signal layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_251a]
signal layer0_node6_MUX_bit_math_h_l84_c3_251a_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_6e84]
signal layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_ac98]
signal layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_d9e8]
signal layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_1d76]
signal layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_b31b]
signal layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_03b2]
signal layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_bc6c]
signal layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_3bef]
signal layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_45bc
layer0_node0_MUX_bit_math_h_l18_c3_45bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond,
layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_2325
layer0_node1_MUX_bit_math_h_l29_c3_2325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_2325_cond,
layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_524e
layer0_node2_MUX_bit_math_h_l40_c3_524e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_524e_cond,
layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_5018
layer0_node3_MUX_bit_math_h_l51_c3_5018 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_5018_cond,
layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_3bb3
layer0_node4_MUX_bit_math_h_l62_c3_3bb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond,
layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_c02a
layer0_node5_MUX_bit_math_h_l73_c3_c02a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_251a
layer0_node6_MUX_bit_math_h_l84_c3_251a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_251a_cond,
layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_6e84
layer0_node7_MUX_bit_math_h_l95_c3_6e84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond,
layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_ac98
layer1_node0_MUX_bit_math_h_l112_c3_ac98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond,
layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_d9e8
layer1_node1_MUX_bit_math_h_l123_c3_d9e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond,
layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_1d76
layer1_node2_MUX_bit_math_h_l134_c3_1d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond,
layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_b31b
layer1_node3_MUX_bit_math_h_l145_c3_b31b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond,
layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_03b2
layer2_node0_MUX_bit_math_h_l162_c3_03b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond,
layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_bc6c
layer2_node1_MUX_bit_math_h_l173_c3_bc6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond,
layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_3bef
layer3_node0_MUX_bit_math_h_l190_c3_3bef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond,
layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_a889_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_fa0e_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_fa0e] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_fa0e_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_a889] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_a889_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_ee93] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_de59] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond := VAR_uint4_0_0_bit_math_h_l14_c10_de59_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee93_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond := VAR_uint4_2_2_bit_math_h_l158_c10_a889_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond := VAR_uint4_2_2_bit_math_h_l158_c10_a889_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond := VAR_uint4_3_3_bit_math_h_l186_c10_fa0e_return_output;
     -- layer0_node3_MUX[bit_math_h_l51_c3_5018] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_5018_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output := layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_251a] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_251a_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output := layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_2325] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_2325_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output := layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_c02a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_3bb3] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output := layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_45bc] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output := layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_6e84] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output := layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_524e] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_524e_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output := layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_45bc_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_2325_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_524e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_5018_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_3bb3_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_c02a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_251a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_6e84_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_1d76] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output := layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_b31b] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output := layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_d9e8] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output := layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_ac98] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output := layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_ac98_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_d9e8_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_1d76_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_b31b_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_03b2] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output := layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_bc6c] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output := layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_03b2_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_bc6c_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_3bef] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output := layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_3bef_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
