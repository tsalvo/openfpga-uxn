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
-- Submodules: 14
entity BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec;
architecture arch of BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b]
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33]
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output : unsigned(15 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output : unsigned(15 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9]
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x : unsigned(15 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765]
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x : unsigned(15 downto 0);
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output : unsigned(15 downto 0);

function uint16_0_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint16_1_1( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint16_2_2( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint16_3_3( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output);

-- rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output);

-- CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output);

-- CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9 : entity work.CONST_SL_4_uint16_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x,
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output);

-- CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x,
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output,
 rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output,
 CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output,
 CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output,
 CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue : unsigned(15 downto 0);
 variable VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_74e5 : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_0d03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_baa8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_930f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_18a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right := to_unsigned(15, 4);
     VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_74e5 := resize(to_unsigned(0, 1), 16);
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue := VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_74e5;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49 := resize(VAR_right, 4);
     -- uint16_0_0[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_0d03] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_0d03_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49, 16));

     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output;

     -- uint16_2_2[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_930f] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_930f_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49, 16));

     -- uint16_3_3[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_18a1] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_18a1_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49, 16));

     -- uint16_1_1[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_baa8] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_baa8_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_8e49, 16));

     -- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_left;
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output := BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output;

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_f40b_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_52ae_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_0d03_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_baa8_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond := VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_930f_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond := VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_18a1_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6ce8_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_95ad_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_dc7a_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x <= VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output := CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_5db9_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output;

     -- Submodule level 6
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_3a2a_return_output;
     -- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765] LATENCY=0
     -- Inputs
     CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x <= VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_x;
     -- Outputs
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output := CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue := VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_e765_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_11aa_return_output;
     -- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_cond;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iftrue;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output := rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_9d33_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
