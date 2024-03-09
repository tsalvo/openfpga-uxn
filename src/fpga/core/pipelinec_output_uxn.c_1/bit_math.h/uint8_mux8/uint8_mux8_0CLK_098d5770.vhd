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
-- Submodules: 10
entity uint8_mux8_0CLK_098d5770 is
port(
 sel : in unsigned(2 downto 0);
 in0 : in unsigned(7 downto 0);
 in1 : in unsigned(7 downto 0);
 in2 : in unsigned(7 downto 0);
 in3 : in unsigned(7 downto 0);
 in4 : in unsigned(7 downto 0);
 in5 : in unsigned(7 downto 0);
 in6 : in unsigned(7 downto 0);
 in7 : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end uint8_mux8_0CLK_098d5770;
architecture arch of uint8_mux8_0CLK_098d5770 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_22b6]
signal layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_663a]
signal layer0_node1_MUX_bit_math_h_l29_c3_663a_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_5bc7]
signal layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_946c]
signal layer0_node3_MUX_bit_math_h_l51_c3_946c_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l68_c3_003e]
signal layer1_node0_MUX_bit_math_h_l68_c3_003e_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l79_c3_803c]
signal layer1_node1_MUX_bit_math_h_l79_c3_803c_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l96_c3_d055]
signal layer2_node0_MUX_bit_math_h_l96_c3_d055_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output : unsigned(7 downto 0);

function uint3_0_0( x : unsigned) return unsigned is
--variable x : unsigned(2 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint3_1_1( x : unsigned) return unsigned is
--variable x : unsigned(2 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint3_2_2( x : unsigned) return unsigned is
--variable x : unsigned(2 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_22b6
layer0_node0_MUX_bit_math_h_l18_c3_22b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond,
layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_663a
layer0_node1_MUX_bit_math_h_l29_c3_663a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_663a_cond,
layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_5bc7
layer0_node2_MUX_bit_math_h_l40_c3_5bc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond,
layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_946c
layer0_node3_MUX_bit_math_h_l51_c3_946c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_946c_cond,
layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output);

-- layer1_node0_MUX_bit_math_h_l68_c3_003e
layer1_node0_MUX_bit_math_h_l68_c3_003e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l68_c3_003e_cond,
layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue,
layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse,
layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output);

-- layer1_node1_MUX_bit_math_h_l79_c3_803c
layer1_node1_MUX_bit_math_h_l79_c3_803c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l79_c3_803c_cond,
layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue,
layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse,
layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output);

-- layer2_node0_MUX_bit_math_h_l96_c3_d055
layer2_node0_MUX_bit_math_h_l96_c3_d055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l96_c3_d055_cond,
layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue,
layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse,
layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output);



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
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output,
 layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output,
 layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output,
 layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_sel : unsigned(2 downto 0);
 variable VAR_in0 : unsigned(7 downto 0);
 variable VAR_in1 : unsigned(7 downto 0);
 variable VAR_in2 : unsigned(7 downto 0);
 variable VAR_in3 : unsigned(7 downto 0);
 variable VAR_in4 : unsigned(7 downto 0);
 variable VAR_in5 : unsigned(7 downto 0);
 variable VAR_in6 : unsigned(7 downto 0);
 variable VAR_in7 : unsigned(7 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint3_1_1_bit_math_h_l64_c10_ea5e_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint3_2_2_bit_math_h_l92_c10_006f_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_cond : unsigned(0 downto 0);
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

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue := VAR_in1;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue := VAR_in7;
     -- uint3_0_0[bit_math_h_l14_c10_589a] LATENCY=0
     VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output := uint3_0_0(
     VAR_sel);

     -- uint3_2_2[bit_math_h_l92_c10_006f] LATENCY=0
     VAR_uint3_2_2_bit_math_h_l92_c10_006f_return_output := uint3_2_2(
     VAR_sel);

     -- uint3_1_1[bit_math_h_l64_c10_ea5e] LATENCY=0
     VAR_uint3_1_1_bit_math_h_l64_c10_ea5e_return_output := uint3_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond := VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_cond := VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond := VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_cond := VAR_uint3_0_0_bit_math_h_l14_c10_589a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_cond := VAR_uint3_1_1_bit_math_h_l64_c10_ea5e_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_cond := VAR_uint3_1_1_bit_math_h_l64_c10_ea5e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_cond := VAR_uint3_2_2_bit_math_h_l92_c10_006f_return_output;
     -- layer0_node1_MUX[bit_math_h_l29_c3_663a] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_663a_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output := layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_22b6] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output := layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_946c] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_946c_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output := layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_5bc7] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output := layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_22b6_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_663a_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_5bc7_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_946c_return_output;
     -- layer1_node0_MUX[bit_math_h_l68_c3_003e] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l68_c3_003e_cond <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_cond;
     layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iftrue;
     layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output := layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output;

     -- layer1_node1_MUX[bit_math_h_l79_c3_803c] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l79_c3_803c_cond <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_cond;
     layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iftrue;
     layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output := layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse := VAR_layer1_node0_MUX_bit_math_h_l68_c3_003e_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue := VAR_layer1_node1_MUX_bit_math_h_l79_c3_803c_return_output;
     -- layer2_node0_MUX[bit_math_h_l96_c3_d055] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l96_c3_d055_cond <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_cond;
     layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iftrue;
     layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output := layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_layer2_node0_MUX_bit_math_h_l96_c3_d055_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
