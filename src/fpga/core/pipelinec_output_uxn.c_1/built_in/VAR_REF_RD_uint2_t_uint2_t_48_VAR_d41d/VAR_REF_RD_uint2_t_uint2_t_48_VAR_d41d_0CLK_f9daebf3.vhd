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
-- uint2_mux64[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2]
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel : unsigned(5 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63 : unsigned(1 downto 0);
signal uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output : unsigned(1 downto 0);

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
-- uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2 : entity work.uint2_mux64_0CLK_9ff5fd8d port map (
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63,
uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 ref_toks_0,
 var_dim_0,
 -- All submodule outputs
 uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ref_toks_0 : uint2_t_48;
 variable VAR_var_dim_0 : unsigned(5 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_base : uint2_t_48;
 variable VAR_ref_0 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_e388_return_output : unsigned(1 downto 0);
 variable VAR_ref_1 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_1251_return_output : unsigned(1 downto 0);
 variable VAR_ref_2 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_a94d_return_output : unsigned(1 downto 0);
 variable VAR_ref_3 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_8a1c_return_output : unsigned(1 downto 0);
 variable VAR_ref_4 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_f1bf_return_output : unsigned(1 downto 0);
 variable VAR_ref_5 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_b5e8_return_output : unsigned(1 downto 0);
 variable VAR_ref_6 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_6623_return_output : unsigned(1 downto 0);
 variable VAR_ref_7 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_c677_return_output : unsigned(1 downto 0);
 variable VAR_ref_8 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_823b_return_output : unsigned(1 downto 0);
 variable VAR_ref_9 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_7aa9_return_output : unsigned(1 downto 0);
 variable VAR_ref_10 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_56d3_return_output : unsigned(1 downto 0);
 variable VAR_ref_11 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_eaf0_return_output : unsigned(1 downto 0);
 variable VAR_ref_12 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_8aea_return_output : unsigned(1 downto 0);
 variable VAR_ref_13 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_d694_return_output : unsigned(1 downto 0);
 variable VAR_ref_14 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_8c22_return_output : unsigned(1 downto 0);
 variable VAR_ref_15 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_c2f8_return_output : unsigned(1 downto 0);
 variable VAR_ref_16 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_10a8_return_output : unsigned(1 downto 0);
 variable VAR_ref_17 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_8cae_return_output : unsigned(1 downto 0);
 variable VAR_ref_18 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_a23e_return_output : unsigned(1 downto 0);
 variable VAR_ref_19 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_744b_return_output : unsigned(1 downto 0);
 variable VAR_ref_20 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_dd88_return_output : unsigned(1 downto 0);
 variable VAR_ref_21 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_11f4_return_output : unsigned(1 downto 0);
 variable VAR_ref_22 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_e73d_return_output : unsigned(1 downto 0);
 variable VAR_ref_23 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_7fdc_return_output : unsigned(1 downto 0);
 variable VAR_ref_24 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_96a4_return_output : unsigned(1 downto 0);
 variable VAR_ref_25 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_65d6_return_output : unsigned(1 downto 0);
 variable VAR_ref_26 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_17ed_return_output : unsigned(1 downto 0);
 variable VAR_ref_27 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_4d13_return_output : unsigned(1 downto 0);
 variable VAR_ref_28 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_64da_return_output : unsigned(1 downto 0);
 variable VAR_ref_29 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_df7a_return_output : unsigned(1 downto 0);
 variable VAR_ref_30 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_7163_return_output : unsigned(1 downto 0);
 variable VAR_ref_31 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_3095_return_output : unsigned(1 downto 0);
 variable VAR_ref_32 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_9813_return_output : unsigned(1 downto 0);
 variable VAR_ref_33 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_0ae2_return_output : unsigned(1 downto 0);
 variable VAR_ref_34 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_af97_return_output : unsigned(1 downto 0);
 variable VAR_ref_35 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_2c0f_return_output : unsigned(1 downto 0);
 variable VAR_ref_36 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_8075_return_output : unsigned(1 downto 0);
 variable VAR_ref_37 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_e2ca_return_output : unsigned(1 downto 0);
 variable VAR_ref_38 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_fc3c_return_output : unsigned(1 downto 0);
 variable VAR_ref_39 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_8626_return_output : unsigned(1 downto 0);
 variable VAR_ref_40 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_8fcc_return_output : unsigned(1 downto 0);
 variable VAR_ref_41 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_01d1_return_output : unsigned(1 downto 0);
 variable VAR_ref_42 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_3338_return_output : unsigned(1 downto 0);
 variable VAR_ref_43 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_2e4b_return_output : unsigned(1 downto 0);
 variable VAR_ref_44 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_afce_return_output : unsigned(1 downto 0);
 variable VAR_ref_45 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_219a_return_output : unsigned(1 downto 0);
 variable VAR_ref_46 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_577a_return_output : unsigned(1 downto 0);
 variable VAR_ref_47 : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output : unsigned(1 downto 0);
 variable VAR_sel : unsigned(5 downto 0);
 variable VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_fd66 : unsigned(5 downto 0);
 variable VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_4103_return_output : unsigned(5 downto 0);
 variable VAR_rv : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel : unsigned(5 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63 : unsigned(1 downto 0);
 variable VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output : unsigned(1 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_fd66 := resize(to_unsigned(0, 1), 6);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_ref_toks_0 := ref_toks_0;
     VAR_var_dim_0 := var_dim_0;

     -- Submodule level 0
     -- CONST_REF_RD_uint2_t_uint2_t_48_38_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_fc3c] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_fc3c_return_output := VAR_ref_toks_0(38);

     -- CONST_REF_RD_uint2_t_uint2_t_48_34_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_af97] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_af97_return_output := VAR_ref_toks_0(34);

     -- CONST_REF_RD_uint2_t_uint2_t_48_23_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_7fdc] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_7fdc_return_output := VAR_ref_toks_0(23);

     -- CONST_REF_RD_uint2_t_uint2_t_48_20_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_dd88] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_dd88_return_output := VAR_ref_toks_0(20);

     -- CONST_REF_RD_uint2_t_uint2_t_48_32_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_9813] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_9813_return_output := VAR_ref_toks_0(32);

     -- CONST_REF_RD_uint2_t_uint2_t_48_44_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_afce] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_afce_return_output := VAR_ref_toks_0(44);

     -- CONST_REF_RD_uint2_t_uint2_t_48_28_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_64da] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_64da_return_output := VAR_ref_toks_0(28);

     -- CONST_REF_RD_uint2_t_uint2_t_48_12_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_8aea] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_8aea_return_output := VAR_ref_toks_0(12);

     -- CONST_REF_RD_uint2_t_uint2_t_48_22_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_e73d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_e73d_return_output := VAR_ref_toks_0(22);

     -- CONST_REF_RD_uint2_t_uint2_t_48_13_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_d694] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_d694_return_output := VAR_ref_toks_0(13);

     -- CONST_REF_RD_uint2_t_uint2_t_48_1_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_1251] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_1251_return_output := VAR_ref_toks_0(1);

     -- CONST_REF_RD_uint2_t_uint2_t_48_35_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_2c0f] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_2c0f_return_output := VAR_ref_toks_0(35);

     -- CONST_REF_RD_uint2_t_uint2_t_48_16_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_10a8] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_10a8_return_output := VAR_ref_toks_0(16);

     -- CONST_REF_RD_uint2_t_uint2_t_48_14_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_8c22] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_8c22_return_output := VAR_ref_toks_0(14);

     -- CONST_REF_RD_uint2_t_uint2_t_48_29_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_df7a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_df7a_return_output := VAR_ref_toks_0(29);

     -- CONST_REF_RD_uint2_t_uint2_t_48_33_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_0ae2] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_0ae2_return_output := VAR_ref_toks_0(33);

     -- CONST_REF_RD_uint2_t_uint2_t_48_36_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_8075] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_8075_return_output := VAR_ref_toks_0(36);

     -- CONST_REF_RD_uint2_t_uint2_t_48_41_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_01d1] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_01d1_return_output := VAR_ref_toks_0(41);

     -- uint6_uint6_0[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_4103] LATENCY=0
     VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_4103_return_output := uint6_uint6_0(
     VAR_sel_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l111_c2_fd66,
     VAR_var_dim_0);

     -- CONST_REF_RD_uint2_t_uint2_t_48_4_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_f1bf] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_f1bf_return_output := VAR_ref_toks_0(4);

     -- CONST_REF_RD_uint2_t_uint2_t_48_21_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_11f4] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_11f4_return_output := VAR_ref_toks_0(21);

     -- CONST_REF_RD_uint2_t_uint2_t_48_25_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_65d6] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_65d6_return_output := VAR_ref_toks_0(25);

     -- CONST_REF_RD_uint2_t_uint2_t_48_15_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_c2f8] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_c2f8_return_output := VAR_ref_toks_0(15);

     -- CONST_REF_RD_uint2_t_uint2_t_48_18_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_a23e] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_a23e_return_output := VAR_ref_toks_0(18);

     -- CONST_REF_RD_uint2_t_uint2_t_48_40_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_8fcc] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_8fcc_return_output := VAR_ref_toks_0(40);

     -- CONST_REF_RD_uint2_t_uint2_t_48_3_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_8a1c] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_8a1c_return_output := VAR_ref_toks_0(3);

     -- CONST_REF_RD_uint2_t_uint2_t_48_24_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_96a4] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_96a4_return_output := VAR_ref_toks_0(24);

     -- CONST_REF_RD_uint2_t_uint2_t_48_42_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_3338] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_3338_return_output := VAR_ref_toks_0(42);

     -- CONST_REF_RD_uint2_t_uint2_t_48_2_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_a94d] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_a94d_return_output := VAR_ref_toks_0(2);

     -- CONST_REF_RD_uint2_t_uint2_t_48_5_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_b5e8] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_b5e8_return_output := VAR_ref_toks_0(5);

     -- CONST_REF_RD_uint2_t_uint2_t_48_9_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_7aa9] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_7aa9_return_output := VAR_ref_toks_0(9);

     -- CONST_REF_RD_uint2_t_uint2_t_48_39_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_8626] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_8626_return_output := VAR_ref_toks_0(39);

     -- CONST_REF_RD_uint2_t_uint2_t_48_46_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_577a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_577a_return_output := VAR_ref_toks_0(46);

     -- CONST_REF_RD_uint2_t_uint2_t_48_45_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_219a] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_219a_return_output := VAR_ref_toks_0(45);

     -- CONST_REF_RD_uint2_t_uint2_t_48_7_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_c677] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_c677_return_output := VAR_ref_toks_0(7);

     -- CONST_REF_RD_uint2_t_uint2_t_48_8_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_823b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_823b_return_output := VAR_ref_toks_0(8);

     -- CONST_REF_RD_uint2_t_uint2_t_48_17_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_8cae] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_8cae_return_output := VAR_ref_toks_0(17);

     -- CONST_REF_RD_uint2_t_uint2_t_48_31_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_3095] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_3095_return_output := VAR_ref_toks_0(31);

     -- CONST_REF_RD_uint2_t_uint2_t_48_47_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output := VAR_ref_toks_0(47);

     -- CONST_REF_RD_uint2_t_uint2_t_48_10_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_56d3] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_56d3_return_output := VAR_ref_toks_0(10);

     -- CONST_REF_RD_uint2_t_uint2_t_48_27_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_4d13] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_4d13_return_output := VAR_ref_toks_0(27);

     -- CONST_REF_RD_uint2_t_uint2_t_48_37_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_e2ca] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_e2ca_return_output := VAR_ref_toks_0(37);

     -- CONST_REF_RD_uint2_t_uint2_t_48_19_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_744b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_744b_return_output := VAR_ref_toks_0(19);

     -- CONST_REF_RD_uint2_t_uint2_t_48_0_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_e388] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_e388_return_output := VAR_ref_toks_0(0);

     -- CONST_REF_RD_uint2_t_uint2_t_48_11_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_eaf0] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_eaf0_return_output := VAR_ref_toks_0(11);

     -- CONST_REF_RD_uint2_t_uint2_t_48_30_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_7163] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_7163_return_output := VAR_ref_toks_0(30);

     -- CONST_REF_RD_uint2_t_uint2_t_48_26_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_17ed] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_17ed_return_output := VAR_ref_toks_0(26);

     -- CONST_REF_RD_uint2_t_uint2_t_48_43_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_2e4b] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_2e4b_return_output := VAR_ref_toks_0(43);

     -- CONST_REF_RD_uint2_t_uint2_t_48_6_d41d[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_6623] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_6623_return_output := VAR_ref_toks_0(6);

     -- Submodule level 1
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_0_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l14_c10_e388_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_10_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l34_c11_56d3_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_11_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l36_c11_eaf0_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_12_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l38_c11_8aea_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_13_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l40_c11_d694_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_14_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l42_c11_8c22_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_15_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l44_c11_c2f8_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_16_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l46_c11_10a8_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_17_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l48_c11_8cae_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_18_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l50_c11_a23e_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_19_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l52_c11_744b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_1_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l16_c10_1251_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_20_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l54_c11_dd88_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_21_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l56_c11_11f4_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_22_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l58_c11_e73d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_23_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l60_c11_7fdc_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_24_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l62_c11_96a4_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_25_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l64_c11_65d6_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_26_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l66_c11_17ed_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_27_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l68_c11_4d13_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_28_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l70_c11_64da_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_29_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l72_c11_df7a_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_2_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l18_c10_a94d_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_30_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l74_c11_7163_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_31_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l76_c11_3095_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_32_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l78_c11_9813_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_33_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l80_c11_0ae2_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_34_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l82_c11_af97_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_35_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l84_c11_2c0f_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_36_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l86_c11_8075_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_37_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l88_c11_e2ca_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_38_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l90_c11_fc3c_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_39_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l92_c11_8626_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_3_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l20_c10_8a1c_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_40_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l94_c11_8fcc_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_41_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l96_c11_01d1_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_42_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l98_c11_3338_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_43_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l100_c11_2e4b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_44_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l102_c11_afce_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_45_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l104_c11_219a_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_46_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l106_c11_577a_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_47_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l108_c11_6679_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_4_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l22_c10_f1bf_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_5_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l24_c10_b5e8_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_6_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l26_c10_6623_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_7_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l28_c10_c677_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_8_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l30_c10_823b_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9 := VAR_CONST_REF_RD_uint2_t_uint2_t_48_9_d41d_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l32_c10_7aa9_return_output;
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel := VAR_uint6_uint6_0_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l112_c8_4103_return_output;
     -- uint2_mux64[VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2] LATENCY=0
     -- Inputs
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_sel;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in0;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in1;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in2;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in3;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in4;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in5;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in6;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in7;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in8;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in9;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in10;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in11;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in12;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in13;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in14;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in15;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in16;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in17;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in18;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in19;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in20;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in21;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in22;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in23;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in24;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in25;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in26;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in27;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in28;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in29;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in30;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in31;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in32;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in33;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in34;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in35;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in36;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in37;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in38;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in39;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in40;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in41;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in42;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in43;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in44;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in45;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in46;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in47;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in48;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in49;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in50;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in51;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in52;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in53;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in54;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in55;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in56;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in57;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in58;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in59;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in60;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in61;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in62;
     uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63 <= VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_in63;
     -- Outputs
     VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output := uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_uint2_mux64_VAR_REF_RD_uint2_t_uint2_t_48_VAR_d41d_c_l115_c7_8ea2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
