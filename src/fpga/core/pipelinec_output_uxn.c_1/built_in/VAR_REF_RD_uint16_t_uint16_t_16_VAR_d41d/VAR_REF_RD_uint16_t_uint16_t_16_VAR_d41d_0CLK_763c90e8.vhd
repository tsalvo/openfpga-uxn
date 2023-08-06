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
entity VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 is
port(
 ref_toks_0 : in uint16_t_16;
 var_dim_0 : in unsigned(3 downto 0);
 return_output : out unsigned(15 downto 0));
end VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8;
architecture arch of VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- uint16_mux16[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f]
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel : unsigned(3 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15 : unsigned(15 downto 0);
signal uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output : unsigned(15 downto 0);

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
-- uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f : entity work.uint16_mux16_0CLK_4e6656cf port map (
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15,
uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint16_t_16;
 variable VAR_var_dim_0 : unsigned(3 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_base : uint16_t_16;
 variable VAR_ref_0 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_0_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l14_c10_94a9_return_output : unsigned(15 downto 0);
 variable VAR_ref_1 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_1_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l16_c10_1fe9_return_output : unsigned(15 downto 0);
 variable VAR_ref_2 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_2_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l18_c10_fab9_return_output : unsigned(15 downto 0);
 variable VAR_ref_3 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_3_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l20_c10_4d0f_return_output : unsigned(15 downto 0);
 variable VAR_ref_4 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_4_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l22_c10_b272_return_output : unsigned(15 downto 0);
 variable VAR_ref_5 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_5_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l24_c10_943d_return_output : unsigned(15 downto 0);
 variable VAR_ref_6 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_6_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l26_c10_b70c_return_output : unsigned(15 downto 0);
 variable VAR_ref_7 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_7_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l28_c10_a58e_return_output : unsigned(15 downto 0);
 variable VAR_ref_8 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_8_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l30_c10_bc7d_return_output : unsigned(15 downto 0);
 variable VAR_ref_9 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_9_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l32_c10_f6cb_return_output : unsigned(15 downto 0);
 variable VAR_ref_10 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_10_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l34_c11_9d55_return_output : unsigned(15 downto 0);
 variable VAR_ref_11 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_11_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l36_c11_cecf_return_output : unsigned(15 downto 0);
 variable VAR_ref_12 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_12_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l38_c11_2729_return_output : unsigned(15 downto 0);
 variable VAR_ref_13 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_13_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l40_c11_5b04_return_output : unsigned(15 downto 0);
 variable VAR_ref_14 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_14_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l42_c11_05d1_return_output : unsigned(15 downto 0);
 variable VAR_ref_15 : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_uint16_t_16_15_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l44_c11_51cc_return_output : unsigned(15 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_sel_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l47_c2_1fd1 : unsigned(3 downto 0);
 variable VAR_uint4_uint4_0_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l48_c8_9614_return_output : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel : unsigned(3 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15 : unsigned(15 downto 0);
 variable VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l47_c2_1fd1 := resize(to_unsigned(0, 1), 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint16_t_uint16_t_16_9_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l32_c10_f6cb] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_9_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l32_c10_f6cb_return_output := VAR_ref_toks_0(9);

     -- CONST_REF_RD_uint16_t_uint16_t_16_15_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l44_c11_51cc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_15_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l44_c11_51cc_return_output := VAR_ref_toks_0(15);

     -- CONST_REF_RD_uint16_t_uint16_t_16_3_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l20_c10_4d0f] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_3_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l20_c10_4d0f_return_output := VAR_ref_toks_0(3);

     -- CONST_REF_RD_uint16_t_uint16_t_16_13_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l40_c11_5b04] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_13_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l40_c11_5b04_return_output := VAR_ref_toks_0(13);

     -- CONST_REF_RD_uint16_t_uint16_t_16_4_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l22_c10_b272] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_4_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l22_c10_b272_return_output := VAR_ref_toks_0(4);

     -- CONST_REF_RD_uint16_t_uint16_t_16_0_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l14_c10_94a9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_0_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l14_c10_94a9_return_output := VAR_ref_toks_0(0);

     -- CONST_REF_RD_uint16_t_uint16_t_16_2_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l18_c10_fab9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_2_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l18_c10_fab9_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint16_t_uint16_t_16_6_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l26_c10_b70c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_6_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l26_c10_b70c_return_output := VAR_ref_toks_0(6);

     -- CONST_REF_RD_uint16_t_uint16_t_16_7_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l28_c10_a58e] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_7_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l28_c10_a58e_return_output := VAR_ref_toks_0(7);

     -- CONST_REF_RD_uint16_t_uint16_t_16_12_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l38_c11_2729] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_12_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l38_c11_2729_return_output := VAR_ref_toks_0(12);

     -- uint4_uint4_0[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l48_c8_9614] LATENCY=0
     VAR_uint4_uint4_0_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l48_c8_9614_return_output := uint4_uint4_0(
     VAR_sel_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l47_c2_1fd1,
     VAR_var_dim_0);

     -- CONST_REF_RD_uint16_t_uint16_t_16_1_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l16_c10_1fe9] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_1_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l16_c10_1fe9_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint16_t_uint16_t_16_11_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l36_c11_cecf] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_11_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l36_c11_cecf_return_output := VAR_ref_toks_0(11);

     -- CONST_REF_RD_uint16_t_uint16_t_16_5_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l24_c10_943d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_5_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l24_c10_943d_return_output := VAR_ref_toks_0(5);

     -- CONST_REF_RD_uint16_t_uint16_t_16_8_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l30_c10_bc7d] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_8_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l30_c10_bc7d_return_output := VAR_ref_toks_0(8);

     -- CONST_REF_RD_uint16_t_uint16_t_16_10_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l34_c11_9d55] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_10_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l34_c11_9d55_return_output := VAR_ref_toks_0(10);

     -- CONST_REF_RD_uint16_t_uint16_t_16_14_d41d[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l42_c11_05d1] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_uint16_t_16_14_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l42_c11_05d1_return_output := VAR_ref_toks_0(14);

     -- Submodule level 1
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_0_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l14_c10_94a9_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_10_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l34_c11_9d55_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_11_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l36_c11_cecf_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_12_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l38_c11_2729_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_13_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l40_c11_5b04_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_14_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l42_c11_05d1_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_15_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l44_c11_51cc_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_1_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l16_c10_1fe9_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_2_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l18_c10_fab9_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_3_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l20_c10_4d0f_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_4_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l22_c10_b272_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_5_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l24_c10_943d_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_6_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l26_c10_b70c_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_7_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l28_c10_a58e_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_8_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l30_c10_bc7d_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9 := VAR_CONST_REF_RD_uint16_t_uint16_t_16_9_d41d_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l32_c10_f6cb_return_output;
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel := VAR_uint4_uint4_0_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l48_c8_9614_return_output;
     -- uint16_mux16[VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f] LATENCY=0
     -- Inputs
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_sel;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in0;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in1;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in2;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in3;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in4;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in5;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in6;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in7;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in8;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in9;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in10;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in11;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in12;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in13;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in14;
     uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15 <= VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_in15;
     -- Outputs
     VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output := uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint16_mux16_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_c_l51_c7_e73f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
