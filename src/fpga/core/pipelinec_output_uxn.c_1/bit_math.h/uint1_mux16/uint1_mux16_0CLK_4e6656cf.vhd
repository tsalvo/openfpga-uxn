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
entity uint1_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(0 downto 0);
 in1 : in unsigned(0 downto 0);
 in2 : in unsigned(0 downto 0);
 in3 : in unsigned(0 downto 0);
 in4 : in unsigned(0 downto 0);
 in5 : in unsigned(0 downto 0);
 in6 : in unsigned(0 downto 0);
 in7 : in unsigned(0 downto 0);
 in8 : in unsigned(0 downto 0);
 in9 : in unsigned(0 downto 0);
 in10 : in unsigned(0 downto 0);
 in11 : in unsigned(0 downto 0);
 in12 : in unsigned(0 downto 0);
 in13 : in unsigned(0 downto 0);
 in14 : in unsigned(0 downto 0);
 in15 : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end uint1_mux16_0CLK_4e6656cf;
architecture arch of uint1_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_25ee]
signal layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_961b]
signal layer0_node1_MUX_bit_math_h_l29_c3_961b_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_38ff]
signal layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_1f34]
signal layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_6e1c]
signal layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_b88f]
signal layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_5dcd]
signal layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_2c6f]
signal layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_eb01]
signal layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_443d]
signal layer1_node1_MUX_bit_math_h_l123_c3_443d_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_c3ff]
signal layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_b7c9]
signal layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_267b]
signal layer2_node0_MUX_bit_math_h_l162_c3_267b_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_3a03]
signal layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_11ce]
signal layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_25ee
layer0_node0_MUX_bit_math_h_l18_c3_25ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond,
layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_961b
layer0_node1_MUX_bit_math_h_l29_c3_961b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_961b_cond,
layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_38ff
layer0_node2_MUX_bit_math_h_l40_c3_38ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond,
layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_1f34
layer0_node3_MUX_bit_math_h_l51_c3_1f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond,
layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_6e1c
layer0_node4_MUX_bit_math_h_l62_c3_6e1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond,
layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_b88f
layer0_node5_MUX_bit_math_h_l73_c3_b88f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond,
layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_5dcd
layer0_node6_MUX_bit_math_h_l84_c3_5dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond,
layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_2c6f
layer0_node7_MUX_bit_math_h_l95_c3_2c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond,
layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_eb01
layer1_node0_MUX_bit_math_h_l112_c3_eb01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond,
layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_443d
layer1_node1_MUX_bit_math_h_l123_c3_443d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_443d_cond,
layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_c3ff
layer1_node2_MUX_bit_math_h_l134_c3_c3ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond,
layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_b7c9
layer1_node3_MUX_bit_math_h_l145_c3_b7c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond,
layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_267b
layer2_node0_MUX_bit_math_h_l162_c3_267b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_267b_cond,
layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_3a03
layer2_node1_MUX_bit_math_h_l173_c3_3a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond,
layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_11ce
layer3_node0_MUX_bit_math_h_l190_c3_11ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond,
layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(0 downto 0);
 variable VAR_in1 : unsigned(0 downto 0);
 variable VAR_in2 : unsigned(0 downto 0);
 variable VAR_in3 : unsigned(0 downto 0);
 variable VAR_in4 : unsigned(0 downto 0);
 variable VAR_in5 : unsigned(0 downto 0);
 variable VAR_in6 : unsigned(0 downto 0);
 variable VAR_in7 : unsigned(0 downto 0);
 variable VAR_in8 : unsigned(0 downto 0);
 variable VAR_in9 : unsigned(0 downto 0);
 variable VAR_in10 : unsigned(0 downto 0);
 variable VAR_in11 : unsigned(0 downto 0);
 variable VAR_in12 : unsigned(0 downto 0);
 variable VAR_in13 : unsigned(0 downto 0);
 variable VAR_in14 : unsigned(0 downto 0);
 variable VAR_in15 : unsigned(0 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_37ac_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_cc76_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_cc76] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_cc76_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_37ac] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_37ac_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_d9a6] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_3a91] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output := uint4_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_3a91_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_d9a6_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_cond := VAR_uint4_2_2_bit_math_h_l158_c10_37ac_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond := VAR_uint4_2_2_bit_math_h_l158_c10_37ac_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond := VAR_uint4_3_3_bit_math_h_l186_c10_cc76_return_output;
     -- layer0_node4_MUX[bit_math_h_l62_c3_6e1c] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output := layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_b88f] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output := layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_961b] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_961b_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output := layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_1f34] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output := layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_5dcd] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output := layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_38ff] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output := layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_25ee] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output := layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_2c6f] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output := layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_25ee_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_961b_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_38ff_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_1f34_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_6e1c_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_b88f_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_5dcd_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_2c6f_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_443d] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_443d_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output := layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_b7c9] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output := layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_eb01] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output := layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_c3ff] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output := layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_eb01_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_443d_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_c3ff_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_b7c9_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_3a03] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output := layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_267b] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_267b_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output := layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_267b_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_3a03_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_11ce] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output := layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_11ce_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
