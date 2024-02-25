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
entity VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 is
port(
 ref_toks_0 : in uint2_t_48;
 var_dim_0 : in unsigned(5 downto 0);
 return_output : out unsigned(1 downto 0));
end VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3;
architecture arch of VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_0CLK_f9daebf3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- uint2_mux64[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d]
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel : unsigned(5 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output : unsigned(1 downto 0);

function uint6_uint6_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(5 downto 0);
  --variable x : unsigned(5 downto 0);
  variable intermediate : unsigned(5 downto 0);
  variable return_output : unsigned(5 downto 0);

begin

    intermediate := (others => '0');
    intermediate(5 downto 0) := unsigned(inp);
    intermediate(5 downto 0) := x;
    
    return_output := intermediate(5 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d : entity work.uint2_mux64_0CLK_9ff5fd8d port map (
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint2_t_48;
 variable VAR_var_dim_0 : unsigned(5 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_base : uint2_t_48;
 variable VAR_ref_0 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_2029_return_output : unsigned(1 downto 0);
 variable VAR_ref_1 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_ba11_return_output : unsigned(1 downto 0);
 variable VAR_ref_2 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_3e2f_return_output : unsigned(1 downto 0);
 variable VAR_ref_3 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_3e31_return_output : unsigned(1 downto 0);
 variable VAR_ref_4 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_7421_return_output : unsigned(1 downto 0);
 variable VAR_ref_5 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_3a81_return_output : unsigned(1 downto 0);
 variable VAR_ref_6 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_d63f_return_output : unsigned(1 downto 0);
 variable VAR_ref_7 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_5ad2_return_output : unsigned(1 downto 0);
 variable VAR_ref_8 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_f2ea_return_output : unsigned(1 downto 0);
 variable VAR_ref_9 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_96c4_return_output : unsigned(1 downto 0);
 variable VAR_ref_10 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_54d0_return_output : unsigned(1 downto 0);
 variable VAR_ref_11 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_5131_return_output : unsigned(1 downto 0);
 variable VAR_ref_12 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_2b28_return_output : unsigned(1 downto 0);
 variable VAR_ref_13 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_59d6_return_output : unsigned(1 downto 0);
 variable VAR_ref_14 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_acac_return_output : unsigned(1 downto 0);
 variable VAR_ref_15 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_7749_return_output : unsigned(1 downto 0);
 variable VAR_ref_16 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_b3e5_return_output : unsigned(1 downto 0);
 variable VAR_ref_17 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_27bc_return_output : unsigned(1 downto 0);
 variable VAR_ref_18 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_8205_return_output : unsigned(1 downto 0);
 variable VAR_ref_19 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_08ba_return_output : unsigned(1 downto 0);
 variable VAR_ref_20 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_e1da_return_output : unsigned(1 downto 0);
 variable VAR_ref_21 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_355b_return_output : unsigned(1 downto 0);
 variable VAR_ref_22 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_c516_return_output : unsigned(1 downto 0);
 variable VAR_ref_23 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_a6dc_return_output : unsigned(1 downto 0);
 variable VAR_ref_24 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_47ce_return_output : unsigned(1 downto 0);
 variable VAR_ref_25 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_4f51_return_output : unsigned(1 downto 0);
 variable VAR_ref_26 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_d6b4_return_output : unsigned(1 downto 0);
 variable VAR_ref_27 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_c846_return_output : unsigned(1 downto 0);
 variable VAR_ref_28 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_329d_return_output : unsigned(1 downto 0);
 variable VAR_ref_29 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_969f_return_output : unsigned(1 downto 0);
 variable VAR_ref_30 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_8999_return_output : unsigned(1 downto 0);
 variable VAR_ref_31 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_e251_return_output : unsigned(1 downto 0);
 variable VAR_ref_32 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_8b6b_return_output : unsigned(1 downto 0);
 variable VAR_ref_33 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_858c_return_output : unsigned(1 downto 0);
 variable VAR_ref_34 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_e84f_return_output : unsigned(1 downto 0);
 variable VAR_ref_35 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_5853_return_output : unsigned(1 downto 0);
 variable VAR_ref_36 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_62be_return_output : unsigned(1 downto 0);
 variable VAR_ref_37 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_6a6b_return_output : unsigned(1 downto 0);
 variable VAR_ref_38 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_2c12_return_output : unsigned(1 downto 0);
 variable VAR_ref_39 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_d835_return_output : unsigned(1 downto 0);
 variable VAR_ref_40 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_c586_return_output : unsigned(1 downto 0);
 variable VAR_ref_41 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_8cbb_return_output : unsigned(1 downto 0);
 variable VAR_ref_42 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_b7ba_return_output : unsigned(1 downto 0);
 variable VAR_ref_43 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_80e0_return_output : unsigned(1 downto 0);
 variable VAR_ref_44 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_7197_return_output : unsigned(1 downto 0);
 variable VAR_ref_45 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_9375_return_output : unsigned(1 downto 0);
 variable VAR_ref_46 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_2015_return_output : unsigned(1 downto 0);
 variable VAR_ref_47 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output : unsigned(1 downto 0);
 variable VAR_sel : unsigned(5 downto 0);
 variable VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_c8a2 : unsigned(5 downto 0);
 variable VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_ae60_return_output : unsigned(5 downto 0);
 variable VAR_rv : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel : unsigned(5 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output : unsigned(1 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_c8a2 := resize(to_unsigned(0, 1), 6);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint2_t_uint2_t_48_37_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_6a6b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_6a6b_return_output := VAR_ref_toks_0(37);

     -- CONST_REF_RD_uint2_t_uint2_t_48_3_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_3e31] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_3e31_return_output := VAR_ref_toks_0(3);

     -- CONST_REF_RD_uint2_t_uint2_t_48_16_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_b3e5] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_b3e5_return_output := VAR_ref_toks_0(16);

     -- CONST_REF_RD_uint2_t_uint2_t_48_32_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_8b6b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_8b6b_return_output := VAR_ref_toks_0(32);

     -- CONST_REF_RD_uint2_t_uint2_t_48_1_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_ba11] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_ba11_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint2_t_uint2_t_48_29_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_969f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_969f_return_output := VAR_ref_toks_0(29);

     -- CONST_REF_RD_uint2_t_uint2_t_48_14_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_acac] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_acac_return_output := VAR_ref_toks_0(14);

     -- CONST_REF_RD_uint2_t_uint2_t_48_35_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_5853] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_5853_return_output := VAR_ref_toks_0(35);

     -- CONST_REF_RD_uint2_t_uint2_t_48_19_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_08ba] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_08ba_return_output := VAR_ref_toks_0(19);

     -- CONST_REF_RD_uint2_t_uint2_t_48_40_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_c586] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_c586_return_output := VAR_ref_toks_0(40);

     -- CONST_REF_RD_uint2_t_uint2_t_48_20_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_e1da] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_e1da_return_output := VAR_ref_toks_0(20);

     -- CONST_REF_RD_uint2_t_uint2_t_48_33_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_858c] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_858c_return_output := VAR_ref_toks_0(33);

     -- CONST_REF_RD_uint2_t_uint2_t_48_41_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_8cbb] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_8cbb_return_output := VAR_ref_toks_0(41);

     -- CONST_REF_RD_uint2_t_uint2_t_48_17_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_27bc] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_27bc_return_output := VAR_ref_toks_0(17);

     -- CONST_REF_RD_uint2_t_uint2_t_48_39_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_d835] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_d835_return_output := VAR_ref_toks_0(39);

     -- CONST_REF_RD_uint2_t_uint2_t_48_43_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_80e0] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_80e0_return_output := VAR_ref_toks_0(43);

     -- CONST_REF_RD_uint2_t_uint2_t_48_31_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_e251] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_e251_return_output := VAR_ref_toks_0(31);

     -- CONST_REF_RD_uint2_t_uint2_t_48_30_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_8999] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_8999_return_output := VAR_ref_toks_0(30);

     -- CONST_REF_RD_uint2_t_uint2_t_48_24_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_47ce] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_47ce_return_output := VAR_ref_toks_0(24);

     -- CONST_REF_RD_uint2_t_uint2_t_48_8_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_f2ea] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_f2ea_return_output := VAR_ref_toks_0(8);

     -- CONST_REF_RD_uint2_t_uint2_t_48_5_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_3a81] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_3a81_return_output := VAR_ref_toks_0(5);

     -- CONST_REF_RD_uint2_t_uint2_t_48_27_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_c846] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_c846_return_output := VAR_ref_toks_0(27);

     -- CONST_REF_RD_uint2_t_uint2_t_48_21_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_355b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_355b_return_output := VAR_ref_toks_0(21);

     -- uint6_uint6_0[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_ae60] LATENCY=0
     VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_ae60_return_output := uint6_uint6_0(
     VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_c8a2,
     VAR_var_dim_0);

     -- CONST_REF_RD_uint2_t_uint2_t_48_9_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_96c4] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_96c4_return_output := VAR_ref_toks_0(9);

     -- CONST_REF_RD_uint2_t_uint2_t_48_42_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_b7ba] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_b7ba_return_output := VAR_ref_toks_0(42);

     -- CONST_REF_RD_uint2_t_uint2_t_48_34_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_e84f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_e84f_return_output := VAR_ref_toks_0(34);

     -- CONST_REF_RD_uint2_t_uint2_t_48_11_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_5131] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_5131_return_output := VAR_ref_toks_0(11);

     -- CONST_REF_RD_uint2_t_uint2_t_48_6_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_d63f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_d63f_return_output := VAR_ref_toks_0(6);

     -- CONST_REF_RD_uint2_t_uint2_t_48_38_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_2c12] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_2c12_return_output := VAR_ref_toks_0(38);

     -- CONST_REF_RD_uint2_t_uint2_t_48_2_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_3e2f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_3e2f_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint2_t_uint2_t_48_7_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_5ad2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_5ad2_return_output := VAR_ref_toks_0(7);

     -- CONST_REF_RD_uint2_t_uint2_t_48_44_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_7197] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_7197_return_output := VAR_ref_toks_0(44);

     -- CONST_REF_RD_uint2_t_uint2_t_48_13_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_59d6] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_59d6_return_output := VAR_ref_toks_0(13);

     -- CONST_REF_RD_uint2_t_uint2_t_48_36_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_62be] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_62be_return_output := VAR_ref_toks_0(36);

     -- CONST_REF_RD_uint2_t_uint2_t_48_46_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_2015] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_2015_return_output := VAR_ref_toks_0(46);

     -- CONST_REF_RD_uint2_t_uint2_t_48_15_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_7749] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_7749_return_output := VAR_ref_toks_0(15);

     -- CONST_REF_RD_uint2_t_uint2_t_48_10_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_54d0] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_54d0_return_output := VAR_ref_toks_0(10);

     -- CONST_REF_RD_uint2_t_uint2_t_48_22_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_c516] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_c516_return_output := VAR_ref_toks_0(22);

     -- CONST_REF_RD_uint2_t_uint2_t_48_0_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_2029] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_2029_return_output := VAR_ref_toks_0(0);

     -- CONST_REF_RD_uint2_t_uint2_t_48_18_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_8205] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_8205_return_output := VAR_ref_toks_0(18);

     -- CONST_REF_RD_uint2_t_uint2_t_48_23_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_a6dc] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_a6dc_return_output := VAR_ref_toks_0(23);

     -- CONST_REF_RD_uint2_t_uint2_t_48_28_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_329d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_329d_return_output := VAR_ref_toks_0(28);

     -- CONST_REF_RD_uint2_t_uint2_t_48_45_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_9375] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_9375_return_output := VAR_ref_toks_0(45);

     -- CONST_REF_RD_uint2_t_uint2_t_48_47_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output := VAR_ref_toks_0(47);

     -- CONST_REF_RD_uint2_t_uint2_t_48_26_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_d6b4] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_d6b4_return_output := VAR_ref_toks_0(26);

     -- CONST_REF_RD_uint2_t_uint2_t_48_25_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_4f51] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_4f51_return_output := VAR_ref_toks_0(25);

     -- CONST_REF_RD_uint2_t_uint2_t_48_4_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_7421] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_7421_return_output := VAR_ref_toks_0(4);

     -- CONST_REF_RD_uint2_t_uint2_t_48_12_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_2b28] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_2b28_return_output := VAR_ref_toks_0(12);

     -- Submodule level 1
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_2029_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_54d0_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_5131_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_2b28_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_59d6_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_acac_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_7749_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_b3e5_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_27bc_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_8205_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_08ba_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_ba11_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_e1da_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_355b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_c516_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_a6dc_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_47ce_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_4f51_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_d6b4_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_c846_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_329d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_969f_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_3e2f_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_8999_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_e251_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_8b6b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_858c_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_e84f_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_5853_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_62be_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_6a6b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_2c12_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_d835_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_3e31_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_c586_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_8cbb_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_b7ba_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_80e0_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_7197_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_9375_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_2015_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_0d9d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_7421_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_3a81_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_d63f_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_5ad2_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_f2ea_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_96c4_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel := VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_ae60_return_output;
     -- uint2_mux64[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d] LATENCY=0
     -- Inputs
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_sel;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in0;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in1;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in2;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in3;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in4;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in5;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in6;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in7;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in8;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in9;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in10;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in11;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in12;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in13;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in14;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in15;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in16;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in17;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in18;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in19;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in20;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in21;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in22;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in23;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in24;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in25;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in26;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in27;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in28;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in29;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in30;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in31;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in32;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in33;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in34;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in35;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in36;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in37;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in38;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in39;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in40;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in41;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in42;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in43;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in44;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in45;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in46;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in47;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in48;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in49;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in50;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in51;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in52;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in53;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in54;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in55;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in56;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in57;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in58;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in59;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in60;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in61;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in62;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_in63;
     -- Outputs
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output := uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_a34d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
