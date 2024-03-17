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
-- layer0_node0_MUX[bit_math_h_l18_c3_3c7e]
signal layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_3971]
signal layer0_node1_MUX_bit_math_h_l29_c3_3971_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_58c8]
signal layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_12a2]
signal layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_82fa]
signal layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_dbda]
signal layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_86ff]
signal layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_b293]
signal layer0_node7_MUX_bit_math_h_l95_c3_b293_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_5b33]
signal layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_ee0b]
signal layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_58f3]
signal layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_8eec]
signal layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_1ec8]
signal layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_5a98]
signal layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_771f]
signal layer3_node0_MUX_bit_math_h_l190_c3_771f_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_3c7e
layer0_node0_MUX_bit_math_h_l18_c3_3c7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond,
layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_3971
layer0_node1_MUX_bit_math_h_l29_c3_3971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_3971_cond,
layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_58c8
layer0_node2_MUX_bit_math_h_l40_c3_58c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond,
layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_12a2
layer0_node3_MUX_bit_math_h_l51_c3_12a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond,
layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_82fa
layer0_node4_MUX_bit_math_h_l62_c3_82fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond,
layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_dbda
layer0_node5_MUX_bit_math_h_l73_c3_dbda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond,
layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_86ff
layer0_node6_MUX_bit_math_h_l84_c3_86ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond,
layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_b293
layer0_node7_MUX_bit_math_h_l95_c3_b293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_b293_cond,
layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_5b33
layer1_node0_MUX_bit_math_h_l112_c3_5b33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond,
layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_ee0b
layer1_node1_MUX_bit_math_h_l123_c3_ee0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond,
layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_58f3
layer1_node2_MUX_bit_math_h_l134_c3_58f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond,
layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_8eec
layer1_node3_MUX_bit_math_h_l145_c3_8eec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond,
layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_1ec8
layer2_node0_MUX_bit_math_h_l162_c3_1ec8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond,
layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_5a98
layer2_node1_MUX_bit_math_h_l173_c3_5a98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond,
layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_771f
layer3_node0_MUX_bit_math_h_l190_c3_771f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_771f_cond,
layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_04b3_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_f220_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_f220] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_f220_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_4c5e] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_40c3] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_04b3] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_04b3_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_cond := VAR_uint4_0_0_bit_math_h_l14_c10_40c3_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond := VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond := VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond := VAR_uint4_1_1_bit_math_h_l108_c10_4c5e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond := VAR_uint4_2_2_bit_math_h_l158_c10_04b3_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond := VAR_uint4_2_2_bit_math_h_l158_c10_04b3_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_cond := VAR_uint4_3_3_bit_math_h_l186_c10_f220_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_dbda] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output := layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_58c8] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output := layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_3c7e] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output := layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_12a2] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output := layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_3971] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_3971_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output := layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_86ff] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output := layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_b293] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_b293_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output := layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_82fa] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output := layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_3c7e_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_3971_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_58c8_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_12a2_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_82fa_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_dbda_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_86ff_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_b293_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_58f3] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output := layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_5b33] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output := layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_ee0b] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output := layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_8eec] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output := layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_5b33_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_ee0b_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_58f3_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_8eec_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_5a98] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output := layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_1ec8] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output := layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_1ec8_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_5a98_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_771f] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_771f_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output := layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_771f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
