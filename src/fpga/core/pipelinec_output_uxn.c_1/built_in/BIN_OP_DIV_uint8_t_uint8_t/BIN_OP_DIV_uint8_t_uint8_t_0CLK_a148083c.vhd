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
-- Submodules: 54
entity BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c is
port(
 left : in unsigned(7 downto 0);
 right : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c;
architecture arch of BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output : unsigned(7 downto 0);

function uint8_7_7( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint8_uint1( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(7 downto 0);
  --variable y : unsigned(0 downto 0);
  variable return_output : unsigned(8 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint8_uint1_7( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(7 downto 7) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_6_6( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint8_uint1_6( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(6 downto 6) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_5_5( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint8_uint1_5( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(5 downto 5) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_4_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint8_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_3_3( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;

function uint8_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(7 downto 0) ;
    
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

function uint8_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(7 downto 0) ;
    
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

function uint8_uint1_1( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(1 downto 1) := x;
    
    return_output := intermediate(7 downto 0) ;
    
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

function uint8_uint1_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(0 downto 0) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_left_resized : unsigned(7 downto 0);
 variable VAR_right_resized : unsigned(7 downto 0);
 variable VAR_output : unsigned(7 downto 0);
 variable VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_6b53 : unsigned(7 downto 0);
 variable VAR_remainder : unsigned(7 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_a6c0 : unsigned(7 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_7b56_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_c3e0 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bff6_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_5dec_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_15bb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_bd66 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_18e1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_10ba_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_987a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_7d59 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_64ba_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_6996_return_output : unsigned(7 downto 0);
 variable VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_e3d6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_3e69 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0162_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f1de_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_8289_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_67a2 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_bacd_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_3ab1_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_31d9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_bfed : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_da6c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_95f0_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_96d3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_2347 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_5db8_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_08d6_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_78d5_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_2fb7 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_9307_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_9334_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_a6c0 := resize(to_unsigned(0, 1), 8);
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_6b53 := resize(to_unsigned(0, 1), 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse := VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_6b53;
     -- uint8_uint1_7[BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_5dec] LATENCY=0
     VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_5dec_return_output := uint8_uint1_7(
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_6b53,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue := VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_5dec_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right := VAR_right;
     -- uint8_0_0[BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_78d5] LATENCY=0
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_78d5_return_output := uint8_0_0(
     VAR_left);

     -- uint8_1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_96d3] LATENCY=0
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_96d3_return_output := uint8_1_1(
     VAR_left);

     -- uint8_7_7[BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_7b56] LATENCY=0
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_7b56_return_output := uint8_7_7(
     VAR_left);

     -- uint8_6_6[BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_15bb] LATENCY=0
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_15bb_return_output := uint8_6_6(
     VAR_left);

     -- uint8_5_5[BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_987a] LATENCY=0
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_987a_return_output := uint8_5_5(
     VAR_left);

     -- uint8_2_2[BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_31d9] LATENCY=0
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_31d9_return_output := uint8_2_2(
     VAR_left);

     -- uint8_4_4[BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_e3d6] LATENCY=0
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_e3d6_return_output := uint8_4_4(
     VAR_left);

     -- uint8_3_3[BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_8289] LATENCY=0
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_8289_return_output := uint8_3_3(
     VAR_left);

     -- Submodule level 1
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bff6] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bff6_return_output := uint8_uint1(
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_a6c0,
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_7b56_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_c3e0 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bff6_return_output, 8);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_c3e0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_c3e0;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_c3e0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_9a95_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_bc09_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_18e1] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_18e1_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output,
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_15bb_return_output);

     -- uint8_uint1_6[BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_10ba] LATENCY=0
     VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_10ba_return_output := uint8_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_c30b_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_bd66 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_18e1_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue := VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_10ba_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_bd66;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_bd66;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_bd66;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_904f_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_07bd_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_64ba] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_64ba_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output,
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_987a_return_output);

     -- uint8_uint1_5[BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_6996] LATENCY=0
     VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_6996_return_output := uint8_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_49b1_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_7d59 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_64ba_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue := VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_6996_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_7d59;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_7d59;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_7d59;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_c1d8_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_79fe_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output;
     -- uint8_uint1_4[BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f1de] LATENCY=0
     VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f1de_return_output := uint8_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0162] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0162_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_2aa6_return_output,
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_e3d6_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_3e69 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0162_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue := VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f1de_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_3e69;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_3e69;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_3e69;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_383e_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_fce5_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_bacd] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_bacd_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output,
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_8289_return_output);

     -- uint8_uint1_3[BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_3ab1] LATENCY=0
     VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_3ab1_return_output := uint8_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_be0f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_67a2 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_bacd_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue := VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_3ab1_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_67a2;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_67a2;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_67a2;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_0b81_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_71ce_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output;
     -- uint8_uint1_2[BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_95f0] LATENCY=0
     VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_95f0_return_output := uint8_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_da6c] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_da6c_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_3321_return_output,
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_31d9_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_bfed := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_da6c_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue := VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_95f0_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_bfed;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_bfed;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_bfed;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_0158_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_e341_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_5db8] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_5db8_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output,
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_96d3_return_output);

     -- uint8_uint1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_08d6] LATENCY=0
     VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_08d6_return_output := uint8_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_5436_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_2347 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_5db8_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue := VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_08d6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_2347;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_2347;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_2347;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_45e7_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_9565_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output;
     -- uint8_uint1_0[BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_9334] LATENCY=0
     VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_9334_return_output := uint8_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_9307] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_9307_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_e45c_return_output,
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_78d5_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_2fb7 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_9307_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue := VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_9334_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_2fb7;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6476_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output;

     -- Submodule level 25
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_a70a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
