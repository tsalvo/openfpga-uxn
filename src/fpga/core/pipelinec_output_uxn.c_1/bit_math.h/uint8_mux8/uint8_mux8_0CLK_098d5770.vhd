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
-- layer0_node0_MUX[bit_math_h_l18_c3_95a7]
signal layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_2c24]
signal layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_8cf2]
signal layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_6dc0]
signal layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l68_c3_880f]
signal layer1_node0_MUX_bit_math_h_l68_c3_880f_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l79_c3_e22d]
signal layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l96_c3_c110]
signal layer2_node0_MUX_bit_math_h_l96_c3_c110_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_95a7
layer0_node0_MUX_bit_math_h_l18_c3_95a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond,
layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_2c24
layer0_node1_MUX_bit_math_h_l29_c3_2c24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond,
layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_8cf2
layer0_node2_MUX_bit_math_h_l40_c3_8cf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond,
layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_6dc0
layer0_node3_MUX_bit_math_h_l51_c3_6dc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond,
layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output);

-- layer1_node0_MUX_bit_math_h_l68_c3_880f
layer1_node0_MUX_bit_math_h_l68_c3_880f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l68_c3_880f_cond,
layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue,
layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse,
layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output);

-- layer1_node1_MUX_bit_math_h_l79_c3_e22d
layer1_node1_MUX_bit_math_h_l79_c3_e22d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond,
layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue,
layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse,
layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output);

-- layer2_node0_MUX_bit_math_h_l96_c3_c110
layer2_node0_MUX_bit_math_h_l96_c3_c110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l96_c3_c110_cond,
layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue,
layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse,
layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output,
 layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output,
 layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output,
 layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output)
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
 variable VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint3_1_1_bit_math_h_l64_c10_92c2_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint3_2_2_bit_math_h_l92_c10_59cf_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue := VAR_in1;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue := VAR_in7;
     -- uint3_0_0[bit_math_h_l14_c10_1819] LATENCY=0
     VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output := uint3_0_0(
     VAR_sel);

     -- uint3_1_1[bit_math_h_l64_c10_92c2] LATENCY=0
     VAR_uint3_1_1_bit_math_h_l64_c10_92c2_return_output := uint3_1_1(
     VAR_sel);

     -- uint3_2_2[bit_math_h_l92_c10_59cf] LATENCY=0
     VAR_uint3_2_2_bit_math_h_l92_c10_59cf_return_output := uint3_2_2(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond := VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond := VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond := VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond := VAR_uint3_0_0_bit_math_h_l14_c10_1819_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_cond := VAR_uint3_1_1_bit_math_h_l64_c10_92c2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond := VAR_uint3_1_1_bit_math_h_l64_c10_92c2_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_cond := VAR_uint3_2_2_bit_math_h_l92_c10_59cf_return_output;
     -- layer0_node2_MUX[bit_math_h_l40_c3_8cf2] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output := layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_95a7] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output := layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_2c24] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output := layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_6dc0] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output := layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_95a7_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_2c24_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_8cf2_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_6dc0_return_output;
     -- layer1_node0_MUX[bit_math_h_l68_c3_880f] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l68_c3_880f_cond <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_cond;
     layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iftrue;
     layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output := layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output;

     -- layer1_node1_MUX[bit_math_h_l79_c3_e22d] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_cond;
     layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iftrue;
     layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output := layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse := VAR_layer1_node0_MUX_bit_math_h_l68_c3_880f_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue := VAR_layer1_node1_MUX_bit_math_h_l79_c3_e22d_return_output;
     -- layer2_node0_MUX[bit_math_h_l96_c3_c110] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l96_c3_c110_cond <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_cond;
     layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iftrue;
     layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output := layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_layer2_node0_MUX_bit_math_h_l96_c3_c110_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
