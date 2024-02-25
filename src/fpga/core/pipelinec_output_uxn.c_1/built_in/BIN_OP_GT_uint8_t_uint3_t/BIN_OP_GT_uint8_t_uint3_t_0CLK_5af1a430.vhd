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
entity BIN_OP_GT_uint8_t_uint3_t_0CLK_5af1a430 is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(2 downto 0);
 return_output : out unsigned(0 downto 0));
end BIN_OP_GT_uint8_t_uint3_t_0CLK_5af1a430;
architecture arch of BIN_OP_GT_uint8_t_uint3_t_0CLK_5af1a430 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SR_3[BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799]
signal CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x : unsigned(7 downto 0);
signal CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577]
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left : unsigned(4 downto 0);
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right : unsigned(0 downto 0);
signal BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04]
signal rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b]
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left : signed(3 downto 0);
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right : signed(3 downto 0);
signal BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output : signed(4 downto 0);

function CAST_TO_int4_t_uint3_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(2 downto 0);
  variable return_output : signed(3 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function int4_3_3( x : signed) return unsigned is
--variable x : signed(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799
CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799 : entity work.CONST_SR_3_uint8_t_0CLK_de264c78 port map (
CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x,
CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output);

-- BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577 : entity work.BIN_OP_EQ_uint5_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left,
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right,
BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output);

-- rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04
rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond,
rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue,
rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse,
rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output);

-- BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b : entity work.BIN_OP_MINUS_int4_t_int4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left,
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right,
BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output,
 BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output,
 rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output,
 BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(2 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_left_bot : unsigned(2 downto 0);
 variable VAR_left_bot_BIN_OP_GT_uint8_t_uint3_t_c_l9_c13_7d28_0 : unsigned(2 downto 0);
 variable VAR_right_bot : unsigned(2 downto 0);
 variable VAR_top : unsigned(4 downto 0);
 variable VAR_top_BIN_OP_GT_uint8_t_uint3_t_c_l13_c3_e5f0 : unsigned(4 downto 0);
 variable VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x : unsigned(7 downto 0);
 variable VAR_rv : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond : unsigned(0 downto 0);
 variable VAR_sub : signed(3 downto 0);
 variable VAR_sub_BIN_OP_GT_uint8_t_uint3_t_c_l17_c12_56aa_0 : signed(3 downto 0);
 variable VAR_CAST_TO_int4_t_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_0e95_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output : signed(4 downto 0);
 variable VAR_lt_zero : unsigned(0 downto 0);
 variable VAR_int4_3_3_BIN_OP_GT_uint8_t_uint3_t_c_l18_c23_e13a_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right := to_unsigned(0, 1);
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x := VAR_left;
     VAR_left_bot_BIN_OP_GT_uint8_t_uint3_t_c_l9_c13_7d28_0 := resize(VAR_left, 3);
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right := signed(std_logic_vector(resize(VAR_left_bot_BIN_OP_GT_uint8_t_uint3_t_c_l9_c13_7d28_0, 4)));
     -- CAST_TO_int4_t[BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_0e95] LATENCY=0
     VAR_CAST_TO_int4_t_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_0e95_return_output := CAST_TO_int4_t_uint3_t(
     VAR_right);

     -- CONST_SR_3[BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799] LATENCY=0
     -- Inputs
     CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x <= VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_x;
     -- Outputs
     VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output := CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left := VAR_CAST_TO_int4_t_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_0e95_return_output;
     VAR_top_BIN_OP_GT_uint8_t_uint3_t_c_l13_c3_e5f0 := resize(VAR_CONST_SR_3_BIN_OP_GT_uint8_t_uint3_t_c_l13_c9_e799_return_output, 5);
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left := VAR_top_BIN_OP_GT_uint8_t_uint3_t_c_l13_c3_e5f0;
     -- BIN_OP_EQ[BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left <= VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_left;
     BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right <= VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_right;
     -- Outputs
     VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output := BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output;

     -- BIN_OP_MINUS[BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left <= VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_left;
     BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right <= VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output := BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output;

     -- Submodule level 2
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond := VAR_BIN_OP_EQ_BIN_OP_GT_uint8_t_uint3_t_c_l15_c6_6577_return_output;
     VAR_sub_BIN_OP_GT_uint8_t_uint3_t_c_l17_c12_56aa_0 := resize(VAR_BIN_OP_MINUS_BIN_OP_GT_uint8_t_uint3_t_c_l17_c18_010b_return_output, 4);
     -- int4_3_3[BIN_OP_GT_uint8_t_uint3_t_c_l18_c23_e13a] LATENCY=0
     VAR_int4_3_3_BIN_OP_GT_uint8_t_uint3_t_c_l18_c23_e13a_return_output := int4_3_3(
     VAR_sub_BIN_OP_GT_uint8_t_uint3_t_c_l17_c12_56aa_0);

     -- Submodule level 3
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue := VAR_int4_3_3_BIN_OP_GT_uint8_t_uint3_t_c_l18_c23_e13a_return_output;
     -- rv_MUX[BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_cond;
     rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iftrue;
     rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse <= VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output := rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_rv_MUX_BIN_OP_GT_uint8_t_uint3_t_c_l15_c3_7f04_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
