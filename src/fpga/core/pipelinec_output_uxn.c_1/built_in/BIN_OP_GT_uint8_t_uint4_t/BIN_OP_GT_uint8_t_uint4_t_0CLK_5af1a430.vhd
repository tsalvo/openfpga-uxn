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
-- Submodules: 6
entity BIN_OP_GT_uint8_t_uint4_t_0CLK_5af1a430 is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(3 downto 0);
 return_output : out unsigned(0 downto 0));
end BIN_OP_GT_uint8_t_uint4_t_0CLK_5af1a430;
architecture arch of BIN_OP_GT_uint8_t_uint4_t_0CLK_5af1a430 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SR_4[BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3]
signal CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x : unsigned(7 downto 0);
signal CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36]
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left : unsigned(3 downto 0);
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right : unsigned(0 downto 0);
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3]
signal rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52]
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left : signed(4 downto 0);
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right : signed(4 downto 0);
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output : signed(5 downto 0);

function CAST_TO_int5_t_uint4_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : signed(4 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,5)));
    return return_output;
end function;

function int5_4_4( x : signed) return unsigned is
--variable x : signed(4 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3
CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x,
CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output);

-- BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left,
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right,
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output);

-- rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3
rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond,
rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue,
rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse,
rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output);

-- BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52 : entity work.BIN_OP_MINUS_int5_t_int5_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left,
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right,
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output,
 BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output,
 rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output,
 BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(3 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_left_bot : unsigned(3 downto 0);
 variable VAR_left_bot_BIN_OP_GT_uint8_t_uint4_t_c_l9_c13_82ec_0 : unsigned(3 downto 0);
 variable VAR_right_bot : unsigned(3 downto 0);
 variable VAR_top : unsigned(3 downto 0);
 variable VAR_top_BIN_OP_GT_uint8_t_uint4_t_c_l13_c3_9335 : unsigned(3 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x : unsigned(7 downto 0);
 variable VAR_rv : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond : unsigned(0 downto 0);
 variable VAR_sub : signed(4 downto 0);
 variable VAR_sub_BIN_OP_GT_uint8_t_uint4_t_c_l17_c12_d83f_0 : signed(4 downto 0);
 variable VAR_CAST_TO_int5_t_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_80e1_return_output : signed(4 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left : signed(4 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right : signed(4 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output : signed(5 downto 0);
 variable VAR_lt_zero : unsigned(0 downto 0);
 variable VAR_int5_4_4_BIN_OP_GT_uint8_t_uint4_t_c_l18_c23_9d43_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right := to_unsigned(0, 1);
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x := VAR_left;
     VAR_left_bot_BIN_OP_GT_uint8_t_uint4_t_c_l9_c13_82ec_0 := resize(VAR_left, 4);
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right := signed(std_logic_vector(resize(VAR_left_bot_BIN_OP_GT_uint8_t_uint4_t_c_l9_c13_82ec_0, 5)));
     -- CAST_TO_int5_t[BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_80e1] LATENCY=0
     VAR_CAST_TO_int5_t_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_80e1_return_output := CAST_TO_int5_t_uint4_t(
     VAR_right);

     -- CONST_SR_4[BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x <= VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output := CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left := VAR_CAST_TO_int5_t_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_80e1_return_output;
     VAR_top_BIN_OP_GT_uint8_t_uint4_t_c_l13_c3_9335 := resize(VAR_CONST_SR_4_BIN_OP_GT_uint8_t_uint4_t_c_l13_c9_26e3_return_output, 4);
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left := VAR_top_BIN_OP_GT_uint8_t_uint4_t_c_l13_c3_9335;
     -- BIN_OP_EQ[BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left <= VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_left;
     BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right <= VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_right;
     -- Outputs
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output := BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output;

     -- BIN_OP_MINUS[BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left <= VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_left;
     BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right <= VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output := BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output;

     -- Submodule level 2
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond := VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint4_t_c_l15_c6_3e36_return_output;
     VAR_sub_BIN_OP_GT_uint8_t_uint4_t_c_l17_c12_d83f_0 := resize(VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint4_t_c_l17_c18_0e52_return_output, 5);
     -- int5_4_4[BIN_OP_GT_uint8_t_uint4_t_c_l18_c23_9d43] LATENCY=0
     VAR_int5_4_4_BIN_OP_GT_uint8_t_uint4_t_c_l18_c23_9d43_return_output := int5_4_4(
     VAR_sub_BIN_OP_GT_uint8_t_uint4_t_c_l17_c12_d83f_0);

     -- Submodule level 3
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue := VAR_int5_4_4_BIN_OP_GT_uint8_t_uint4_t_c_l18_c23_9d43_return_output;
     -- rv_MUX[BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_cond;
     rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iftrue;
     rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output := rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_rv_MUX_BIN_OP_GT_uint8_t_uint4_t_c_l15_c3_cfe3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
