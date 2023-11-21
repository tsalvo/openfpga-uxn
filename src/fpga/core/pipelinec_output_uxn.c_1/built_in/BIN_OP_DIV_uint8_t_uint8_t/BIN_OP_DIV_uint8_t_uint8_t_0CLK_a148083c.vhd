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
-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_left_resized : unsigned(7 downto 0);
 variable VAR_right_resized : unsigned(7 downto 0);
 variable VAR_output : unsigned(7 downto 0);
 variable VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f12a : unsigned(7 downto 0);
 variable VAR_remainder : unsigned(7 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_15fd : unsigned(7 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_45a6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_5c6c : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bd1d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_4cfc_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8135_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_a446 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c665_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_f525_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_4c4f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_d867 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_09c4_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_4605_return_output : unsigned(7 downto 0);
 variable VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_dfcb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_80c0 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0f54_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f7b1_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_d9ed_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_73c9 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_6c5b_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_b0a9_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_5bca_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_5e0d : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_61c2_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_5d84_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_9af4_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_d0ea : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_771d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_8ac4_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9deb_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_5cec : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_19f8_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_1924_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f12a := resize(to_unsigned(0, 1), 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse := VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f12a;
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_15fd := resize(to_unsigned(0, 1), 8);
     -- uint8_uint1_7[BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_4cfc] LATENCY=0
     VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_4cfc_return_output := uint8_uint1_7(
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_f12a,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue := VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_4cfc_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right := VAR_right;
     -- uint8_6_6[BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8135] LATENCY=0
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8135_return_output := uint8_6_6(
     VAR_left);

     -- uint8_4_4[BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_dfcb] LATENCY=0
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_dfcb_return_output := uint8_4_4(
     VAR_left);

     -- uint8_7_7[BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_45a6] LATENCY=0
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_45a6_return_output := uint8_7_7(
     VAR_left);

     -- uint8_2_2[BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_5bca] LATENCY=0
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_5bca_return_output := uint8_2_2(
     VAR_left);

     -- uint8_0_0[BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9deb] LATENCY=0
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9deb_return_output := uint8_0_0(
     VAR_left);

     -- uint8_1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_9af4] LATENCY=0
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_9af4_return_output := uint8_1_1(
     VAR_left);

     -- uint8_3_3[BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_d9ed] LATENCY=0
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_d9ed_return_output := uint8_3_3(
     VAR_left);

     -- uint8_5_5[BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_4c4f] LATENCY=0
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_4c4f_return_output := uint8_5_5(
     VAR_left);

     -- Submodule level 1
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bd1d] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bd1d_return_output := uint8_uint1(
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_15fd,
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_45a6_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_5c6c := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_bd1d_return_output, 8);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_5c6c;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_5c6c;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_5c6c;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_8d25_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_a14b_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output;
     -- uint8_uint1_6[BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_f525] LATENCY=0
     VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_f525_return_output := uint8_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c665] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c665_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_0c12_return_output,
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8135_return_output);

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_a446 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_c665_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue := VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_f525_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_a446;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_a446;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_a446;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_dfc6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_d279_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output;
     -- uint8_uint1_5[BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_4605] LATENCY=0
     VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_4605_return_output := uint8_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_09c4] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_09c4_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7288_return_output,
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_4c4f_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_d867 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_09c4_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue := VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_4605_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_d867;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_d867;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_d867;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_ebe3_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_07d7_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0f54] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0f54_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output,
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_dfcb_return_output);

     -- uint8_uint1_4[BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f7b1] LATENCY=0
     VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f7b1_return_output := uint8_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5f36_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_80c0 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_0f54_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue := VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_f7b1_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_80c0;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_80c0;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_80c0;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_5e24_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_1bae_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_6c5b] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_6c5b_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output,
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_d9ed_return_output);

     -- uint8_uint1_3[BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_b0a9] LATENCY=0
     VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_b0a9_return_output := uint8_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_ae68_return_output,
     to_unsigned(1, 1));

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_73c9 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_6c5b_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue := VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_b0a9_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_73c9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_73c9;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_73c9;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_8cb6_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_b1d5_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output;
     -- uint8_uint1_2[BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_5d84] LATENCY=0
     VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_5d84_return_output := uint8_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_61c2] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_61c2_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_025a_return_output,
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_5bca_return_output);

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_5e0d := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_61c2_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue := VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_5d84_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_5e0d;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_5e0d;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_5e0d;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_49e2_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_8c7d_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_771d] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_771d_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output,
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_9af4_return_output);

     -- uint8_uint1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_8ac4] LATENCY=0
     VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_8ac4_return_output := uint8_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_6762_return_output,
     to_unsigned(1, 1));

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_d0ea := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_771d_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue := VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_8ac4_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_d0ea;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_d0ea;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_d0ea;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_a5fa_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_b59d_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output;
     -- uint8_uint1_0[BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_1924] LATENCY=0
     VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_1924_return_output := uint8_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_19f8] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_19f8_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_b18b_return_output,
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_9deb_return_output);

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_5cec := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_19f8_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue := VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_1924_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_5cec;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_6534_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output;

     -- Submodule level 25
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_f0f8_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
