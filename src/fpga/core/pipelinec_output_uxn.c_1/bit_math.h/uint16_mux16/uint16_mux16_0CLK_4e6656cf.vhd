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
-- layer0_node0_MUX[bit_math_h_l18_c3_bd1f]
signal layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d248]
signal layer0_node1_MUX_bit_math_h_l29_c3_d248_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_3c53]
signal layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_4b26]
signal layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_673e]
signal layer0_node4_MUX_bit_math_h_l62_c3_673e_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_3957]
signal layer0_node5_MUX_bit_math_h_l73_c3_3957_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_74a0]
signal layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_7b51]
signal layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_405b]
signal layer1_node0_MUX_bit_math_h_l112_c3_405b_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_2ff4]
signal layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_1b44]
signal layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_dbfc]
signal layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_562a]
signal layer2_node0_MUX_bit_math_h_l162_c3_562a_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_f408]
signal layer2_node1_MUX_bit_math_h_l173_c3_f408_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_ddf6]
signal layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_bd1f
layer0_node0_MUX_bit_math_h_l18_c3_bd1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond,
layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d248
layer0_node1_MUX_bit_math_h_l29_c3_d248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d248_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_3c53
layer0_node2_MUX_bit_math_h_l40_c3_3c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond,
layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_4b26
layer0_node3_MUX_bit_math_h_l51_c3_4b26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond,
layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_673e
layer0_node4_MUX_bit_math_h_l62_c3_673e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_673e_cond,
layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_3957
layer0_node5_MUX_bit_math_h_l73_c3_3957 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_3957_cond,
layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_74a0
layer0_node6_MUX_bit_math_h_l84_c3_74a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond,
layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_7b51
layer0_node7_MUX_bit_math_h_l95_c3_7b51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond,
layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_405b
layer1_node0_MUX_bit_math_h_l112_c3_405b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_405b_cond,
layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_2ff4
layer1_node1_MUX_bit_math_h_l123_c3_2ff4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond,
layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_1b44
layer1_node2_MUX_bit_math_h_l134_c3_1b44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond,
layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_dbfc
layer1_node3_MUX_bit_math_h_l145_c3_dbfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond,
layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_562a
layer2_node0_MUX_bit_math_h_l162_c3_562a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_562a_cond,
layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_f408
layer2_node1_MUX_bit_math_h_l173_c3_f408 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_f408_cond,
layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_ddf6
layer3_node0_MUX_bit_math_h_l190_c3_ddf6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond,
layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_edfa_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_a95a_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue := VAR_in9;
     -- uint4_1_1[bit_math_h_l108_c10_c679] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_a95a] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_a95a_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_bce5] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_edfa] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_edfa_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond := VAR_uint4_0_0_bit_math_h_l14_c10_bce5_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond := VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond := VAR_uint4_1_1_bit_math_h_l108_c10_c679_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_cond := VAR_uint4_2_2_bit_math_h_l158_c10_edfa_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_cond := VAR_uint4_2_2_bit_math_h_l158_c10_edfa_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond := VAR_uint4_3_3_bit_math_h_l186_c10_a95a_return_output;
     -- layer0_node7_MUX[bit_math_h_l95_c3_7b51] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output := layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_74a0] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output := layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_673e] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_673e_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output := layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_3c53] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output := layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d248] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d248_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_4b26] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output := layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_3957] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_3957_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output := layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_bd1f] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output := layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_bd1f_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d248_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_3c53_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_4b26_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_673e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_3957_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_74a0_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_7b51_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_dbfc] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output := layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_1b44] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output := layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_405b] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_405b_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output := layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_2ff4] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output := layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_405b_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_2ff4_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_1b44_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_dbfc_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_562a] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_562a_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output := layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_f408] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_f408_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output := layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_562a_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_f408_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_ddf6] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output := layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_ddf6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
