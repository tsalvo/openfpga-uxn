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
-- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d]
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right : unsigned(2 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2]
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output : unsigned(7 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13]
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x : unsigned(7 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output : unsigned(7 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54]
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x : unsigned(7 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output : unsigned(7 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed]
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x : unsigned(7 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output);

-- rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output);

-- CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x,
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output);

-- CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x,
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output);

-- CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x,
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output,
 rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output,
 CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output,
 CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output,
 CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7519 : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_c7b3_return_output : unsigned(7 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_e5d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_bc9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6255_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right := to_unsigned(7, 3);
     -- uint1_8[BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_c7b3] LATENCY=0
     VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_c7b3_return_output := uint1_8(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue := VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_c7b3_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7519 := resize(VAR_right, 3);
     -- uint8_2_2[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6255] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6255_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7519, 8));

     -- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x <= VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output := CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output;

     -- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_left;
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output := BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output;

     -- uint8_0_0[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_e5d5] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_e5d5_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7519, 8));

     -- uint8_1_1[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_bc9a] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_bc9a_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7519, 8));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_979d_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_5a13_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond := VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_e5d5_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond := VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_bc9a_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond := VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6255_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_4f13_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x <= VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output := CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_fd54_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_b298_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x <= VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output := CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_caed_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output;

     -- Submodule level 6
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_7d54_return_output;
     -- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_cond;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iftrue;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output := rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_f9b2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
