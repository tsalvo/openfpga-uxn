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
-- layer0_node0_MUX[bit_math_h_l18_c3_de19]
signal layer0_node0_MUX_bit_math_h_l18_c3_de19_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_6607]
signal layer0_node1_MUX_bit_math_h_l29_c3_6607_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_e5f9]
signal layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_bee9]
signal layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_1187]
signal layer0_node4_MUX_bit_math_h_l62_c3_1187_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_ee92]
signal layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_c411]
signal layer0_node6_MUX_bit_math_h_l84_c3_c411_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_d716]
signal layer0_node7_MUX_bit_math_h_l95_c3_d716_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_31cd]
signal layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_ebee]
signal layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_a4d1]
signal layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_b86e]
signal layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_e8e2]
signal layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_f4fb]
signal layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_27bc]
signal layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_de19
layer0_node0_MUX_bit_math_h_l18_c3_de19 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_de19_cond,
layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_6607
layer0_node1_MUX_bit_math_h_l29_c3_6607 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_6607_cond,
layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_e5f9
layer0_node2_MUX_bit_math_h_l40_c3_e5f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond,
layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_bee9
layer0_node3_MUX_bit_math_h_l51_c3_bee9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond,
layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_1187
layer0_node4_MUX_bit_math_h_l62_c3_1187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_1187_cond,
layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_ee92
layer0_node5_MUX_bit_math_h_l73_c3_ee92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond,
layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_c411
layer0_node6_MUX_bit_math_h_l84_c3_c411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_c411_cond,
layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_d716
layer0_node7_MUX_bit_math_h_l95_c3_d716 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_d716_cond,
layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_31cd
layer1_node0_MUX_bit_math_h_l112_c3_31cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond,
layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_ebee
layer1_node1_MUX_bit_math_h_l123_c3_ebee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond,
layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_a4d1
layer1_node2_MUX_bit_math_h_l134_c3_a4d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond,
layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_b86e
layer1_node3_MUX_bit_math_h_l145_c3_b86e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond,
layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_e8e2
layer2_node0_MUX_bit_math_h_l162_c3_e8e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond,
layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_f4fb
layer2_node1_MUX_bit_math_h_l173_c3_f4fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond,
layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_27bc
layer3_node0_MUX_bit_math_h_l190_c3_27bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond,
layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_f6d8_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_f63a_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue := VAR_in9;
     -- uint4_3_3[bit_math_h_l186_c10_f63a] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_f63a_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_5cb0] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_f5e0] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_f6d8] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_f6d8_return_output := uint4_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_cond := VAR_uint4_0_0_bit_math_h_l14_c10_f5e0_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond := VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond := VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond := VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond := VAR_uint4_1_1_bit_math_h_l108_c10_5cb0_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond := VAR_uint4_2_2_bit_math_h_l158_c10_f6d8_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond := VAR_uint4_2_2_bit_math_h_l158_c10_f6d8_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond := VAR_uint4_3_3_bit_math_h_l186_c10_f63a_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_e5f9] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output := layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_d716] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_d716_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output := layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_bee9] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output := layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_6607] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_6607_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output := layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_1187] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_1187_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output := layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_de19] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_de19_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output := layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_ee92] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output := layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_c411] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_c411_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output := layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_de19_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_6607_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_e5f9_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_bee9_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_1187_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_ee92_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_c411_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_d716_return_output;
     -- layer1_node3_MUX[bit_math_h_l145_c3_b86e] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output := layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_a4d1] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output := layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_ebee] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output := layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_31cd] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output := layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_31cd_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_ebee_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_a4d1_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_b86e_return_output;
     -- layer2_node0_MUX[bit_math_h_l162_c3_e8e2] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output := layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output;

     -- layer2_node1_MUX[bit_math_h_l173_c3_f4fb] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output := layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_e8e2_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_f4fb_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_27bc] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output := layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_27bc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
