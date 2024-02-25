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
entity VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 is
port(
 ref_toks_0 : in uint8_t_8;
 var_dim_0 : in unsigned(2 downto 0);
 return_output : out unsigned(7 downto 0));
end VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60;
architecture arch of VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_0CLK_814e9c60 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- uint8_mux8[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8]
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel : unsigned(2 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7 : unsigned(7 downto 0);
signal uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output : unsigned(7 downto 0);

function uint3_uint3_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(2 downto 0);
  --variable x : unsigned(2 downto 0);
  variable intermediate : unsigned(2 downto 0);
  variable return_output : unsigned(2 downto 0);

begin

    intermediate := (others => '0');
    intermediate(2 downto 0) := unsigned(inp);
    intermediate(2 downto 0) := x;
    
    return_output := intermediate(2 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8 : entity work.uint8_mux8_0CLK_098d5770 port map (
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7,
uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint8_t_8;
 variable VAR_var_dim_0 : unsigned(2 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_base : uint8_t_8;
 variable VAR_ref_0 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_0_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l14_c10_899c_return_output : unsigned(7 downto 0);
 variable VAR_ref_1 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l16_c10_2ab4_return_output : unsigned(7 downto 0);
 variable VAR_ref_2 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l18_c10_9536_return_output : unsigned(7 downto 0);
 variable VAR_ref_3 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l20_c10_0e92_return_output : unsigned(7 downto 0);
 variable VAR_ref_4 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l22_c10_2b4c_return_output : unsigned(7 downto 0);
 variable VAR_ref_5 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l24_c10_88ae_return_output : unsigned(7 downto 0);
 variable VAR_ref_6 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l26_c10_b537_return_output : unsigned(7 downto 0);
 variable VAR_ref_7 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l28_c10_af92_return_output : unsigned(7 downto 0);
 variable VAR_sel : unsigned(2 downto 0);
 variable VAR_sel_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l31_c2_43c3 : unsigned(2 downto 0);
 variable VAR_uint3_uint3_0_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l32_c8_da63_return_output : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel : unsigned(2 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7 : unsigned(7 downto 0);
 variable VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l31_c2_43c3 := resize(to_unsigned(0, 1), 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_uint8_t_8_0_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l14_c10_899c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_0_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l14_c10_899c_return_output := VAR_ref_toks_0(0);

     -- CONST_REF_RD_uint8_t_uint8_t_8_7_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l28_c10_af92] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l28_c10_af92_return_output := VAR_ref_toks_0(7);

     -- CONST_REF_RD_uint8_t_uint8_t_8_6_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l26_c10_b537] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l26_c10_b537_return_output := VAR_ref_toks_0(6);

     -- CONST_REF_RD_uint8_t_uint8_t_8_5_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l24_c10_88ae] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l24_c10_88ae_return_output := VAR_ref_toks_0(5);

     -- CONST_REF_RD_uint8_t_uint8_t_8_4_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l22_c10_2b4c] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l22_c10_2b4c_return_output := VAR_ref_toks_0(4);

     -- CONST_REF_RD_uint8_t_uint8_t_8_1_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l16_c10_2ab4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l16_c10_2ab4_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint8_t_uint8_t_8_2_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l18_c10_9536] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l18_c10_9536_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint8_t_uint8_t_8_3_d41d[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l20_c10_0e92] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l20_c10_0e92_return_output := VAR_ref_toks_0(3);

     -- uint3_uint3_0[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l32_c8_da63] LATENCY=0
     VAR_uint3_uint3_0_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l32_c8_da63_return_output := uint3_uint3_0(
     VAR_sel_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l31_c2_43c3,
     VAR_var_dim_0);

     -- Submodule level 1
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_0_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l14_c10_899c_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l16_c10_2ab4_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l18_c10_9536_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l20_c10_0e92_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l22_c10_2b4c_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l24_c10_88ae_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l26_c10_b537_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7 := VAR_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l28_c10_af92_return_output;
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel := VAR_uint3_uint3_0_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l32_c8_da63_return_output;
     -- uint8_mux8[VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8] LATENCY=0
     -- Inputs
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_sel;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in0;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in1;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in2;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in3;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in4;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in5;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in6;
     uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7 <= VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_in7;
     -- Outputs
     VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output := uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint8_mux8_VAR_REF_RD_uint8_t_uint8_t_8_VAR_d41d_c_l35_c7_a7a8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
