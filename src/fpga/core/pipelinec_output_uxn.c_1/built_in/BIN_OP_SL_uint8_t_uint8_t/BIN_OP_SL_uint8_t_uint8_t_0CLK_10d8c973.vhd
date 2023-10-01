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
-- BIN_OP_GT[BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71]
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right : unsigned(2 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092]
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output : unsigned(7 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0]
signal CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x : unsigned(7 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output : unsigned(7 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424]
signal CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x : unsigned(7 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output : unsigned(7 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b]
signal CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x : unsigned(7 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865]
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left,
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right,
BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output);

-- rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse,
rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output);

-- CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0 : entity work.CONST_SL_1_uint8_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x,
CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output);

-- CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424 : entity work.CONST_SL_2_uint8_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x,
CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output);

-- CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b : entity work.CONST_SL_4_uint8_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x,
CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output);

-- MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse,
MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output,
 rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output,
 CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output,
 CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output,
 CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output,
 MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_ed6b : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue : unsigned(7 downto 0);
 variable VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_9bbf : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_2258_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_62b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_2161_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right := to_unsigned(7, 3);
     VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_9bbf := resize(to_unsigned(0, 1), 8);
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue := VAR_rv_BIN_OP_SL_uint8_t_uint8_t_c_l20_c5_9bbf;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_ed6b := resize(VAR_right, 3);
     -- BIN_OP_GT[BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_left;
     BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output := BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output;

     -- uint8_2_2[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_2161] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_2161_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_ed6b, 8));

     -- CONST_SL_1[BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x <= VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output := CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output;

     -- uint8_1_1[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_62b6] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_62b6_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_ed6b, 8));

     -- uint8_0_0[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_2258] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_2258_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint8_t_uint8_t_c_l11_c3_ed6b, 8));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint8_t_uint8_t_c_l17_c6_da71_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint8_t_uint8_t_c_l26_c53_9bb0_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond := VAR_uint8_0_0_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_2258_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond := VAR_uint8_1_1_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_62b6_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond := VAR_uint8_2_2_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_2161_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l26_c18_8544_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x <= VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output := CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint8_t_uint8_t_c_l27_c53_6424_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output;
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l27_c18_1932_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x <= VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output := CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint8_t_uint8_t_c_l28_c53_0b7b_return_output;
     -- MUX[BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_cond;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iftrue;
     MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse <= VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output := MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output;

     -- Submodule level 6
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse := VAR_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l28_c18_a865_return_output;
     -- rv_MUX[BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_cond;
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iftrue;
     rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output := rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint8_t_uint8_t_c_l17_c3_6092_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
