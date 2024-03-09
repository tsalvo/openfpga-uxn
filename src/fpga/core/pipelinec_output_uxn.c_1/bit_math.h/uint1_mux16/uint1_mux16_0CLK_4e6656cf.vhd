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
-- layer0_node0_MUX[bit_math_h_l18_c3_4c01]
signal layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output : unsigned(0 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_589d]
signal layer0_node1_MUX_bit_math_h_l29_c3_589d_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output : unsigned(0 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_5edd]
signal layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output : unsigned(0 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_2232]
signal layer0_node3_MUX_bit_math_h_l51_c3_2232_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output : unsigned(0 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_aa64]
signal layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output : unsigned(0 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_7c45]
signal layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output : unsigned(0 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_fd49]
signal layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output : unsigned(0 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_dad7]
signal layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output : unsigned(0 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_45ec]
signal layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output : unsigned(0 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_7db1]
signal layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output : unsigned(0 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_183a]
signal layer1_node2_MUX_bit_math_h_l134_c3_183a_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output : unsigned(0 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_1bad]
signal layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output : unsigned(0 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_8fd3]
signal layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output : unsigned(0 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_25b9]
signal layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output : unsigned(0 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_e487]
signal layer3_node0_MUX_bit_math_h_l190_c3_e487_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output : unsigned(0 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_4c01
layer0_node0_MUX_bit_math_h_l18_c3_4c01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond,
layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_589d
layer0_node1_MUX_bit_math_h_l29_c3_589d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_589d_cond,
layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_5edd
layer0_node2_MUX_bit_math_h_l40_c3_5edd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond,
layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_2232
layer0_node3_MUX_bit_math_h_l51_c3_2232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_2232_cond,
layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_aa64
layer0_node4_MUX_bit_math_h_l62_c3_aa64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond,
layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_7c45
layer0_node5_MUX_bit_math_h_l73_c3_7c45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond,
layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_fd49
layer0_node6_MUX_bit_math_h_l84_c3_fd49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond,
layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_dad7
layer0_node7_MUX_bit_math_h_l95_c3_dad7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond,
layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_45ec
layer1_node0_MUX_bit_math_h_l112_c3_45ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond,
layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_7db1
layer1_node1_MUX_bit_math_h_l123_c3_7db1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond,
layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_183a
layer1_node2_MUX_bit_math_h_l134_c3_183a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_183a_cond,
layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_1bad
layer1_node3_MUX_bit_math_h_l145_c3_1bad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond,
layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_8fd3
layer2_node0_MUX_bit_math_h_l162_c3_8fd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond,
layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_25b9
layer2_node1_MUX_bit_math_h_l173_c3_25b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond,
layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_e487
layer3_node0_MUX_bit_math_h_l190_c3_e487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_e487_cond,
layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_08a5_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_36bb_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_36bb] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_36bb_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_63a5] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_ee29] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_08a5] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_08a5_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond := VAR_uint4_0_0_bit_math_h_l14_c10_63a5_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond := VAR_uint4_1_1_bit_math_h_l108_c10_ee29_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond := VAR_uint4_2_2_bit_math_h_l158_c10_08a5_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond := VAR_uint4_2_2_bit_math_h_l158_c10_08a5_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_cond := VAR_uint4_3_3_bit_math_h_l186_c10_36bb_return_output;
     -- layer0_node3_MUX[bit_math_h_l51_c3_2232] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_2232_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output := layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_dad7] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output := layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_7c45] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output := layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_589d] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_589d_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output := layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_fd49] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output := layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_4c01] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output := layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_5edd] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output := layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_aa64] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output := layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_4c01_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_589d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_5edd_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_2232_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_aa64_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_7c45_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_fd49_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_dad7_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_7db1] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output := layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_1bad] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output := layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_45ec] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output := layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_183a] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_183a_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output := layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_45ec_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_7db1_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_183a_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_1bad_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_8fd3] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output := layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_25b9] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output := layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_8fd3_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_25b9_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_e487] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_e487_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output := layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_e487_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
