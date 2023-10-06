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
-- layer0_node0_MUX[bit_math_h_l18_c3_f47b]
signal layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_e636]
signal layer0_node1_MUX_bit_math_h_l29_c3_e636_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_1ec6]
signal layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_2abd]
signal layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_7ae0]
signal layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_e6aa]
signal layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_6b32]
signal layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_232c]
signal layer0_node7_MUX_bit_math_h_l95_c3_232c_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_bef6]
signal layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_50ec]
signal layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_5a19]
signal layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_3c32]
signal layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_6162]
signal layer2_node0_MUX_bit_math_h_l162_c3_6162_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_dbd9]
signal layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_5757]
signal layer3_node0_MUX_bit_math_h_l190_c3_5757_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_f47b
layer0_node0_MUX_bit_math_h_l18_c3_f47b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond,
layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_e636
layer0_node1_MUX_bit_math_h_l29_c3_e636 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_e636_cond,
layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_1ec6
layer0_node2_MUX_bit_math_h_l40_c3_1ec6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond,
layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_2abd
layer0_node3_MUX_bit_math_h_l51_c3_2abd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond,
layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_7ae0
layer0_node4_MUX_bit_math_h_l62_c3_7ae0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond,
layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_e6aa
layer0_node5_MUX_bit_math_h_l73_c3_e6aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond,
layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_6b32
layer0_node6_MUX_bit_math_h_l84_c3_6b32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond,
layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_232c
layer0_node7_MUX_bit_math_h_l95_c3_232c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_232c_cond,
layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_bef6
layer1_node0_MUX_bit_math_h_l112_c3_bef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond,
layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_50ec
layer1_node1_MUX_bit_math_h_l123_c3_50ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond,
layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_5a19
layer1_node2_MUX_bit_math_h_l134_c3_5a19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond,
layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_3c32
layer1_node3_MUX_bit_math_h_l145_c3_3c32 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond,
layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_6162
layer2_node0_MUX_bit_math_h_l162_c3_6162 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_6162_cond,
layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_dbd9
layer2_node1_MUX_bit_math_h_l173_c3_dbd9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond,
layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_5757
layer3_node0_MUX_bit_math_h_l190_c3_5757 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_5757_cond,
layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_aa39_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_b425_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_b425] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_b425_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_225d] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_ef40] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_aa39] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_aa39_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_ef40_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond := VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond := VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond := VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond := VAR_uint4_1_1_bit_math_h_l108_c10_225d_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_cond := VAR_uint4_2_2_bit_math_h_l158_c10_aa39_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond := VAR_uint4_2_2_bit_math_h_l158_c10_aa39_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_cond := VAR_uint4_3_3_bit_math_h_l186_c10_b425_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_e6aa] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output := layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_232c] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_232c_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output := layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_2abd] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output := layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_e636] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_e636_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output := layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_7ae0] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output := layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_6b32] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output := layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_f47b] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output := layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_1ec6] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output := layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_f47b_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_e636_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_1ec6_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_2abd_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_7ae0_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_e6aa_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_6b32_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_232c_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_bef6] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output := layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_50ec] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output := layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_3c32] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output := layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_5a19] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output := layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_bef6_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_50ec_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_5a19_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_3c32_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_dbd9] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output := layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_6162] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_6162_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output := layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_6162_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_dbd9_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_5757] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_5757_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output := layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_5757_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
