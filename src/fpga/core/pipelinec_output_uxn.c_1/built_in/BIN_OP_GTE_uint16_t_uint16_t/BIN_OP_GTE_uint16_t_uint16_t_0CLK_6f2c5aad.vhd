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
-- Submodules: 4
entity BIN_OP_GTE_uint16_t_uint16_t_0CLK_6f2c5aad is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(15 downto 0);
 return_output : out unsigned(0 downto 0));
end BIN_OP_GTE_uint16_t_uint16_t_0CLK_6f2c5aad;
architecture arch of BIN_OP_GTE_uint16_t_uint16_t_0CLK_6f2c5aad is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_MINUS[BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee]
signal BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left : signed(16 downto 0);
signal BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right : signed(16 downto 0);
signal BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output : signed(17 downto 0);

-- UNARY_OP_NOT[BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58]
signal UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output : unsigned(0 downto 0);

function CAST_TO_int17_t_uint16_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : signed(16 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,17)));
    return return_output;
end function;

function int17_16_16( x : signed) return unsigned is
--variable x : signed(16 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(16- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee
BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee : entity work.BIN_OP_MINUS_int17_t_int17_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left,
BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right,
BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output);

-- UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58
UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr,
UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output,
 UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(15 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_left_bot : unsigned(15 downto 0);
 variable VAR_right_bot : unsigned(15 downto 0);
 variable VAR_right_bot_BIN_OP_GTE_uint16_t_uint16_t_c_l10_c14_1903_0 : unsigned(15 downto 0);
 variable VAR_rv : unsigned(0 downto 0);
 variable VAR_sub : signed(16 downto 0);
 variable VAR_sub_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c13_cad9_0 : signed(16 downto 0);
 variable VAR_CAST_TO_int17_t_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_6ef6_return_output : signed(16 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left : signed(16 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right : signed(16 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output : signed(17 downto 0);
 variable VAR_lt_zero : unsigned(0 downto 0);
 variable VAR_int17_16_16_BIN_OP_GTE_uint16_t_uint16_t_c_l15_c23_2b15_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_right_bot_BIN_OP_GTE_uint16_t_uint16_t_c_l10_c14_1903_0 := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right := signed(std_logic_vector(resize(VAR_right_bot_BIN_OP_GTE_uint16_t_uint16_t_c_l10_c14_1903_0, 17)));
     -- CAST_TO_int17_t[BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_6ef6] LATENCY=0
     VAR_CAST_TO_int17_t_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_6ef6_return_output := CAST_TO_int17_t_uint16_t(
     VAR_left);

     -- Submodule level 1
     VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left := VAR_CAST_TO_int17_t_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_6ef6_return_output;
     -- BIN_OP_MINUS[BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left <= VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_left;
     BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right <= VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output := BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output;

     -- Submodule level 2
     VAR_sub_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c13_cad9_0 := resize(VAR_BIN_OP_MINUS_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c19_25ee_return_output, 17);
     -- int17_16_16[BIN_OP_GTE_uint16_t_uint16_t_c_l15_c23_2b15] LATENCY=0
     VAR_int17_16_16_BIN_OP_GTE_uint16_t_uint16_t_c_l15_c23_2b15_return_output := int17_16_16(
     VAR_sub_BIN_OP_GTE_uint16_t_uint16_t_c_l14_c13_cad9_0);

     -- Submodule level 3
     VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr := VAR_int17_16_16_BIN_OP_GTE_uint16_t_uint16_t_c_l15_c23_2b15_return_output;
     -- UNARY_OP_NOT[BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr <= VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output := UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_UNARY_OP_NOT_BIN_OP_GTE_uint16_t_uint16_t_c_l16_c11_7d58_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
