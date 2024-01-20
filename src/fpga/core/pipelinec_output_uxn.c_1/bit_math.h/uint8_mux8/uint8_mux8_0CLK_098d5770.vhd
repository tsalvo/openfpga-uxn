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
-- layer0_node0_MUX[bit_math_h_l18_c3_1a4a]
signal layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_0fe3]
signal layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_bf08]
signal layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_eba5]
signal layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l68_c3_7ca1]
signal layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l79_c3_8bc1]
signal layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l96_c3_4876]
signal layer2_node0_MUX_bit_math_h_l96_c3_4876_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_1a4a
layer0_node0_MUX_bit_math_h_l18_c3_1a4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond,
layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_0fe3
layer0_node1_MUX_bit_math_h_l29_c3_0fe3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond,
layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_bf08
layer0_node2_MUX_bit_math_h_l40_c3_bf08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond,
layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_eba5
layer0_node3_MUX_bit_math_h_l51_c3_eba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond,
layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output);

-- layer1_node0_MUX_bit_math_h_l68_c3_7ca1
layer1_node0_MUX_bit_math_h_l68_c3_7ca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond,
layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue,
layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse,
layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output);

-- layer1_node1_MUX_bit_math_h_l79_c3_8bc1
layer1_node1_MUX_bit_math_h_l79_c3_8bc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond,
layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue,
layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse,
layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output);

-- layer2_node0_MUX_bit_math_h_l96_c3_4876
layer2_node0_MUX_bit_math_h_l96_c3_4876 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l96_c3_4876_cond,
layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue,
layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse,
layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output,
 layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output,
 layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output,
 layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output)
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
 variable VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint3_1_1_bit_math_h_l64_c10_7f1d_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint3_2_2_bit_math_h_l92_c10_a705_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue := VAR_in1;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue := VAR_in7;
     -- uint3_2_2[bit_math_h_l92_c10_a705] LATENCY=0
     VAR_uint3_2_2_bit_math_h_l92_c10_a705_return_output := uint3_2_2(
     VAR_sel);

     -- uint3_0_0[bit_math_h_l14_c10_7369] LATENCY=0
     VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output := uint3_0_0(
     VAR_sel);

     -- uint3_1_1[bit_math_h_l64_c10_7f1d] LATENCY=0
     VAR_uint3_1_1_bit_math_h_l64_c10_7f1d_return_output := uint3_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond := VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond := VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond := VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond := VAR_uint3_0_0_bit_math_h_l14_c10_7369_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond := VAR_uint3_1_1_bit_math_h_l64_c10_7f1d_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond := VAR_uint3_1_1_bit_math_h_l64_c10_7f1d_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_cond := VAR_uint3_2_2_bit_math_h_l92_c10_a705_return_output;
     -- layer0_node0_MUX[bit_math_h_l18_c3_1a4a] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output := layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_eba5] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output := layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_0fe3] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output := layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_bf08] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output := layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_1a4a_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_0fe3_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_bf08_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_eba5_return_output;
     -- layer1_node0_MUX[bit_math_h_l68_c3_7ca1] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_cond;
     layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iftrue;
     layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output := layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output;

     -- layer1_node1_MUX[bit_math_h_l79_c3_8bc1] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_cond;
     layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iftrue;
     layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output := layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse := VAR_layer1_node0_MUX_bit_math_h_l68_c3_7ca1_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue := VAR_layer1_node1_MUX_bit_math_h_l79_c3_8bc1_return_output;
     -- layer2_node0_MUX[bit_math_h_l96_c3_4876] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l96_c3_4876_cond <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_cond;
     layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iftrue;
     layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output := layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_layer2_node0_MUX_bit_math_h_l96_c3_4876_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
