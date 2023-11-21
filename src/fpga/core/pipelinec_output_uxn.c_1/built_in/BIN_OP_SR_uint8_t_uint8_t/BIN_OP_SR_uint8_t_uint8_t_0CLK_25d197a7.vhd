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
-- Submodules: 12
entity BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7;
architecture arch of BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4]
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right : unsigned(2 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2]
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output : unsigned(7 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e]
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x : unsigned(7 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output : unsigned(7 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b]
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x : unsigned(7 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output : unsigned(7 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd]
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x : unsigned(7 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output : unsigned(7 downto 0);

function uint1_8( x : unsigned) return unsigned is

  --variable x : unsigned(0 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    for i in 0 to 7 loop
      return_output( (((i+1)*1)-1) downto (i*1)) := unsigned(std_logic_vector(x));
    end loop;
return return_output;
end function;

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
-- BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output);

-- rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output);

-- CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x,
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output);

-- CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x,
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output);

-- CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x,
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output,
 rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output,
 CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output,
 CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output,
 CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_5d7d : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_688f_return_output : unsigned(7 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4c69_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_d4f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond : unsigned(0 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7e61_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right := to_unsigned(7, 3);
     -- uint1_8[BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_688f] LATENCY=0
     VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_688f_return_output := uint1_8(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue := VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_688f_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_5d7d := resize(VAR_right, 3);
     -- uint8_2_2[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7e61] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7e61_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_5d7d, 8));

     -- uint8_0_0[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4c69] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4c69_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_5d7d, 8));

     -- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_left;
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output := BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output;

     -- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x <= VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output := CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output;

     -- uint8_1_1[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_d4f4] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_d4f4_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_5d7d, 8));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_97f4_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_676e_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond := VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4c69_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond := VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_d4f4_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond := VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7e61_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_26d9_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x <= VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output := CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_864b_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_22cb_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x <= VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output := CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_25bd_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output;

     -- Submodule level 6
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_1854_return_output;
     -- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_cond;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iftrue;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output := rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_43f2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
