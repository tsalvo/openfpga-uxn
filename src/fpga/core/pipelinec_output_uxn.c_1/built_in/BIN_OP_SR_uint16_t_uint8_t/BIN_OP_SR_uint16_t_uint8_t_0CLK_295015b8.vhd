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
-- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73]
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527]
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output : unsigned(15 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5]
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x : unsigned(15 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output : unsigned(15 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907]
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x : unsigned(15 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output : unsigned(15 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79]
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x : unsigned(15 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output : unsigned(15 downto 0);

-- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9]
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x : unsigned(15 downto 0);
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output);

-- rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output);

-- CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x,
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output);

-- CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x,
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output);

-- CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79 : entity work.CONST_SR_4_uint16_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x,
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output);

-- CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x,
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output,
 rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output,
 CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output,
 CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output,
 CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output,
 CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_75c8_return_output : unsigned(15 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond : unsigned(0 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f548_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond : unsigned(0 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_faeb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond : unsigned(0 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_1068_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond : unsigned(0 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_0215_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right := to_unsigned(15, 4);
     -- uint1_16[BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_75c8] LATENCY=0
     VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_75c8_return_output := uint1_16(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue := VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_75c8_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10 := resize(VAR_right, 4);
     -- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_left;
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output := BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output;

     -- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x <= VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output := CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output;

     -- uint16_1_1[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_faeb] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_faeb_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10, 16));

     -- uint16_2_2[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_1068] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_1068_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10, 16));

     -- uint16_0_0[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f548] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f548_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10, 16));

     -- uint16_3_3[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_0215] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_0215_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_3a10, 16));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_4f73_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_d4b5_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond := VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f548_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond := VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_faeb_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond := VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_1068_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond := VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_0215_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_f749_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x <= VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output := CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_9907_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_640f_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x <= VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output := CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_4e79_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output;

     -- Submodule level 6
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_31f8_return_output;
     -- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9] LATENCY=0
     -- Inputs
     CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x <= VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_x;
     -- Outputs
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output := CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue := VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_c0a9_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_ea8c_return_output;
     -- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_cond;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iftrue;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output := rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_d527_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
