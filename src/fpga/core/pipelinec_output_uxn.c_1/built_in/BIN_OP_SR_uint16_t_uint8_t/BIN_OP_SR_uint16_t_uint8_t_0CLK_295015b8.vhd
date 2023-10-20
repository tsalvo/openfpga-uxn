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
-- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1]
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae]
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output : unsigned(15 downto 0);

-- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19]
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x : unsigned(15 downto 0);
signal CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output : unsigned(15 downto 0);

-- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201]
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x : unsigned(15 downto 0);
signal CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output : unsigned(15 downto 0);

-- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b]
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x : unsigned(15 downto 0);
signal CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output : unsigned(15 downto 0);

-- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb]
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x : unsigned(15 downto 0);
signal CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003]
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right,
BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output);

-- rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse,
rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output);

-- CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19 : entity work.CONST_SR_1_uint16_t_0CLK_de264c78 port map (
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x,
CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output);

-- CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201 : entity work.CONST_SR_2_uint16_t_0CLK_de264c78 port map (
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x,
CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output);

-- CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b : entity work.CONST_SR_4_uint16_t_0CLK_de264c78 port map (
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x,
CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output);

-- CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x,
CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output);

-- MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse,
MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output,
 rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output,
 CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output,
 CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output,
 CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output,
 CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output,
 MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond : unsigned(0 downto 0);
 variable VAR_sign : unsigned(0 downto 0);
 variable VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_5f66_return_output : unsigned(15 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_7c38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_3f0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_912e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7304_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right := to_unsigned(15, 4);
     -- uint1_16[BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_5f66] LATENCY=0
     VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_5f66_return_output := uint1_16(
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue := VAR_uint1_16_BIN_OP_SR_uint16_t_uint8_t_c_l23_c10_5f66_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x := VAR_left;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c := resize(VAR_right, 4);
     -- CONST_SR_1[BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19] LATENCY=0
     -- Inputs
     CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x <= VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_x;
     -- Outputs
     VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output := CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output;

     -- uint16_2_2[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_912e] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_912e_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c, 16));

     -- BIN_OP_GT[BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_left;
     BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right <= VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output := BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output;

     -- uint16_1_1[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_3f0b] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_3f0b_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c, 16));

     -- uint16_0_0[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_7c38] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_7c38_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c, 16));

     -- uint16_3_3[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7304] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7304_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SR_uint16_t_uint8_t_c_l11_c3_4b0c, 16));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond := VAR_BIN_OP_GT_BIN_OP_SR_uint16_t_uint8_t_c_l17_c6_06d1_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue := VAR_CONST_SR_1_BIN_OP_SR_uint16_t_uint8_t_c_l31_c55_5f19_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond := VAR_uint16_0_0_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_7c38_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond := VAR_uint16_1_1_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_3f0b_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond := VAR_uint16_2_2_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_912e_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond := VAR_uint16_3_3_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_7304_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output;

     -- Submodule level 2
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l31_c19_48e7_return_output;
     -- CONST_SR_2[BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201] LATENCY=0
     -- Inputs
     CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x <= VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_x;
     -- Outputs
     VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output := CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue := VAR_CONST_SR_2_BIN_OP_SR_uint16_t_uint8_t_c_l32_c55_8201_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output;

     -- Submodule level 4
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l32_c19_8a93_return_output;
     -- CONST_SR_4[BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b] LATENCY=0
     -- Inputs
     CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x <= VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_x;
     -- Outputs
     VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output := CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue := VAR_CONST_SR_4_BIN_OP_SR_uint16_t_uint8_t_c_l33_c55_ce3b_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output;

     -- Submodule level 6
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output;
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l33_c19_60e0_return_output;
     -- CONST_SR_8[BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb] LATENCY=0
     -- Inputs
     CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x <= VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_x;
     -- Outputs
     VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output := CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue := VAR_CONST_SR_8_BIN_OP_SR_uint16_t_uint8_t_c_l34_c55_a2bb_return_output;
     -- MUX[BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_cond;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iftrue;
     MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse <= VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output := MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse := VAR_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l34_c19_8003_return_output;
     -- rv_MUX[BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_cond;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iftrue;
     rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse <= VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output := rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SR_uint16_t_uint8_t_c_l17_c3_32ae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
