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
-- layer0_node0_MUX[bit_math_h_l18_c3_e569]
signal layer0_node0_MUX_bit_math_h_l18_c3_e569_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_d292]
signal layer0_node1_MUX_bit_math_h_l29_c3_d292_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_e6a2]
signal layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_2659]
signal layer0_node3_MUX_bit_math_h_l51_c3_2659_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_af2a]
signal layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_550a]
signal layer0_node5_MUX_bit_math_h_l73_c3_550a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_b68f]
signal layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_de66]
signal layer0_node7_MUX_bit_math_h_l95_c3_de66_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_8a8e]
signal layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_204b]
signal layer1_node1_MUX_bit_math_h_l123_c3_204b_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_ca0a]
signal layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_626d]
signal layer1_node3_MUX_bit_math_h_l145_c3_626d_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_dd69]
signal layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_1e89]
signal layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_b3db]
signal layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_e569
layer0_node0_MUX_bit_math_h_l18_c3_e569 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_e569_cond,
layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_d292
layer0_node1_MUX_bit_math_h_l29_c3_d292 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_d292_cond,
layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_e6a2
layer0_node2_MUX_bit_math_h_l40_c3_e6a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond,
layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_2659
layer0_node3_MUX_bit_math_h_l51_c3_2659 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_2659_cond,
layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_af2a
layer0_node4_MUX_bit_math_h_l62_c3_af2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond,
layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_550a
layer0_node5_MUX_bit_math_h_l73_c3_550a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_550a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_b68f
layer0_node6_MUX_bit_math_h_l84_c3_b68f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond,
layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_de66
layer0_node7_MUX_bit_math_h_l95_c3_de66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_de66_cond,
layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_8a8e
layer1_node0_MUX_bit_math_h_l112_c3_8a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond,
layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_204b
layer1_node1_MUX_bit_math_h_l123_c3_204b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_204b_cond,
layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_ca0a
layer1_node2_MUX_bit_math_h_l134_c3_ca0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond,
layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_626d
layer1_node3_MUX_bit_math_h_l145_c3_626d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_626d_cond,
layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_dd69
layer2_node0_MUX_bit_math_h_l162_c3_dd69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond,
layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_1e89
layer2_node1_MUX_bit_math_h_l173_c3_1e89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond,
layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_b3db
layer3_node0_MUX_bit_math_h_l190_c3_b3db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond,
layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_c1b6_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_3ce0_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_3ce0] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_3ce0_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_fcc2] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_2e90] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_c1b6] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_c1b6_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_cond := VAR_uint4_0_0_bit_math_h_l14_c10_2e90_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_cond := VAR_uint4_1_1_bit_math_h_l108_c10_fcc2_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c1b6_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c1b6_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond := VAR_uint4_3_3_bit_math_h_l186_c10_3ce0_return_output;
     -- layer0_node3_MUX[bit_math_h_l51_c3_2659] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_2659_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output := layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_e569] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_e569_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output := layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_d292] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_d292_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output := layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_de66] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_de66_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output := layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_550a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_550a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_e6a2] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output := layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_af2a] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output := layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_b68f] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output := layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_e569_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_d292_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_e6a2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_2659_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_af2a_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_550a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_b68f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_de66_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_204b] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_204b_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output := layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_8a8e] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output := layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_ca0a] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output := layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_626d] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_626d_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output := layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_8a8e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_204b_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_ca0a_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_626d_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_1e89] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output := layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_dd69] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output := layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_dd69_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_1e89_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_b3db] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output := layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_b3db_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
