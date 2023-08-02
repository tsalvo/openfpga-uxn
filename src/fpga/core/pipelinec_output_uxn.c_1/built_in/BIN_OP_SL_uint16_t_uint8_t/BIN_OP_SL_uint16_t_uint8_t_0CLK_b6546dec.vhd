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
-- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3]
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left : unsigned(7 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right : unsigned(3 downto 0);
signal BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108]
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse : unsigned(15 downto 0);
signal rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output : unsigned(15 downto 0);

-- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6]
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x : unsigned(15 downto 0);
signal CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output : unsigned(15 downto 0);

-- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379]
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x : unsigned(15 downto 0);
signal CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output : unsigned(15 downto 0);

-- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949]
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x : unsigned(15 downto 0);
signal CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output : unsigned(15 downto 0);

-- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104]
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x : unsigned(15 downto 0);
signal CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output : unsigned(15 downto 0);

-- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686]
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond : unsigned(0 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse : unsigned(15 downto 0);
signal MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output : unsigned(15 downto 0);

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
-- BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3 : entity work.BIN_OP_GT_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right,
BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output);

-- rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse,
rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output);

-- CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6 : entity work.CONST_SL_1_uint16_t_0CLK_de264c78 port map (
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x,
CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output);

-- CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379 : entity work.CONST_SL_2_uint16_t_0CLK_de264c78 port map (
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x,
CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output);

-- CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949 : entity work.CONST_SL_4_uint16_t_0CLK_de264c78 port map (
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x,
CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output);

-- CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x,
CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output);

-- MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse,
MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output,
 rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output,
 CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output,
 CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output,
 CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output,
 CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output,
 MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_resized_shift_amount : unsigned(3 downto 0);
 variable VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995 : unsigned(3 downto 0);
 variable VAR_rv : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue : unsigned(15 downto 0);
 variable VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_53e7 : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output : unsigned(15 downto 0);
 variable VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond : unsigned(0 downto 0);
 variable VAR_v0 : unsigned(15 downto 0);
 variable VAR_v1 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_d195_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output : unsigned(15 downto 0);
 variable VAR_v2 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4bd8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output : unsigned(15 downto 0);
 variable VAR_v3 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_1785_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output : unsigned(15 downto 0);
 variable VAR_v4 : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond : unsigned(0 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse : unsigned(15 downto 0);
 variable VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_8299_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x : unsigned(15 downto 0);
 variable VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_53e7 := resize(to_unsigned(0, 1), 16);
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue := VAR_rv_BIN_OP_SL_uint16_t_uint8_t_c_l20_c5_53e7;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right := to_unsigned(15, 4);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x := VAR_left;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse := VAR_left;
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left := VAR_right;
     VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995 := resize(VAR_right, 4);
     -- BIN_OP_GT[BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3] LATENCY=0
     -- Inputs
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_left;
     BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right <= VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_right;
     -- Outputs
     VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output := BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output;

     -- uint16_2_2[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_1785] LATENCY=0
     VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_1785_return_output := uint16_2_2(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995, 16));

     -- CONST_SL_1[BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6] LATENCY=0
     -- Inputs
     CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x <= VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_x;
     -- Outputs
     VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output := CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output;

     -- uint16_3_3[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_8299] LATENCY=0
     VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_8299_return_output := uint16_3_3(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995, 16));

     -- uint16_0_0[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_d195] LATENCY=0
     VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_d195_return_output := uint16_0_0(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995, 16));

     -- uint16_1_1[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4bd8] LATENCY=0
     VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4bd8_return_output := uint16_1_1(
     resize(VAR_resized_shift_amount_BIN_OP_SL_uint16_t_uint8_t_c_l11_c3_7995, 16));

     -- Submodule level 1
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond := VAR_BIN_OP_GT_BIN_OP_SL_uint16_t_uint8_t_c_l17_c6_19b3_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue := VAR_CONST_SL_1_BIN_OP_SL_uint16_t_uint8_t_c_l26_c55_c8d6_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond := VAR_uint16_0_0_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_d195_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond := VAR_uint16_1_1_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_4bd8_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond := VAR_uint16_2_2_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_1785_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond := VAR_uint16_3_3_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_8299_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output;

     -- Submodule level 2
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l26_c19_6b25_return_output;
     -- CONST_SL_2[BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379] LATENCY=0
     -- Inputs
     CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x <= VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_x;
     -- Outputs
     VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output := CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output;

     -- Submodule level 3
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue := VAR_CONST_SL_2_BIN_OP_SL_uint16_t_uint8_t_c_l27_c55_7379_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output;

     -- Submodule level 4
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l27_c19_0e41_return_output;
     -- CONST_SL_4[BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949] LATENCY=0
     -- Inputs
     CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x <= VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_x;
     -- Outputs
     VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output := CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output;

     -- Submodule level 5
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue := VAR_CONST_SL_4_BIN_OP_SL_uint16_t_uint8_t_c_l28_c55_e949_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output;

     -- Submodule level 6
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output;
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l28_c19_088a_return_output;
     -- CONST_SL_8[BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104] LATENCY=0
     -- Inputs
     CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x <= VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_x;
     -- Outputs
     VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output := CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output;

     -- Submodule level 7
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue := VAR_CONST_SL_8_BIN_OP_SL_uint16_t_uint8_t_c_l29_c55_1104_return_output;
     -- MUX[BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686] LATENCY=0
     -- Inputs
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_cond;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iftrue;
     MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse <= VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_iffalse;
     -- Outputs
     VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output := MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output;

     -- Submodule level 8
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse := VAR_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l29_c19_f686_return_output;
     -- rv_MUX[BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_cond;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iftrue;
     rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse <= VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output := rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output;

     -- Submodule level 9
     VAR_return_output := VAR_rv_MUX_BIN_OP_SL_uint16_t_uint8_t_c_l17_c3_5108_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
