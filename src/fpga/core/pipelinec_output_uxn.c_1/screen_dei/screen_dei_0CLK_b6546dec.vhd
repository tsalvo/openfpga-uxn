-- Timing params:
--   Fixed?: True
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
entity screen_dei_0CLK_b6546dec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr : in unsigned(7 downto 0);
 default_value : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end screen_dei_0CLK_b6546dec;
architecture arch of screen_dei_0CLK_b6546dec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal width : unsigned(15 downto 0) := to_unsigned(320, 16);
signal height : unsigned(15 downto 0) := to_unsigned(240, 16);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_width : unsigned(15 downto 0);
signal REG_COMB_height : unsigned(15 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l17_c6_d385]
signal BIN_OP_EQ_uxn_device_h_l17_c6_d385_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l17_c6_d385_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l17_c2_872a]
signal result_MUX_uxn_device_h_l17_c2_872a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l17_c2_872a_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l17_c2_872a_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l17_c2_872a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l18_c22_ff44]
signal CONST_SR_8_uxn_device_h_l18_c22_ff44_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l20_c11_b53e]
signal BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l20_c7_afce]
signal result_MUX_uxn_device_h_l20_c7_afce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l20_c7_afce_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l20_c7_afce_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l20_c7_afce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l23_c11_5e89]
signal BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l23_c7_9273]
signal result_MUX_uxn_device_h_l23_c7_9273_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l23_c7_9273_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l23_c7_9273_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l23_c7_9273_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_device_h_l24_c22_e8fa]
signal CONST_SR_8_uxn_device_h_l24_c22_e8fa_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l26_c11_5172]
signal BIN_OP_EQ_uxn_device_h_l26_c11_5172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l26_c11_5172_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l26_c7_c7df]
signal result_MUX_uxn_device_h_l26_c7_c7df_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l26_c7_c7df_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l26_c7_c7df_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_device_h_l26_c7_c7df_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l17_c6_d385
BIN_OP_EQ_uxn_device_h_l17_c6_d385 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l17_c6_d385_left,
BIN_OP_EQ_uxn_device_h_l17_c6_d385_right,
BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output);

-- result_MUX_uxn_device_h_l17_c2_872a
result_MUX_uxn_device_h_l17_c2_872a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l17_c2_872a_cond,
result_MUX_uxn_device_h_l17_c2_872a_iftrue,
result_MUX_uxn_device_h_l17_c2_872a_iffalse,
result_MUX_uxn_device_h_l17_c2_872a_return_output);

-- CONST_SR_8_uxn_device_h_l18_c22_ff44
CONST_SR_8_uxn_device_h_l18_c22_ff44 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l18_c22_ff44_x,
CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output);

-- BIN_OP_EQ_uxn_device_h_l20_c11_b53e
BIN_OP_EQ_uxn_device_h_l20_c11_b53e : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left,
BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right,
BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output);

-- result_MUX_uxn_device_h_l20_c7_afce
result_MUX_uxn_device_h_l20_c7_afce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l20_c7_afce_cond,
result_MUX_uxn_device_h_l20_c7_afce_iftrue,
result_MUX_uxn_device_h_l20_c7_afce_iffalse,
result_MUX_uxn_device_h_l20_c7_afce_return_output);

-- BIN_OP_EQ_uxn_device_h_l23_c11_5e89
BIN_OP_EQ_uxn_device_h_l23_c11_5e89 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left,
BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right,
BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output);

-- result_MUX_uxn_device_h_l23_c7_9273
result_MUX_uxn_device_h_l23_c7_9273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l23_c7_9273_cond,
result_MUX_uxn_device_h_l23_c7_9273_iftrue,
result_MUX_uxn_device_h_l23_c7_9273_iffalse,
result_MUX_uxn_device_h_l23_c7_9273_return_output);

-- CONST_SR_8_uxn_device_h_l24_c22_e8fa
CONST_SR_8_uxn_device_h_l24_c22_e8fa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l24_c22_e8fa_x,
CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output);

-- BIN_OP_EQ_uxn_device_h_l26_c11_5172
BIN_OP_EQ_uxn_device_h_l26_c11_5172 : entity work.BIN_OP_EQ_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l26_c11_5172_left,
BIN_OP_EQ_uxn_device_h_l26_c11_5172_right,
BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output);

-- result_MUX_uxn_device_h_l26_c7_c7df
result_MUX_uxn_device_h_l26_c7_c7df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l26_c7_c7df_cond,
result_MUX_uxn_device_h_l26_c7_c7df_iftrue,
result_MUX_uxn_device_h_l26_c7_c7df_iffalse,
result_MUX_uxn_device_h_l26_c7_c7df_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 addr,
 default_value,
 -- Registers
 result,
 width,
 height,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output,
 result_MUX_uxn_device_h_l17_c2_872a_return_output,
 CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output,
 BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output,
 result_MUX_uxn_device_h_l20_c7_afce_return_output,
 BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output,
 result_MUX_uxn_device_h_l23_c7_9273_return_output,
 CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output,
 BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output,
 result_MUX_uxn_device_h_l26_c7_c7df_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_default_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l17_c2_872a_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l17_c2_872a_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l20_c7_afce_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l17_c2_872a_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l17_c2_872a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l18_c12_530c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l20_c7_afce_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l20_c7_afce_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l23_c7_9273_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l20_c7_afce_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l21_c12_8c78_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l23_c7_9273_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l23_c7_9273_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l26_c7_c7df_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l23_c7_9273_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l24_c12_991a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l26_c7_c7df_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l26_c7_c7df_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_device_h_l26_c7_c7df_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l27_c12_a002_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_width : unsigned(15 downto 0);
variable REG_VAR_height : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_width := width;
  REG_VAR_height := height;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right := to_unsigned(36, 6);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_addr := addr;
     VAR_default_value := default_value;

     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_left := VAR_addr;
     VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left := VAR_addr;
     VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left := VAR_addr;
     VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_left := VAR_addr;
     VAR_result_MUX_uxn_device_h_l26_c7_c7df_iffalse := VAR_default_value;
     VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_x := height;
     REG_VAR_height := height;
     VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_x := width;
     REG_VAR_width := width;
     -- CONST_SR_8[uxn_device_h_l18_c22_ff44] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l18_c22_ff44_x <= VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output := CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output;

     -- BIN_OP_EQ[uxn_device_h_l26_c11_5172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l26_c11_5172_left <= VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_left;
     BIN_OP_EQ_uxn_device_h_l26_c11_5172_right <= VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output := BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l27_c12_a002] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l27_c12_a002_return_output := CAST_TO_uint8_t_uint16_t(
     height);

     -- BIN_OP_EQ[uxn_device_h_l20_c11_b53e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left <= VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_left;
     BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right <= VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output := BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l23_c11_5e89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left <= VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_left;
     BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right <= VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output := BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output;

     -- BIN_OP_EQ[uxn_device_h_l17_c6_d385] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l17_c6_d385_left <= VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_left;
     BIN_OP_EQ_uxn_device_h_l17_c6_d385_right <= VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output := BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l21_c12_8c78] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l21_c12_8c78_return_output := CAST_TO_uint8_t_uint16_t(
     width);

     -- CONST_SR_8[uxn_device_h_l24_c22_e8fa] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l24_c22_e8fa_x <= VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output := CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output;

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l17_c2_872a_cond := VAR_BIN_OP_EQ_uxn_device_h_l17_c6_d385_return_output;
     VAR_result_MUX_uxn_device_h_l20_c7_afce_cond := VAR_BIN_OP_EQ_uxn_device_h_l20_c11_b53e_return_output;
     VAR_result_MUX_uxn_device_h_l23_c7_9273_cond := VAR_BIN_OP_EQ_uxn_device_h_l23_c11_5e89_return_output;
     VAR_result_MUX_uxn_device_h_l26_c7_c7df_cond := VAR_BIN_OP_EQ_uxn_device_h_l26_c11_5172_return_output;
     VAR_result_MUX_uxn_device_h_l20_c7_afce_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l21_c12_8c78_return_output;
     VAR_result_MUX_uxn_device_h_l26_c7_c7df_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l27_c12_a002_return_output;
     -- CAST_TO_uint8_t[uxn_device_h_l18_c12_530c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l18_c12_530c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l18_c22_ff44_return_output);

     -- CAST_TO_uint8_t[uxn_device_h_l24_c12_991a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l24_c12_991a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_device_h_l24_c22_e8fa_return_output);

     -- result_MUX[uxn_device_h_l26_c7_c7df] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l26_c7_c7df_cond <= VAR_result_MUX_uxn_device_h_l26_c7_c7df_cond;
     result_MUX_uxn_device_h_l26_c7_c7df_iftrue <= VAR_result_MUX_uxn_device_h_l26_c7_c7df_iftrue;
     result_MUX_uxn_device_h_l26_c7_c7df_iffalse <= VAR_result_MUX_uxn_device_h_l26_c7_c7df_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l26_c7_c7df_return_output := result_MUX_uxn_device_h_l26_c7_c7df_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_device_h_l17_c2_872a_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l18_c12_530c_return_output;
     VAR_result_MUX_uxn_device_h_l23_c7_9273_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l24_c12_991a_return_output;
     VAR_result_MUX_uxn_device_h_l23_c7_9273_iffalse := VAR_result_MUX_uxn_device_h_l26_c7_c7df_return_output;
     -- result_MUX[uxn_device_h_l23_c7_9273] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l23_c7_9273_cond <= VAR_result_MUX_uxn_device_h_l23_c7_9273_cond;
     result_MUX_uxn_device_h_l23_c7_9273_iftrue <= VAR_result_MUX_uxn_device_h_l23_c7_9273_iftrue;
     result_MUX_uxn_device_h_l23_c7_9273_iffalse <= VAR_result_MUX_uxn_device_h_l23_c7_9273_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l23_c7_9273_return_output := result_MUX_uxn_device_h_l23_c7_9273_return_output;

     -- Submodule level 3
     VAR_result_MUX_uxn_device_h_l20_c7_afce_iffalse := VAR_result_MUX_uxn_device_h_l23_c7_9273_return_output;
     -- result_MUX[uxn_device_h_l20_c7_afce] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l20_c7_afce_cond <= VAR_result_MUX_uxn_device_h_l20_c7_afce_cond;
     result_MUX_uxn_device_h_l20_c7_afce_iftrue <= VAR_result_MUX_uxn_device_h_l20_c7_afce_iftrue;
     result_MUX_uxn_device_h_l20_c7_afce_iffalse <= VAR_result_MUX_uxn_device_h_l20_c7_afce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l20_c7_afce_return_output := result_MUX_uxn_device_h_l20_c7_afce_return_output;

     -- Submodule level 4
     VAR_result_MUX_uxn_device_h_l17_c2_872a_iffalse := VAR_result_MUX_uxn_device_h_l20_c7_afce_return_output;
     -- result_MUX[uxn_device_h_l17_c2_872a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l17_c2_872a_cond <= VAR_result_MUX_uxn_device_h_l17_c2_872a_cond;
     result_MUX_uxn_device_h_l17_c2_872a_iftrue <= VAR_result_MUX_uxn_device_h_l17_c2_872a_iftrue;
     result_MUX_uxn_device_h_l17_c2_872a_iffalse <= VAR_result_MUX_uxn_device_h_l17_c2_872a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l17_c2_872a_return_output := result_MUX_uxn_device_h_l17_c2_872a_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l17_c2_872a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l17_c2_872a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_width <= REG_VAR_width;
REG_COMB_height <= REG_VAR_height;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     width <= REG_COMB_width;
     height <= REG_COMB_height;
 end if;
 end if;
end process;

end arch;
