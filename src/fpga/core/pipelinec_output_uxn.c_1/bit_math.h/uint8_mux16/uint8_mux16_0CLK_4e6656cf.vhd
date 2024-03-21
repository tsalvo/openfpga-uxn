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
-- layer0_node0_MUX[bit_math_h_l18_c3_7d4e]
signal layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_3557]
signal layer0_node1_MUX_bit_math_h_l29_c3_3557_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_99fd]
signal layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_e5a9]
signal layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output : unsigned(7 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_ffd8]
signal layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse : unsigned(7 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output : unsigned(7 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_626a]
signal layer0_node5_MUX_bit_math_h_l73_c3_626a_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse : unsigned(7 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output : unsigned(7 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_332b]
signal layer0_node6_MUX_bit_math_h_l84_c3_332b_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse : unsigned(7 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output : unsigned(7 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_1f40]
signal layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse : unsigned(7 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_09f9]
signal layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_8ec7]
signal layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output : unsigned(7 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_e68b]
signal layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse : unsigned(7 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output : unsigned(7 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_81fe]
signal layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse : unsigned(7 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_9ba7]
signal layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output : unsigned(7 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_db01]
signal layer2_node1_MUX_bit_math_h_l173_c3_db01_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse : unsigned(7 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output : unsigned(7 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_b427]
signal layer3_node0_MUX_bit_math_h_l190_c3_b427_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse : unsigned(7 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_7d4e
layer0_node0_MUX_bit_math_h_l18_c3_7d4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond,
layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_3557
layer0_node1_MUX_bit_math_h_l29_c3_3557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_3557_cond,
layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_99fd
layer0_node2_MUX_bit_math_h_l40_c3_99fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond,
layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_e5a9
layer0_node3_MUX_bit_math_h_l51_c3_e5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond,
layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_ffd8
layer0_node4_MUX_bit_math_h_l62_c3_ffd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond,
layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_626a
layer0_node5_MUX_bit_math_h_l73_c3_626a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_626a_cond,
layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_332b
layer0_node6_MUX_bit_math_h_l84_c3_332b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_332b_cond,
layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_1f40
layer0_node7_MUX_bit_math_h_l95_c3_1f40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond,
layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_09f9
layer1_node0_MUX_bit_math_h_l112_c3_09f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond,
layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_8ec7
layer1_node1_MUX_bit_math_h_l123_c3_8ec7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond,
layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_e68b
layer1_node2_MUX_bit_math_h_l134_c3_e68b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond,
layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_81fe
layer1_node3_MUX_bit_math_h_l145_c3_81fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond,
layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_9ba7
layer2_node0_MUX_bit_math_h_l162_c3_9ba7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond,
layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_db01
layer2_node1_MUX_bit_math_h_l173_c3_db01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_db01_cond,
layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_b427
layer3_node0_MUX_bit_math_h_l190_c3_b427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_b427_cond,
layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_31c6_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_df51_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output : unsigned(7 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_31c6] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_31c6_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_6338] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_197b] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_df51] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_df51_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond := VAR_uint4_0_0_bit_math_h_l14_c10_197b_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond := VAR_uint4_1_1_bit_math_h_l108_c10_6338_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond := VAR_uint4_2_2_bit_math_h_l158_c10_31c6_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_cond := VAR_uint4_2_2_bit_math_h_l158_c10_31c6_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_cond := VAR_uint4_3_3_bit_math_h_l186_c10_df51_return_output;
     -- layer0_node4_MUX[bit_math_h_l62_c3_ffd8] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output := layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_e5a9] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output := layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_3557] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_3557_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output := layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_7d4e] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output := layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_1f40] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output := layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_99fd] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output := layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_626a] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_626a_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output := layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_332b] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_332b_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output := layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_7d4e_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_3557_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_99fd_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_e5a9_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_ffd8_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_626a_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_332b_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_1f40_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_09f9] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output := layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_e68b] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output := layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_81fe] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output := layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_8ec7] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output := layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_09f9_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_8ec7_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_e68b_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_81fe_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_9ba7] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output := layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_db01] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_db01_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output := layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_9ba7_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_db01_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_b427] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_b427_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output := layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_b427_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
