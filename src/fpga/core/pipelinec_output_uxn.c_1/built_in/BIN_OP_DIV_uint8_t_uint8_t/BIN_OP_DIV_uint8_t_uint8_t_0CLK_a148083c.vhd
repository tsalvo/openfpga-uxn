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
-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output : unsigned(0 downto 0);

-- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c]
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond : unsigned(0 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse : unsigned(7 downto 0);
signal remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output : unsigned(7 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c]
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output : unsigned(7 downto 0);

-- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af]
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right : unsigned(7 downto 0);
signal BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output : unsigned(0 downto 0);

-- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f]
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond : unsigned(0 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse : unsigned(7 downto 0);
signal output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output : unsigned(7 downto 0);

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
-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837 : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output);

-- remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse,
remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output);

-- BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right,
BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output);

-- BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af : entity work.BIN_OP_GTE_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right,
BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output);

-- output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse,
output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output,
 remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output,
 BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output,
 BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output,
 output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(7 downto 0);
 variable VAR_right : unsigned(7 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_left_resized : unsigned(7 downto 0);
 variable VAR_right_resized : unsigned(7 downto 0);
 variable VAR_output : unsigned(7 downto 0);
 variable VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_32df : unsigned(7 downto 0);
 variable VAR_remainder : unsigned(7 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7e07 : unsigned(7 downto 0);
 variable VAR_new_remainder0 : unsigned(0 downto 0);
 variable VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_913a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_3679 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_edac_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_8aeb_return_output : unsigned(7 downto 0);
 variable VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8644_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_99dc : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_5bb3_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_079c_return_output : unsigned(7 downto 0);
 variable VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_2e38_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_3ec9 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0722_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_ca5f_return_output : unsigned(7 downto 0);
 variable VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_49c3_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c4e3 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_6a0c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_cb81_return_output : unsigned(7 downto 0);
 variable VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_e66f_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_9508 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_675d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_c769_return_output : unsigned(7 downto 0);
 variable VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_b074_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_8332 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_688e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_a950_return_output : unsigned(7 downto 0);
 variable VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_1536_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_a83f : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_508c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output : unsigned(0 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output : unsigned(7 downto 0);
 variable VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_fd50_return_output : unsigned(7 downto 0);
 variable VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2143_return_output : unsigned(0 downto 0);
 variable VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_1cd2 : unsigned(7 downto 0);
 variable VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_65df_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output : unsigned(0 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output : unsigned(7 downto 0);
 variable VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e7f6_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_32df := resize(to_unsigned(0, 1), 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse := VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_32df;
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7e07 := resize(to_unsigned(0, 1), 8);
     -- uint8_uint1_7[BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_8aeb] LATENCY=0
     VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_8aeb_return_output := uint8_uint1_7(
     VAR_output_BIN_OP_DIV_uint8_t_uint8_t_c_l16_c3_32df,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue := VAR_uint8_uint1_7_BIN_OP_DIV_uint8_t_uint8_t_c_l47_c14_8aeb_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right := VAR_right;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right := VAR_right;
     -- uint8_2_2[BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_b074] LATENCY=0
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_b074_return_output := uint8_2_2(
     VAR_left);

     -- uint8_7_7[BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_913a] LATENCY=0
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_913a_return_output := uint8_7_7(
     VAR_left);

     -- uint8_3_3[BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_e66f] LATENCY=0
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_e66f_return_output := uint8_3_3(
     VAR_left);

     -- uint8_1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_1536] LATENCY=0
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_1536_return_output := uint8_1_1(
     VAR_left);

     -- uint8_6_6[BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8644] LATENCY=0
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8644_return_output := uint8_6_6(
     VAR_left);

     -- uint8_5_5[BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_2e38] LATENCY=0
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_2e38_return_output := uint8_5_5(
     VAR_left);

     -- uint8_0_0[BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2143] LATENCY=0
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2143_return_output := uint8_0_0(
     VAR_left);

     -- uint8_4_4[BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_49c3] LATENCY=0
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_49c3_return_output := uint8_4_4(
     VAR_left);

     -- Submodule level 1
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_edac] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_edac_return_output := uint8_uint1(
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l19_c3_7e07,
     VAR_uint8_7_7_BIN_OP_DIV_uint8_t_uint8_t_c_l41_c20_913a_return_output);

     -- Submodule level 2
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_3679 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c15_edac_return_output, 8);
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_3679;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_3679;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l42_c3_3679;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output;

     -- Submodule level 3
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c6_c178_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l45_c17_1ebd_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output;

     -- Submodule level 4
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_5bb3] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_5bb3_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output,
     VAR_uint8_6_6_BIN_OP_DIV_uint8_t_uint8_t_c_l50_c20_8644_return_output);

     -- uint8_uint1_6[BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_079c] LATENCY=0
     VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_079c_return_output := uint8_uint1_6(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l43_c3_549a_return_output,
     to_unsigned(1, 1));

     -- Submodule level 5
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_99dc := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c15_5bb3_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue := VAR_uint8_uint1_6_BIN_OP_DIV_uint8_t_uint8_t_c_l56_c14_079c_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_99dc;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_99dc;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l51_c3_99dc;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output;

     -- Submodule level 6
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c6_014a_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l54_c17_fd61_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output;

     -- Submodule level 7
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output;
     -- uint8_uint1_5[BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_ca5f] LATENCY=0
     VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_ca5f_return_output := uint8_uint1_5(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0722] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0722_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l52_c3_7d0a_return_output,
     VAR_uint8_5_5_BIN_OP_DIV_uint8_t_uint8_t_c_l59_c20_2e38_return_output);

     -- Submodule level 8
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_3ec9 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c15_0722_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue := VAR_uint8_uint1_5_BIN_OP_DIV_uint8_t_uint8_t_c_l65_c14_ca5f_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_3ec9;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_3ec9;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l60_c3_3ec9;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output;

     -- Submodule level 9
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c6_5a30_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l63_c17_9c7f_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output;

     -- Submodule level 10
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_6a0c] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_6a0c_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output,
     VAR_uint8_4_4_BIN_OP_DIV_uint8_t_uint8_t_c_l68_c20_49c3_return_output);

     -- uint8_uint1_4[BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_cb81] LATENCY=0
     VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_cb81_return_output := uint8_uint1_4(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l61_c3_5ddb_return_output,
     to_unsigned(1, 1));

     -- Submodule level 11
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c4e3 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c15_6a0c_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue := VAR_uint8_uint1_4_BIN_OP_DIV_uint8_t_uint8_t_c_l74_c14_cb81_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c4e3;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c4e3;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l69_c3_c4e3;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output;

     -- Submodule level 12
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c6_25bc_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l72_c17_85c4_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output;

     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output;

     -- Submodule level 13
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output;
     -- uint8_uint1_3[BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_c769] LATENCY=0
     VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_c769_return_output := uint8_uint1_3(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_675d] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_675d_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l70_c3_4576_return_output,
     VAR_uint8_3_3_BIN_OP_DIV_uint8_t_uint8_t_c_l77_c20_e66f_return_output);

     -- Submodule level 14
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_9508 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c15_675d_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue := VAR_uint8_uint1_3_BIN_OP_DIV_uint8_t_uint8_t_c_l83_c14_c769_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_9508;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_9508;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l78_c3_9508;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output;

     -- Submodule level 15
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c6_4b85_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l81_c17_e6de_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output;

     -- Submodule level 16
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_688e] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_688e_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output,
     VAR_uint8_2_2_BIN_OP_DIV_uint8_t_uint8_t_c_l86_c20_b074_return_output);

     -- uint8_uint1_2[BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_a950] LATENCY=0
     VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_a950_return_output := uint8_uint1_2(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l79_c3_4a19_return_output,
     to_unsigned(1, 1));

     -- Submodule level 17
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_8332 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c15_688e_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue := VAR_uint8_uint1_2_BIN_OP_DIV_uint8_t_uint8_t_c_l92_c14_a950_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_8332;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_8332;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l87_c3_8332;
     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output;

     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output;

     -- Submodule level 18
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c6_d746_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l90_c17_d9df_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output;

     -- Submodule level 19
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output;
     -- uint8_uint1_1[BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_fd50] LATENCY=0
     VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_fd50_return_output := uint8_uint1_1(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output,
     to_unsigned(1, 1));

     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_508c] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_508c_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l88_c3_b851_return_output,
     VAR_uint8_1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l95_c20_1536_return_output);

     -- Submodule level 20
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_a83f := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c15_508c_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue := VAR_uint8_uint1_1_BIN_OP_DIV_uint8_t_uint8_t_c_l101_c14_fd50_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_a83f;
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_a83f;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l96_c3_a83f;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output;

     -- BIN_OP_MINUS[BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_left;
     BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right <= VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output := BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output;

     -- Submodule level 21
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c6_b837_return_output;
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue := VAR_BIN_OP_MINUS_BIN_OP_DIV_uint8_t_uint8_t_c_l99_c17_5e2c_return_output;
     -- remainder_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c] LATENCY=0
     -- Inputs
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue;
     remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse <= VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse;
     -- Outputs
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output := remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output;

     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output;

     -- Submodule level 22
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output;
     -- uint8_uint1[BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_65df] LATENCY=0
     VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_65df_return_output := uint8_uint1(
     VAR_remainder_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output,
     VAR_uint8_0_0_BIN_OP_DIV_uint8_t_uint8_t_c_l104_c20_2143_return_output);

     -- uint8_uint1_0[BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e7f6] LATENCY=0
     VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e7f6_return_output := uint8_uint1_0(
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l97_c3_4a2c_return_output,
     to_unsigned(1, 1));

     -- Submodule level 23
     VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_1cd2 := resize(VAR_uint8_uint1_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c15_65df_return_output, 8);
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue := VAR_uint8_uint1_0_BIN_OP_DIV_uint8_t_uint8_t_c_l110_c14_e7f6_return_output;
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left := VAR_remainder_BIN_OP_DIV_uint8_t_uint8_t_c_l105_c3_1cd2;
     -- BIN_OP_GTE[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af] LATENCY=0
     -- Inputs
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_left;
     BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right <= VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_right;
     -- Outputs
     VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output := BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output;

     -- Submodule level 24
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond := VAR_BIN_OP_GTE_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c6_01af_return_output;
     -- output_MUX[BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f] LATENCY=0
     -- Inputs
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_cond;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iftrue;
     output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse <= VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_iffalse;
     -- Outputs
     VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output := output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output;

     -- Submodule level 25
     VAR_return_output := VAR_output_MUX_BIN_OP_DIV_uint8_t_uint8_t_c_l106_c3_df1f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
