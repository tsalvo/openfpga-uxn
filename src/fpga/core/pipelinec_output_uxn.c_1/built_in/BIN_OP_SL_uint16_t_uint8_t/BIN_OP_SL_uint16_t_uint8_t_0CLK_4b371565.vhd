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
entity BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565;
architecture arch of BIN_OP_SL_uint16_t_uint8_t_0CLK_4b371565 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70]
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117]
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output : unsigned(15 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output : unsigned(15 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5]
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x : unsigned(15 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6]
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x : unsigned(15 downto 0);
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_5af1a430 port map (
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output);

-- rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output);

-- CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74 : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output);

-- CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5 : entity work.CONST_SL_4_uint16_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x,
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output);

-- CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x,
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output,
 rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output,
 CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output,
 CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output,
 CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue : unsigned(15 downto 0);
 variable VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_38c8 : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond : unsigned(0 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4f17_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond : unsigned(0 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_84e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond : unsigned(0 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_9610_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond : unsigned(0 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_c608_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_38c8 := resize(to_unsigned(0, 1), 16);
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue := VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_38c8;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050 := resize(VAR_right, 4);
     -- uint16_1_1[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_84e9] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_84e9_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050, 16));

     -- uint16_0_0[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4f17] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4f17_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050, 16));

     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output;

     -- uint16_3_3[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_c608] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_c608_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050, 16));

     -- uint16_2_2[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_9610] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_9610_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_d050, 16));

     -- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_left;
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output := BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output;

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_5e70_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0e74_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4f17_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_84e9_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond := VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_9610_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond := VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_c608_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_010c_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_4767_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_fcdb_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x <= VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output := CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_d4f5_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output;

     -- Submodule level 6
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_71dd_return_output;
     -- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6] LATENCY=0
     -- Inputs
     CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x <= VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_x;
     -- Outputs
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output := CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue := VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_19d6_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_bfa2_return_output;
     -- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_cond;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iftrue;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output := rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_b117_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
