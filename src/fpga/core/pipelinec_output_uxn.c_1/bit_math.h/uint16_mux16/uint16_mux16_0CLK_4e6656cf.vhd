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
-- layer0_node0_MUX[bit_math_h_l18_c3_73ea]
signal layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse : unsigned(15 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output : unsigned(15 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_31ea]
signal layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse : unsigned(15 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output : unsigned(15 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_aebe]
signal layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse : unsigned(15 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output : unsigned(15 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_3b7c]
signal layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse : unsigned(15 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output : unsigned(15 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_b3d6]
signal layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse : unsigned(15 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output : unsigned(15 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_1a50]
signal layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse : unsigned(15 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output : unsigned(15 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_4404]
signal layer0_node6_MUX_bit_math_h_l84_c3_4404_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse : unsigned(15 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output : unsigned(15 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_e33e]
signal layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse : unsigned(15 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output : unsigned(15 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_8aa4]
signal layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse : unsigned(15 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output : unsigned(15 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_63b0]
signal layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse : unsigned(15 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output : unsigned(15 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_70fc]
signal layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse : unsigned(15 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output : unsigned(15 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_d7e0]
signal layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse : unsigned(15 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output : unsigned(15 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_cdd4]
signal layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse : unsigned(15 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output : unsigned(15 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_90d9]
signal layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse : unsigned(15 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output : unsigned(15 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_8636]
signal layer3_node0_MUX_bit_math_h_l190_c3_8636_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse : unsigned(15 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output : unsigned(15 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_73ea
layer0_node0_MUX_bit_math_h_l18_c3_73ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond,
layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_31ea
layer0_node1_MUX_bit_math_h_l29_c3_31ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond,
layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_aebe
layer0_node2_MUX_bit_math_h_l40_c3_aebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond,
layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_3b7c
layer0_node3_MUX_bit_math_h_l51_c3_3b7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond,
layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_b3d6
layer0_node4_MUX_bit_math_h_l62_c3_b3d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond,
layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_1a50
layer0_node5_MUX_bit_math_h_l73_c3_1a50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond,
layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_4404
layer0_node6_MUX_bit_math_h_l84_c3_4404 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_4404_cond,
layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_e33e
layer0_node7_MUX_bit_math_h_l95_c3_e33e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond,
layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_8aa4
layer1_node0_MUX_bit_math_h_l112_c3_8aa4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond,
layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_63b0
layer1_node1_MUX_bit_math_h_l123_c3_63b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond,
layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_70fc
layer1_node2_MUX_bit_math_h_l134_c3_70fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond,
layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_d7e0
layer1_node3_MUX_bit_math_h_l145_c3_d7e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond,
layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_cdd4
layer2_node0_MUX_bit_math_h_l162_c3_cdd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond,
layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_90d9
layer2_node1_MUX_bit_math_h_l173_c3_90d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond,
layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_8636
layer3_node0_MUX_bit_math_h_l190_c3_8636 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_8636_cond,
layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output)
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
 variable VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output : unsigned(15 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output : unsigned(15 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_73fa_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output : unsigned(15 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_999c_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output : unsigned(15 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue := VAR_in9;
     -- uint4_2_2[bit_math_h_l158_c10_73fa] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_73fa_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_0_0[bit_math_h_l14_c10_d26a] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_8705] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output := uint4_1_1(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_999c] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_999c_return_output := uint4_3_3(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond := VAR_uint4_0_0_bit_math_h_l14_c10_d26a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond := VAR_uint4_1_1_bit_math_h_l108_c10_8705_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond := VAR_uint4_2_2_bit_math_h_l158_c10_73fa_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond := VAR_uint4_2_2_bit_math_h_l158_c10_73fa_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_cond := VAR_uint4_3_3_bit_math_h_l186_c10_999c_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_aebe] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output := layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_b3d6] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output := layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_3b7c] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output := layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_4404] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_4404_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output := layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_73ea] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output := layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output;

     -- layer0_node5_MUX[bit_math_h_l73_c3_1a50] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output := layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_e33e] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output := layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_31ea] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output := layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_73ea_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_31ea_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_aebe_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_3b7c_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_b3d6_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_1a50_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_4404_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_e33e_return_output;
     -- layer1_node0_MUX[bit_math_h_l112_c3_8aa4] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output := layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_d7e0] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output := layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output;

     -- layer1_node2_MUX[bit_math_h_l134_c3_70fc] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output := layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_63b0] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output := layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_8aa4_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_63b0_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_70fc_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_d7e0_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_90d9] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output := layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_cdd4] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output := layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_cdd4_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_90d9_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_8636] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_8636_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output := layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_8636_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
