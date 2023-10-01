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
-- layer0_node0_MUX[bit_math_h_l18_c3_09aa]
signal layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_8e65]
signal layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_ce4e]
signal layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_6c43]
signal layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_1442]
signal layer0_node4_MUX_bit_math_h_l62_c3_1442_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_aaf2]
signal layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_1d7e]
signal layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_7a6e]
signal layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_ebd3]
signal layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_3c47]
signal layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_a100]
signal layer1_node2_MUX_bit_math_h_l134_c3_a100_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_c939]
signal layer1_node3_MUX_bit_math_h_l145_c3_c939_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_dc5a]
signal layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_431b]
signal layer2_node1_MUX_bit_math_h_l173_c3_431b_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_ae05]
signal layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_09aa
layer0_node0_MUX_bit_math_h_l18_c3_09aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond,
layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_8e65
layer0_node1_MUX_bit_math_h_l29_c3_8e65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond,
layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_ce4e
layer0_node2_MUX_bit_math_h_l40_c3_ce4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond,
layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_6c43
layer0_node3_MUX_bit_math_h_l51_c3_6c43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond,
layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_1442
layer0_node4_MUX_bit_math_h_l62_c3_1442 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_1442_cond,
layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_aaf2
layer0_node5_MUX_bit_math_h_l73_c3_aaf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond,
layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_1d7e
layer0_node6_MUX_bit_math_h_l84_c3_1d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond,
layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_7a6e
layer0_node7_MUX_bit_math_h_l95_c3_7a6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond,
layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_ebd3
layer1_node0_MUX_bit_math_h_l112_c3_ebd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond,
layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_3c47
layer1_node1_MUX_bit_math_h_l123_c3_3c47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond,
layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_a100
layer1_node2_MUX_bit_math_h_l134_c3_a100 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_a100_cond,
layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_c939
layer1_node3_MUX_bit_math_h_l145_c3_c939 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_c939_cond,
layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_dc5a
layer2_node0_MUX_bit_math_h_l162_c3_dc5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond,
layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_431b
layer2_node1_MUX_bit_math_h_l173_c3_431b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_431b_cond,
layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_ae05
layer3_node0_MUX_bit_math_h_l190_c3_ae05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond,
layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_c11f_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_0524_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_b856] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_c11f] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_c11f_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_811e] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_0524] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_0524_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_b856_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond := VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond := VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_cond := VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_cond := VAR_uint4_1_1_bit_math_h_l108_c10_811e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c11f_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c11f_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond := VAR_uint4_3_3_bit_math_h_l186_c10_0524_return_output;
     -- layer0_node1_MUX[bit_math_h_l29_c3_8e65] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output := layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_aaf2] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output := layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_1d7e] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output := layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_7a6e] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output := layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_ce4e] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output := layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_6c43] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output := layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_09aa] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output := layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_1442] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_1442_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output := layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_09aa_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_8e65_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_ce4e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_6c43_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_1442_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_aaf2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_1d7e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_7a6e_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_3c47] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output := layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_a100] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_a100_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output := layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_ebd3] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output := layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_c939] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_c939_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output := layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_ebd3_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_3c47_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_a100_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_c939_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_431b] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_431b_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output := layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_dc5a] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output := layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_dc5a_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_431b_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_ae05] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output := layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_ae05_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
