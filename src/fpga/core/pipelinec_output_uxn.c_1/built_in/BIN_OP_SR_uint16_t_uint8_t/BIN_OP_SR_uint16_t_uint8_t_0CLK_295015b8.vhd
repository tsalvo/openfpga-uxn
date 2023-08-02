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
-- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1]
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7]
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output : unsigned(15 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda]
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x : unsigned(15 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output : unsigned(15 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274]
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x : unsigned(15 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output : unsigned(15 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17]
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x : unsigned(15 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output : unsigned(15 downto 0);

-- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111]
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x : unsigned(15 downto 0);
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output);

-- rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output);

-- CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x,
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output);

-- CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x,
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output);

-- CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17 : entity work.CONST_SR_4_uint16_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x,
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output);

-- CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x,
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output,
 rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output,
 CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output,
 CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output,
 CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output,
 CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_dee8_return_output : unsigned(15 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_0708_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_b7f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_e7ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7f9d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right := to_unsigned(15, 4);
     -- uint1_16[BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_dee8] LATENCY=0
     VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_dee8_return_output := uint1_16(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue := VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_dee8_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2 := resize(VAR_right, 4);
     -- uint16_0_0[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_0708] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_0708_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2, 16));

     -- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_left;
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output := BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output;

     -- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x <= VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output := CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output;

     -- uint16_1_1[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_b7f4] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_b7f4_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2, 16));

     -- uint16_3_3[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7f9d] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7f9d_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2, 16));

     -- uint16_2_2[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_e7ea] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_e7ea_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_07d2, 16));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_9ad1_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_ccda_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond := VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_0708_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond := VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_b7f4_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond := VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_e7ea_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond := VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7f9d_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_80d6_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x <= VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output := CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_a274_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8b1c_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x <= VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output := CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_8e17_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output;

     -- Submodule level 6
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_8184_return_output;
     -- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111] LATENCY=0
     -- Inputs
     CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x <= VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_x;
     -- Outputs
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output := CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue := VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_d111_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_164d_return_output;
     -- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_cond;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iftrue;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output := rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_40c7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
