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
-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output : unsigned(7 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_left_resized : unsigned(7 downto 0);
 variable VAR_right_resized : unsigned(7 downto 0);
 variable VAR_output : unsigned(7 downto 0);
 variable VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_d543 : unsigned(7 downto 0);
 variable VAR_remainder : unsigned(7 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7447 : unsigned(7 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_d772_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_21c9 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_0220_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_dc14_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_e19d_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_1bea : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_96a7_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_a926_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_e094_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_9712 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_aadd_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_5fce_return_output : unsigned(7 downto 0);
 variable VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_4df8_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c6cd : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_cc85_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_c007_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_86ab_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_f96b : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_8325_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_68ac_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_7803_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_67dd : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_c604_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_ecf8_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_0ff9_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_9409 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_1af0_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_1951_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2fbe_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_254a : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_c674_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e05e_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7447 := resize(to_unsigned(0, 1), 8);
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_d543 := resize(to_unsigned(0, 1), 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse := VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_d543;
     -- uint8_uint1_7[BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_dc14] LATENCY=0
     VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_dc14_return_output := uint8_uint1_7(
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_d543,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue := VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_dc14_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right := VAR_right;
     -- uint8_3_3[BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_86ab] LATENCY=0
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_86ab_return_output := uint8_3_3(
     VAR_left);

     -- uint8_6_6[BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_e19d] LATENCY=0
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_e19d_return_output := uint8_6_6(
     VAR_left);

     -- uint8_5_5[BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_e094] LATENCY=0
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_e094_return_output := uint8_5_5(
     VAR_left);

     -- uint8_1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_0ff9] LATENCY=0
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_0ff9_return_output := uint8_1_1(
     VAR_left);

     -- uint8_0_0[BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2fbe] LATENCY=0
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2fbe_return_output := uint8_0_0(
     VAR_left);

     -- uint8_2_2[BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_7803] LATENCY=0
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_7803_return_output := uint8_2_2(
     VAR_left);

     -- uint8_7_7[BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_d772] LATENCY=0
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_d772_return_output := uint8_7_7(
     VAR_left);

     -- uint8_4_4[BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_4df8] LATENCY=0
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_4df8_return_output := uint8_4_4(
     VAR_left);

     -- Submodule level 1
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_0220] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_0220_return_output := uint8_uint1(
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7447,
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_d772_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_21c9 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_0220_return_output, 8);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_21c9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_21c9;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_21c9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_4781_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_e5ad_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_96a7] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_96a7_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output,
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_e19d_return_output);

     -- uint8_uint1_6[BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_a926] LATENCY=0
     VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_a926_return_output := uint8_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_fcb4_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_1bea := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_96a7_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue := VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_a926_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_1bea;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_1bea;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_1bea;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_b61d_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_b77e_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_aadd] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_aadd_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output,
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_e094_return_output);

     -- uint8_uint1_5[BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_5fce] LATENCY=0
     VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_5fce_return_output := uint8_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_78c3_return_output,
     to_unsigned(1, 1));

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_9712 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_aadd_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue := VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_5fce_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_9712;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_9712;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_9712;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_fd14_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_e8e7_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output;
     -- uint8_uint1_4[BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_c007] LATENCY=0
     VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_c007_return_output := uint8_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_cc85] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_cc85_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_ce7d_return_output,
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_4df8_return_output);

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c6cd := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_cc85_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue := VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_c007_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c6cd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c6cd;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c6cd;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_8798_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_3308_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output;
     -- uint8_uint1_3[BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_68ac] LATENCY=0
     VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_68ac_return_output := uint8_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_8325] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_8325_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_92db_return_output,
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_86ab_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_f96b := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_8325_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue := VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_68ac_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_f96b;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_f96b;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_f96b;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_ccaa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_4218_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output;
     -- uint8_uint1_2[BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_ecf8] LATENCY=0
     VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_ecf8_return_output := uint8_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_c604] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_c604_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_c79a_return_output,
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_7803_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_67dd := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_c604_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue := VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_ecf8_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_67dd;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_67dd;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_67dd;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_4fe3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_ada4_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output;
     -- uint8_uint1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_1951] LATENCY=0
     VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_1951_return_output := uint8_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_1af0] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_1af0_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_02f9_return_output,
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_0ff9_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_9409 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_1af0_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue := VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_1951_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_9409;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_9409;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_9409;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_4a12_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_8052_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_c674] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_c674_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output,
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2fbe_return_output);

     -- uint8_uint1_0[BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e05e] LATENCY=0
     VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e05e_return_output := uint8_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_a32f_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_254a := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_c674_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue := VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e05e_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_254a;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_5e0f_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output;

     -- Submodule level 25
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_311c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
