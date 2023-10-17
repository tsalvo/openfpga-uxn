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
-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_left_resized : unsigned(7 downto 0);
 variable VAR_right_resized : unsigned(7 downto 0);
 variable VAR_output : unsigned(7 downto 0);
 variable VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f849 : unsigned(7 downto 0);
 variable VAR_remainder : unsigned(7 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_92a8 : unsigned(7 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_fa2c_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_0600 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_ee86_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_e5e8_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_0246_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_76c4 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c43a_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_2fdb_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_0bee_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_1f85 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0eba_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_b55b_return_output : unsigned(7 downto 0);
 variable VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_cd8e_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_039c : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_4051_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_6567_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_6ada_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_017d : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_c9d8_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_48da_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_d0e9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_9d0d : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_abe3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_b0e1_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_53af_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_f9bf : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_d605_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_a6ba_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9acc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_aa34 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_34d4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_8b6d_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_92a8 := resize(to_unsigned(0, 1), 8);
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f849 := resize(to_unsigned(0, 1), 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse := VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f849;
     -- uint8_uint1_7[BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_e5e8] LATENCY=0
     VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_e5e8_return_output := uint8_uint1_7(
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f849,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue := VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_e5e8_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right := VAR_right;
     -- uint8_3_3[BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_6ada] LATENCY=0
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_6ada_return_output := uint8_3_3(
     VAR_left);

     -- uint8_1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_53af] LATENCY=0
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_53af_return_output := uint8_1_1(
     VAR_left);

     -- uint8_6_6[BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_0246] LATENCY=0
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_0246_return_output := uint8_6_6(
     VAR_left);

     -- uint8_2_2[BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_d0e9] LATENCY=0
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_d0e9_return_output := uint8_2_2(
     VAR_left);

     -- uint8_0_0[BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9acc] LATENCY=0
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9acc_return_output := uint8_0_0(
     VAR_left);

     -- uint8_7_7[BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_fa2c] LATENCY=0
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_fa2c_return_output := uint8_7_7(
     VAR_left);

     -- uint8_4_4[BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_cd8e] LATENCY=0
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_cd8e_return_output := uint8_4_4(
     VAR_left);

     -- uint8_5_5[BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_0bee] LATENCY=0
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_0bee_return_output := uint8_5_5(
     VAR_left);

     -- Submodule level 1
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_ee86] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_ee86_return_output := uint8_uint1(
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_92a8,
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_fa2c_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_0600 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_ee86_return_output, 8);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_0600;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_0600;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_0600;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_7998_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_833f_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c43a] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c43a_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output,
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_0246_return_output);

     -- uint8_uint1_6[BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_2fdb] LATENCY=0
     VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_2fdb_return_output := uint8_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_5319_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_76c4 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c43a_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue := VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_2fdb_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_76c4;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_76c4;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_76c4;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_9aa2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_1d48_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0eba] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0eba_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output,
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_0bee_return_output);

     -- uint8_uint1_5[BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_b55b] LATENCY=0
     VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_b55b_return_output := uint8_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7a9f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_1f85 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0eba_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue := VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_b55b_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_1f85;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_1f85;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_1f85;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_7530_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_cda9_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output;
     -- uint8_uint1_4[BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_6567] LATENCY=0
     VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_6567_return_output := uint8_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_4051] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_4051_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_705b_return_output,
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_cd8e_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_039c := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_4051_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue := VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_6567_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_039c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_039c;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_039c;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_618b_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_f60e_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output;
     -- uint8_uint1_3[BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_48da] LATENCY=0
     VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_48da_return_output := uint8_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_c9d8] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_c9d8_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_3393_return_output,
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_6ada_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_017d := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_c9d8_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue := VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_48da_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_017d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_017d;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_017d;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_a4ef_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_9196_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_abe3] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_abe3_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output,
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_d0e9_return_output);

     -- uint8_uint1_2[BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_b0e1] LATENCY=0
     VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_b0e1_return_output := uint8_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_349c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_9d0d := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_abe3_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue := VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_b0e1_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_9d0d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_9d0d;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_9d0d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_38b6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_21a2_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output;
     -- uint8_uint1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_a6ba] LATENCY=0
     VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_a6ba_return_output := uint8_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_d605] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_d605_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_77e8_return_output,
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_53af_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_f9bf := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_d605_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue := VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_a6ba_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_f9bf;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_f9bf;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_f9bf;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_ed95_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_ca20_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output;
     -- uint8_uint1_0[BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_8b6d] LATENCY=0
     VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_8b6d_return_output := uint8_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_34d4] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_34d4_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_fc4e_return_output,
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9acc_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_aa34 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_34d4_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue := VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_8b6d_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_aa34;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_809c_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output;

     -- Submodule level 25
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_2e8f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
