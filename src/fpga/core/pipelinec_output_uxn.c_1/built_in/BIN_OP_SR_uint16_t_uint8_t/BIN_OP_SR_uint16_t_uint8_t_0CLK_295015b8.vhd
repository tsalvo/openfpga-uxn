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
-- Submodules: 15
entity BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8;
architecture arch of BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb]
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d]
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output : unsigned(15 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91]
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x : unsigned(15 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output : unsigned(15 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6]
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x : unsigned(15 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output : unsigned(15 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677]
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x : unsigned(15 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output : unsigned(15 downto 0);

-- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3]
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x : unsigned(15 downto 0);
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output : unsigned(15 downto 0);

function uint1_16( x : unsigned) return unsigned is

  --variable x : unsigned(0 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    for i in 0 to 15 loop
      return_output( (((i+1)*1)-1) downto (i*1)) := unsigned(std_logic_vector(x));
    end loop;
return return_output;
end function;

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
-- BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output);

-- rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output);

-- CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x,
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output);

-- CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x,
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output);

-- CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677 : entity work.CONST_SR_4_uint16_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x,
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output);

-- CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x,
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output,
 rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output,
 CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output,
 CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output,
 CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output,
 CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_1286_return_output : unsigned(15 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond : unsigned(0 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_85d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond : unsigned(0 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_901e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond : unsigned(0 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_d3b4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond : unsigned(0 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_c488_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right := to_unsigned(15, 4);
     -- uint1_16[BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_1286] LATENCY=0
     VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_1286_return_output := uint1_16(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue := VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_1286_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f := resize(VAR_right, 4);
     -- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_left;
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output := BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output;

     -- uint16_3_3[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_c488] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_c488_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f, 16));

     -- uint16_0_0[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_85d8] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_85d8_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f, 16));

     -- uint16_1_1[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_901e] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_901e_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f, 16));

     -- uint16_2_2[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_d3b4] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_d3b4_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_de2f, 16));

     -- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x <= VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output := CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output;

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_fdcb_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5d91_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond := VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_85d8_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond := VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_901e_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond := VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_d3b4_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond := VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_c488_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_a261_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x <= VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output := CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_fee6_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_e9ad_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x <= VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output := CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_c677_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output;

     -- Submodule level 6
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_df10_return_output;
     -- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3] LATENCY=0
     -- Inputs
     CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x <= VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_x;
     -- Outputs
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output := CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue := VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_cee3_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_eb1b_return_output;
     -- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_cond;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iftrue;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output := rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_201d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
