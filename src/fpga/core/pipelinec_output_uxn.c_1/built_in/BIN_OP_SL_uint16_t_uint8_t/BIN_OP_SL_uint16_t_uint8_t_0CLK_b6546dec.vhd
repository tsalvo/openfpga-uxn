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
-- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e]
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d]
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output : unsigned(15 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output : unsigned(15 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd]
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x : unsigned(15 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output : unsigned(15 downto 0);

-- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160]
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x : unsigned(15 downto 0);
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output);

-- rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output);

-- CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output);

-- CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd : entity work.CONST_SL_4_uint16_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x,
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output);

-- CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x,
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output,
 rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output,
 CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output,
 CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output,
 CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue : unsigned(15 downto 0);
 variable VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_0220 : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4819_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_5fc7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_5b16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right := to_unsigned(15, 4);
     VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_0220 := resize(to_unsigned(0, 1), 16);
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue := VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_0220;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2 := resize(VAR_right, 4);
     -- uint16_0_0[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3f4a] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3f4a_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2, 16));

     -- uint16_2_2[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_5fc7] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_5fc7_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2, 16));

     -- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_left;
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output := BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output;

     -- uint16_1_1[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4819] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4819_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2, 16));

     -- uint16_3_3[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_5b16] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_5b16_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_31b2, 16));

     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output;

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_320e_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_0faf_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_3f4a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4819_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond := VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_5fc7_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond := VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_5b16_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_e96f_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_9b98_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_d916_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x <= VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output := CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_2cfd_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output;

     -- Submodule level 6
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_cd53_return_output;
     -- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160] LATENCY=0
     -- Inputs
     CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x <= VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_x;
     -- Outputs
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output := CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue := VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_f160_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_580f_return_output;
     -- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_cond;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iftrue;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output := rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_7b5d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
