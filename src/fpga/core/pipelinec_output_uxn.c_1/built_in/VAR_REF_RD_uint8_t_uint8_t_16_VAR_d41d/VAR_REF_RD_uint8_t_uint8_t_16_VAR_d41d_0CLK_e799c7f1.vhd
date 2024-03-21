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
entity VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 is
port(
 ref_toks_0 : in uint8_t_16;
 var_dim_0 : in unsigned(3 downto 0);
 return_output : out unsigned(7 downto 0));
end VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1;
architecture arch of VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_0CLK_e799c7f1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- uint8_mux16[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4]
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel : unsigned(3 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15 : unsigned(7 downto 0);
signal uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output : unsigned(7 downto 0);

function uint4_uint4_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(3 downto 0);
  --variable x : unsigned(3 downto 0);
  variable intermediate : unsigned(3 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

    intermediate := (others => '0');
    intermediate(3 downto 0) := unsigned(inp);
    intermediate(3 downto 0) := x;
    
    return_output := intermediate(3 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4 : entity work.uint8_mux16_0CLK_4e6656cf port map (
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15,
uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint8_t_16;
 variable VAR_var_dim_0 : unsigned(3 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_base : uint8_t_16;
 variable VAR_ref_0 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_0_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l14_c10_002d_return_output : unsigned(7 downto 0);
 variable VAR_ref_1 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_1_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l16_c10_3c5a_return_output : unsigned(7 downto 0);
 variable VAR_ref_2 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_2_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l18_c10_3485_return_output : unsigned(7 downto 0);
 variable VAR_ref_3 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_3_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l20_c10_58cc_return_output : unsigned(7 downto 0);
 variable VAR_ref_4 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_4_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l22_c10_9e56_return_output : unsigned(7 downto 0);
 variable VAR_ref_5 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_5_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l24_c10_37e6_return_output : unsigned(7 downto 0);
 variable VAR_ref_6 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_6_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l26_c10_72d1_return_output : unsigned(7 downto 0);
 variable VAR_ref_7 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_7_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l28_c10_1902_return_output : unsigned(7 downto 0);
 variable VAR_ref_8 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_8_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l30_c10_0d79_return_output : unsigned(7 downto 0);
 variable VAR_ref_9 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_9_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l32_c10_aa65_return_output : unsigned(7 downto 0);
 variable VAR_ref_10 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_10_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l34_c11_fec3_return_output : unsigned(7 downto 0);
 variable VAR_ref_11 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_11_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l36_c11_206a_return_output : unsigned(7 downto 0);
 variable VAR_ref_12 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_12_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l38_c11_0056_return_output : unsigned(7 downto 0);
 variable VAR_ref_13 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_13_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l40_c11_e36b_return_output : unsigned(7 downto 0);
 variable VAR_ref_14 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_14_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l42_c11_6625_return_output : unsigned(7 downto 0);
 variable VAR_ref_15 : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_16_15_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l44_c11_21f4_return_output : unsigned(7 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_sel_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l47_c2_5e0e : unsigned(3 downto 0);
 variable VAR_uint4_uint4_0_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l48_c8_6b44_return_output : unsigned(3 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel : unsigned(3 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15 : unsigned(7 downto 0);
 variable VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l47_c2_5e0e := resize(to_unsigned(0, 1), 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_uint8_t_16_7_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l28_c10_1902] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_7_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l28_c10_1902_return_output := VAR_ref_toks_0(7);

     -- CONST_REF_RD_uint8_t_uint8_t_16_13_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l40_c11_e36b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_13_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l40_c11_e36b_return_output := VAR_ref_toks_0(13);

     -- CONST_REF_RD_uint8_t_uint8_t_16_6_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l26_c10_72d1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_6_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l26_c10_72d1_return_output := VAR_ref_toks_0(6);

     -- CONST_REF_RD_uint8_t_uint8_t_16_11_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l36_c11_206a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_11_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l36_c11_206a_return_output := VAR_ref_toks_0(11);

     -- CONST_REF_RD_uint8_t_uint8_t_16_14_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l42_c11_6625] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_14_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l42_c11_6625_return_output := VAR_ref_toks_0(14);

     -- CONST_REF_RD_uint8_t_uint8_t_16_9_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l32_c10_aa65] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_9_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l32_c10_aa65_return_output := VAR_ref_toks_0(9);

     -- CONST_REF_RD_uint8_t_uint8_t_16_12_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l38_c11_0056] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_12_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l38_c11_0056_return_output := VAR_ref_toks_0(12);

     -- uint4_uint4_0[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l48_c8_6b44] LATENCY=0
     VAR_uint4_uint4_0_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l48_c8_6b44_return_output := uint4_uint4_0(
     VAR_sel_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l47_c2_5e0e,
     VAR_var_dim_0);

     -- CONST_REF_RD_uint8_t_uint8_t_16_0_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l14_c10_002d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_0_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l14_c10_002d_return_output := VAR_ref_toks_0(0);

     -- CONST_REF_RD_uint8_t_uint8_t_16_8_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l30_c10_0d79] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_8_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l30_c10_0d79_return_output := VAR_ref_toks_0(8);

     -- CONST_REF_RD_uint8_t_uint8_t_16_15_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l44_c11_21f4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_15_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l44_c11_21f4_return_output := VAR_ref_toks_0(15);

     -- CONST_REF_RD_uint8_t_uint8_t_16_5_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l24_c10_37e6] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_5_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l24_c10_37e6_return_output := VAR_ref_toks_0(5);

     -- CONST_REF_RD_uint8_t_uint8_t_16_1_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l16_c10_3c5a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_1_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l16_c10_3c5a_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint8_t_uint8_t_16_3_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l20_c10_58cc] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_3_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l20_c10_58cc_return_output := VAR_ref_toks_0(3);

     -- CONST_REF_RD_uint8_t_uint8_t_16_2_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l18_c10_3485] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_2_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l18_c10_3485_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint8_t_uint8_t_16_10_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l34_c11_fec3] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_10_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l34_c11_fec3_return_output := VAR_ref_toks_0(10);

     -- CONST_REF_RD_uint8_t_uint8_t_16_4_d41d[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l22_c10_9e56] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_16_4_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l22_c10_9e56_return_output := VAR_ref_toks_0(4);

     -- Submodule level 1
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_0_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l14_c10_002d_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_10_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l34_c11_fec3_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_11_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l36_c11_206a_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_12_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l38_c11_0056_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_13_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l40_c11_e36b_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_14_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l42_c11_6625_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_15_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l44_c11_21f4_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_1_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l16_c10_3c5a_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_2_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l18_c10_3485_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_3_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l20_c10_58cc_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_4_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l22_c10_9e56_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_5_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l24_c10_37e6_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_6_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l26_c10_72d1_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_7_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l28_c10_1902_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_8_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l30_c10_0d79_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9 := VAR_CONST_REF_RD_uint8_t_uint8_t_16_9_d41d_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l32_c10_aa65_return_output;
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel := VAR_uint4_uint4_0_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l48_c8_6b44_return_output;
     -- uint8_mux16[VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4] LATENCY=0
     -- Inputs
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_sel;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in0;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in1;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in2;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in3;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in4;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in5;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in6;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in7;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in8;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in9;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in10;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in11;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in12;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in13;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in14;
     uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15 <= VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_in15;
     -- Outputs
     VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output := uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint8_mux16_VAR_REF_RD_uint8_t_uint8_t_16_VAR_d41d_c_l51_c7_e7e4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
