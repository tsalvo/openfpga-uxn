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
-- layer0_node0_MUX[bit_math_h_l18_c3_acd3]
signal layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_188f]
signal layer0_node1_MUX_bit_math_h_l29_c3_188f_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_d9b5]
signal layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_8b21]
signal layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_978c]
signal layer0_node4_MUX_bit_math_h_l62_c3_978c_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_f94e]
signal layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_11cf]
signal layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_759c]
signal layer0_node7_MUX_bit_math_h_l95_c3_759c_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_1315]
signal layer1_node0_MUX_bit_math_h_l112_c3_1315_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_82e5]
signal layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_32bd]
signal layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_98a5]
signal layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_6c8a]
signal layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_fa27]
signal layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_14ce]
signal layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_acd3
layer0_node0_MUX_bit_math_h_l18_c3_acd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond,
layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_188f
layer0_node1_MUX_bit_math_h_l29_c3_188f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_188f_cond,
layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_d9b5
layer0_node2_MUX_bit_math_h_l40_c3_d9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond,
layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_8b21
layer0_node3_MUX_bit_math_h_l51_c3_8b21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond,
layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_978c
layer0_node4_MUX_bit_math_h_l62_c3_978c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_978c_cond,
layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_f94e
layer0_node5_MUX_bit_math_h_l73_c3_f94e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond,
layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_11cf
layer0_node6_MUX_bit_math_h_l84_c3_11cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond,
layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_759c
layer0_node7_MUX_bit_math_h_l95_c3_759c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_759c_cond,
layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_1315
layer1_node0_MUX_bit_math_h_l112_c3_1315 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_1315_cond,
layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_82e5
layer1_node1_MUX_bit_math_h_l123_c3_82e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond,
layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_32bd
layer1_node2_MUX_bit_math_h_l134_c3_32bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond,
layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_98a5
layer1_node3_MUX_bit_math_h_l145_c3_98a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond,
layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_6c8a
layer2_node0_MUX_bit_math_h_l162_c3_6c8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond,
layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_fa27
layer2_node1_MUX_bit_math_h_l173_c3_fa27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond,
layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_14ce
layer3_node0_MUX_bit_math_h_l190_c3_14ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond,
layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_c26f_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_7630_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_4ccb] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_c26f] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_c26f_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_7630] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_7630_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_be59] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_4ccb_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_cond := VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond := VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond := VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond := VAR_uint4_1_1_bit_math_h_l108_c10_be59_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c26f_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond := VAR_uint4_2_2_bit_math_h_l158_c10_c26f_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond := VAR_uint4_3_3_bit_math_h_l186_c10_7630_return_output;
     -- layer0_node1_MUX[bit_math_h_l29_c3_188f] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_188f_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output := layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_8b21] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output := layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_f94e] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output := layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_978c] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_978c_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output := layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_759c] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_759c_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output := layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_d9b5] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output := layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_acd3] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output := layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_11cf] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output := layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_acd3_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_188f_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_d9b5_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_8b21_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_978c_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_f94e_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_11cf_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_759c_return_output;
     -- layer1_node1_MUX[bit_math_h_l123_c3_82e5] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output := layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_1315] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_1315_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output := layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_32bd] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output := layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_98a5] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output := layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_1315_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_82e5_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_32bd_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_98a5_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_fa27] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output := layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_6c8a] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output := layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_6c8a_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_fa27_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_14ce] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output := layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_14ce_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
