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
-- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616]
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a]
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output : unsigned(15 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output : unsigned(15 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49]
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x : unsigned(15 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6]
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x : unsigned(15 downto 0);
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output);

-- rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output);

-- CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output);

-- CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49 : entity work.CONST_SL_4_uint16_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x,
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output);

-- CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x,
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output,
 rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output,
 CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output,
 CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output,
 CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue : unsigned(15 downto 0);
 variable VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_bf28 : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond : unsigned(0 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3973_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond : unsigned(0 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6d3a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond : unsigned(0 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_35b3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond : unsigned(0 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_06a3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_bf28 := resize(to_unsigned(0, 1), 16);
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue := VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_bf28;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427 := resize(VAR_right, 4);
     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output;

     -- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_left;
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output := BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output;

     -- uint16_1_1[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6d3a] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6d3a_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427, 16));

     -- uint16_3_3[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_06a3] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_06a3_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427, 16));

     -- uint16_0_0[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3973] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3973_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427, 16));

     -- uint16_2_2[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_35b3] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_35b3_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_b427, 16));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_0616_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_32bf_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3973_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6d3a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond := VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_35b3_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond := VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_06a3_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_4e3f_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_68c4_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_6118_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x <= VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output := CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_6c49_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output;

     -- Submodule level 6
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_890a_return_output;
     -- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6] LATENCY=0
     -- Inputs
     CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x <= VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_x;
     -- Outputs
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output := CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue := VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_c1e6_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_1de3_return_output;
     -- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_cond;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iftrue;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output := rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_a66a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
