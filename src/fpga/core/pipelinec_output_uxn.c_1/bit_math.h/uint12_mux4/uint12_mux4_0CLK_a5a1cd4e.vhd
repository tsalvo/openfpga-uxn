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
-- Submodules: 5
entity uint12_mux4_0CLK_a5a1cd4e is
port(
 sel : in unsigned(1 downto 0);
 in0 : in unsigned(11 downto 0);
 in1 : in unsigned(11 downto 0);
 in2 : in unsigned(11 downto 0);
 in3 : in unsigned(11 downto 0);
 return_output : out unsigned(11 downto 0));
end uint12_mux4_0CLK_a5a1cd4e;
architecture arch of uint12_mux4_0CLK_a5a1cd4e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_cc10]
signal layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue : unsigned(11 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse : unsigned(11 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output : unsigned(11 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_6f9a]
signal layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue : unsigned(11 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse : unsigned(11 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output : unsigned(11 downto 0);

-- layer1_node0_MUX[bit_math_h_l46_c3_e31c]
signal layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue : unsigned(11 downto 0);
signal layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse : unsigned(11 downto 0);
signal layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output : unsigned(11 downto 0);

function uint2_0_0( x : unsigned) return unsigned is
--variable x : unsigned(1 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint2_1_1( x : unsigned) return unsigned is
--variable x : unsigned(1 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_cc10
layer0_node0_MUX_bit_math_h_l18_c3_cc10 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond,
layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_6f9a
layer0_node1_MUX_bit_math_h_l29_c3_6f9a : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond,
layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output);

-- layer1_node0_MUX_bit_math_h_l46_c3_e31c
layer1_node0_MUX_bit_math_h_l46_c3_e31c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond,
layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue,
layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse,
layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output,
 layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(11 downto 0);
 variable VAR_sel : unsigned(1 downto 0);
 variable VAR_in0 : unsigned(11 downto 0);
 variable VAR_in1 : unsigned(11 downto 0);
 variable VAR_in2 : unsigned(11 downto 0);
 variable VAR_in3 : unsigned(11 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint2_0_0_bit_math_h_l14_c10_e654_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(11 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue : unsigned(11 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse : unsigned(11 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output : unsigned(11 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(11 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue : unsigned(11 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse : unsigned(11 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output : unsigned(11 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint2_1_1_bit_math_h_l42_c10_d709_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(11 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue : unsigned(11 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse : unsigned(11 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output : unsigned(11 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond : unsigned(0 downto 0);
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

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue := VAR_in1;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue := VAR_in3;
     -- uint2_0_0[bit_math_h_l14_c10_e654] LATENCY=0
     VAR_uint2_0_0_bit_math_h_l14_c10_e654_return_output := uint2_0_0(
     VAR_sel);

     -- uint2_1_1[bit_math_h_l42_c10_d709] LATENCY=0
     VAR_uint2_1_1_bit_math_h_l42_c10_d709_return_output := uint2_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond := VAR_uint2_0_0_bit_math_h_l14_c10_e654_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond := VAR_uint2_0_0_bit_math_h_l14_c10_e654_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond := VAR_uint2_1_1_bit_math_h_l42_c10_d709_return_output;
     -- layer0_node1_MUX[bit_math_h_l29_c3_6f9a] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output := layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_cc10] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output := layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_cc10_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_6f9a_return_output;
     -- layer1_node0_MUX[bit_math_h_l46_c3_e31c] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond <= VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_cond;
     layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iftrue;
     layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output := layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_layer1_node0_MUX_bit_math_h_l46_c3_e31c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
