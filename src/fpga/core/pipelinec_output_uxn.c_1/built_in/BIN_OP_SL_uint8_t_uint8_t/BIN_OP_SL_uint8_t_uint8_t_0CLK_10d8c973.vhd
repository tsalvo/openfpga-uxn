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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 11
entity BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973;
architecture arch of BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GT[BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f]
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right : unsigned(2 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872]
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output : unsigned(7 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb]
signal CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x : unsigned(7 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output : unsigned(7 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b]
signal CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x : unsigned(7 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output : unsigned(7 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670]
signal CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x : unsigned(7 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left,
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right,
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output);

-- rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output);

-- CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb : entity work.CONST_SL_1_uint8_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x,
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output);

-- CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b : entity work.CONST_SL_2_uint8_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x,
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output);

-- CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670 : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x,
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output,
 rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output,
 CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output,
 CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output,
 CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_a7f8 : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue : unsigned(7 downto 0);
 variable VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_ac4e : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_c541_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_4570_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a907_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_ac4e := resize(to_unsigned(0, 1), 8);
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue := VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_ac4e;
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right := to_unsigned(7, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_a7f8 := resize(VAR_right, 3);
     -- uint8_0_0[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_c541] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_c541_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_a7f8, 8));

     -- BIN_OP_GT[BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_left;
     BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output := BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output;

     -- CONST_SL_1[BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x <= VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output := CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output;

     -- uint8_2_2[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a907] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a907_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_a7f8, 8));

     -- uint8_1_1[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_4570] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_4570_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_a7f8, 8));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_2e9f_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_49eb_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond := VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_c541_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond := VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_4570_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond := VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a907_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_7744_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x <= VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output := CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_011b_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_f454_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x <= VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output := CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_a670_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output;

     -- Submodule level 6
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_d9f7_return_output;
     -- rv_MUX[BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_cond;
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iftrue;
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output := rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6872_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
