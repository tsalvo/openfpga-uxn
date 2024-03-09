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
-- Submodules: 2
entity VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 is
port(
 ref_toks_0 : in uint12_t_4;
 var_dim_0 : in unsigned(1 downto 0);
 return_output : out unsigned(11 downto 0));
end VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46;
architecture arch of VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_0CLK_9e40ec46 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- uint12_mux4[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed]
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel : unsigned(1 downto 0);
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0 : unsigned(11 downto 0);
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1 : unsigned(11 downto 0);
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2 : unsigned(11 downto 0);
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3 : unsigned(11 downto 0);
signal uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output : unsigned(11 downto 0);

function uint2_uint2_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(1 downto 0);
  --variable x : unsigned(1 downto 0);
  variable intermediate : unsigned(1 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

    intermediate := (others => '0');
    intermediate(1 downto 0) := unsigned(inp);
    intermediate(1 downto 0) := x;
    
    return_output := intermediate(1 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed : entity work.uint12_mux4_0CLK_a5a1cd4e port map (
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel,
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0,
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1,
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2,
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3,
uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint12_t_4;
 variable VAR_var_dim_0 : unsigned(1 downto 0);
 variable VAR_return_output : unsigned(11 downto 0);
 variable VAR_base : uint12_t_4;
 variable VAR_ref_0 : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l14_c10_221b_return_output : unsigned(11 downto 0);
 variable VAR_ref_1 : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l16_c10_5b3e_return_output : unsigned(11 downto 0);
 variable VAR_ref_2 : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l18_c10_8c89_return_output : unsigned(11 downto 0);
 variable VAR_ref_3 : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l20_c10_2577_return_output : unsigned(11 downto 0);
 variable VAR_sel : unsigned(1 downto 0);
 variable VAR_sel_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l23_c2_766b : unsigned(1 downto 0);
 variable VAR_uint2_uint2_0_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l24_c8_0116_return_output : unsigned(1 downto 0);
 variable VAR_rv : unsigned(11 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel : unsigned(1 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0 : unsigned(11 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1 : unsigned(11 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2 : unsigned(11 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3 : unsigned(11 downto 0);
 variable VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output : unsigned(11 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l23_c2_766b := resize(to_unsigned(0, 1), 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint12_t_uint12_t_4_3_d41d[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l20_c10_2577] LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l20_c10_2577_return_output := VAR_ref_toks_0(3);

     -- uint2_uint2_0[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l24_c8_0116] LATENCY=0
     VAR_uint2_uint2_0_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l24_c8_0116_return_output := uint2_uint2_0(
     VAR_sel_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l23_c2_766b,
     VAR_var_dim_0);

     -- CONST_REF_RD_uint12_t_uint12_t_4_2_d41d[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l18_c10_8c89] LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l18_c10_8c89_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint12_t_uint12_t_4_1_d41d[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l16_c10_5b3e] LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l16_c10_5b3e_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint12_t_uint12_t_4_0_d41d[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l14_c10_221b] LATENCY=0
     VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l14_c10_221b_return_output := VAR_ref_toks_0(0);

     -- Submodule level 1
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0 := VAR_CONST_REF_RD_uint12_t_uint12_t_4_0_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l14_c10_221b_return_output;
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1 := VAR_CONST_REF_RD_uint12_t_uint12_t_4_1_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l16_c10_5b3e_return_output;
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2 := VAR_CONST_REF_RD_uint12_t_uint12_t_4_2_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l18_c10_8c89_return_output;
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3 := VAR_CONST_REF_RD_uint12_t_uint12_t_4_3_d41d_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l20_c10_2577_return_output;
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel := VAR_uint2_uint2_0_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l24_c8_0116_return_output;
     -- uint12_mux4[VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed] LATENCY=0
     -- Inputs
     uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel <= VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_sel;
     uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0 <= VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in0;
     uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1 <= VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in1;
     uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2 <= VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in2;
     uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3 <= VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_in3;
     -- Outputs
     VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output := uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint12_mux4_VAR_REF_RD_uint12_t_uint12_t_4_VAR_d41d_c_l27_c7_feed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
