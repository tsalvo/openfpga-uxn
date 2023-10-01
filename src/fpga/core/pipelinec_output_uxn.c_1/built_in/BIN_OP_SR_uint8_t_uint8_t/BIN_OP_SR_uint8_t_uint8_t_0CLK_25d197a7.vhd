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
-- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88]
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right : unsigned(2 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992]
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse : unsigned(7 downto 0);
signal rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output : unsigned(7 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722]
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x : unsigned(7 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output : unsigned(7 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca]
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x : unsigned(7 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output : unsigned(7 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e]
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x : unsigned(7 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output : unsigned(7 downto 0);

-- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6]
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse : unsigned(7 downto 0);
signal MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88 : entity work.BIN_OP_GT_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right,
BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output);

-- rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse,
rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output);

-- CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722 : entity work.CONST_SR_1_uint8_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x,
CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output);

-- CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x,
CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output);

-- CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x,
CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output);

-- MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse,
MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output,
 rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output,
 CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output,
 CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output,
 CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output,
 MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_resized_shift_amount : unsigned(2 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7702 : unsigned(2 downto 0);
 variable VAR_rv : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output : unsigned(7 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_f2be_return_output : unsigned(7 downto 0);
 variable VAR_v0 : unsigned(7 downto 0);
 variable VAR_v1 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_6bcc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output : unsigned(7 downto 0);
 variable VAR_v2 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_310c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output : unsigned(7 downto 0);
 variable VAR_v3 : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_793c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x : unsigned(7 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right := to_unsigned(7, 3);
     -- uint1_8[BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_f2be] LATENCY=0
     VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_f2be_return_output := uint1_8(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue := VAR_uint1_8_BIN_OP_SR_uint8_t_uint8_t_c_l23_c10_f2be_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7702 := resize(VAR_right, 3);
     -- uint8_0_0[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_6bcc] LATENCY=0
     VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_6bcc_return_output := uint8_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7702, 8));

     -- BIN_OP_GT[BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_left;
     BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output := BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output;

     -- uint8_1_1[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_310c] LATENCY=0
     VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_310c_return_output := uint8_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7702, 8));

     -- CONST_SR_1[BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x <= VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output := CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output;

     -- uint8_2_2[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_793c] LATENCY=0
     VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_793c_return_output := uint8_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint8_t_uint8_t_c_l11_c3_7702, 8));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint8_t_uint8_t_c_l17_c6_df88_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint8_t_uint8_t_c_l31_c53_4722_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond := VAR_uint8_0_0_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_6bcc_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond := VAR_uint8_1_1_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_310c_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond := VAR_uint8_2_2_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_793c_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l31_c18_33e4_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x <= VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output := CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint8_t_uint8_t_c_l32_c53_7dca_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output;
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l32_c18_07d9_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x <= VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output := CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint8_t_uint8_t_c_l33_c53_754e_return_output;
     -- MUX[BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_cond;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iftrue;
     MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse <= VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output := MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output;

     -- Submodule level 6
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse := VAR_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l33_c18_6fe6_return_output;
     -- rv_MUX[BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_cond;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iftrue;
     rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output := rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint8_t_uint8_t_c_l17_c3_3992_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
