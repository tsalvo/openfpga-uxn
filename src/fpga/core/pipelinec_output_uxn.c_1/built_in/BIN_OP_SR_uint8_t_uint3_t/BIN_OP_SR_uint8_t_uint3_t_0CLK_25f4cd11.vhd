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
-- Submodules: 9
entity BIN_OP_SR_uint8_t_uint3_t_0CLK_25f4cd11 is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(2 downto 0);
 return_output : out unsigned(7 downto 0));
end BIN_OP_SR_uint8_t_uint3_t_0CLK_25f4cd11;
architecture arch of BIN_OP_SR_uint8_t_uint3_t_0CLK_25f4cd11 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SR_1[BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7]
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x : unsigned(7 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda]
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output : unsigned(7 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e]
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x : unsigned(7 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e]
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output : unsigned(7 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e]
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x : unsigned(7 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce]
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output : unsigned(7 downto 0);

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint8_1_1( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint8_2_2( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7
CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x,
CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output);

-- CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e
CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x,
CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output);

-- CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e
CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x,
CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse,
MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output,
 MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output,
 CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output,
 MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output,
 CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output,
 MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(2 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint3_t_c_l11_c3_9dc5 : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4417_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_5fde_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_32e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output : unsigned(7 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse := VAR_left;
     VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint3_t_c_l11_c3_9dc5 := VAR_right;
     -- uint8_0_0[BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4417] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4417_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint3_t_c_l11_c3_9dc5, 8));

     -- CONST_SR_1[BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x <= VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output := CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output;

     -- uint8_1_1[BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_5fde] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_5fde_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint3_t_c_l11_c3_9dc5, 8));

     -- uint8_2_2[BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_32e1] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_32e1_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint3_t_c_l11_c3_9dc5, 8));

     -- Submodule level 1
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint3_t_c_l18_c53_10e7_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond := VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4417_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond := VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_5fde_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond := VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_32e1_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_cond;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output := MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x := VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l18_c18_4eda_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x <= VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output := CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint3_t_c_l19_c53_c19e_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_cond;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output := MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x := VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l19_c18_858e_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x <= VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output := CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint3_t_c_l20_c53_2d9e_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_cond;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output := MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output;

     -- Submodule level 6
     VAR_return_output := VAR_MUX_BIN_OP_SR_uint8_t_uint3_t_c_l20_c18_38ce_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
