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
-- layer0_node0_MUX[bit_math_h_l18_c3_19ce]
signal layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse : unsigned(7 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output : unsigned(7 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_1a64]
signal layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse : unsigned(7 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output : unsigned(7 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_b511]
signal layer0_node2_MUX_bit_math_h_l40_c3_b511_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse : unsigned(7 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output : unsigned(7 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_bd72]
signal layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse : unsigned(7 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output : unsigned(7 downto 0);

-- layer1_node0_MUX[bit_math_h_l68_c3_5628]
signal layer1_node0_MUX_bit_math_h_l68_c3_5628_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse : unsigned(7 downto 0);
signal layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output : unsigned(7 downto 0);

-- layer1_node1_MUX[bit_math_h_l79_c3_fd10]
signal layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse : unsigned(7 downto 0);
signal layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output : unsigned(7 downto 0);

-- layer2_node0_MUX[bit_math_h_l96_c3_f978]
signal layer2_node0_MUX_bit_math_h_l96_c3_f978_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse : unsigned(7 downto 0);
signal layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output : unsigned(7 downto 0);

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
-- layer0_node0_MUX_bit_math_h_l18_c3_19ce
layer0_node0_MUX_bit_math_h_l18_c3_19ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond,
layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_1a64
layer0_node1_MUX_bit_math_h_l29_c3_1a64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond,
layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_b511
layer0_node2_MUX_bit_math_h_l40_c3_b511 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_b511_cond,
layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_bd72
layer0_node3_MUX_bit_math_h_l51_c3_bd72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond,
layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output);

-- layer1_node0_MUX_bit_math_h_l68_c3_5628
layer1_node0_MUX_bit_math_h_l68_c3_5628 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l68_c3_5628_cond,
layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue,
layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse,
layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output);

-- layer1_node1_MUX_bit_math_h_l79_c3_fd10
layer1_node1_MUX_bit_math_h_l79_c3_fd10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond,
layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue,
layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse,
layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output);

-- layer2_node0_MUX_bit_math_h_l96_c3_f978
layer2_node0_MUX_bit_math_h_l96_c3_f978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l96_c3_f978_cond,
layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue,
layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse,
layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output);



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
 layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output,
 layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output,
 layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output,
 layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output)
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
 variable VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output : unsigned(7 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint3_1_1_bit_math_h_l64_c10_f5ab_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output : unsigned(7 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint3_2_2_bit_math_h_l92_c10_95fd_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output : unsigned(7 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_cond : unsigned(0 downto 0);
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
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue := VAR_in1;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue := VAR_in7;
     -- uint3_1_1[bit_math_h_l64_c10_f5ab] LATENCY=0
     VAR_uint3_1_1_bit_math_h_l64_c10_f5ab_return_output := uint3_1_1(
     VAR_sel);

     -- uint3_2_2[bit_math_h_l92_c10_95fd] LATENCY=0
     VAR_uint3_2_2_bit_math_h_l92_c10_95fd_return_output := uint3_2_2(
     VAR_sel);

     -- uint3_0_0[bit_math_h_l14_c10_8e99] LATENCY=0
     VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output := uint3_0_0(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond := VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond := VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_cond := VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond := VAR_uint3_0_0_bit_math_h_l14_c10_8e99_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_cond := VAR_uint3_1_1_bit_math_h_l64_c10_f5ab_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond := VAR_uint3_1_1_bit_math_h_l64_c10_f5ab_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_cond := VAR_uint3_2_2_bit_math_h_l92_c10_95fd_return_output;
     -- layer0_node3_MUX[bit_math_h_l51_c3_bd72] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output := layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_b511] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_b511_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output := layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_1a64] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output := layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_19ce] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output := layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_19ce_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_1a64_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_b511_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_bd72_return_output;
     -- layer1_node1_MUX[bit_math_h_l79_c3_fd10] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_cond;
     layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iftrue;
     layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output := layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output;

     -- layer1_node0_MUX[bit_math_h_l68_c3_5628] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l68_c3_5628_cond <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_cond;
     layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iftrue;
     layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output := layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse := VAR_layer1_node0_MUX_bit_math_h_l68_c3_5628_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue := VAR_layer1_node1_MUX_bit_math_h_l79_c3_fd10_return_output;
     -- layer2_node0_MUX[bit_math_h_l96_c3_f978] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l96_c3_f978_cond <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_cond;
     layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iftrue;
     layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output := layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_layer2_node0_MUX_bit_math_h_l96_c3_f978_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
