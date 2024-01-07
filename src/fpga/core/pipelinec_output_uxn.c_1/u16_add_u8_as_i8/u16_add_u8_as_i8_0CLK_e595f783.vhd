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
-- Submodules: 7
entity u16_add_u8_as_i8_0CLK_e595f783 is
port(
 u16 : in unsigned(15 downto 0);
 u8 : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end u16_add_u8_as_i8_0CLK_e595f783;
architecture arch of u16_add_u8_as_i8_0CLK_e595f783 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_opcodes_h_l64_c24_51b1]
signal BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l64_c50_d8e6]
signal BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l64_c24_45d7]
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l64_c65_5e94]
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output : unsigned(16 downto 0);

-- MUX[uxn_opcodes_h_l64_c9_2797]
signal MUX_uxn_opcodes_h_l64_c9_2797_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l64_c9_2797_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l64_c9_2797_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l64_c9_2797_return_output : unsigned(15 downto 0);

function uint8_7_7( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1
BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left,
BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right,
BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6
BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left,
BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right,
BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7
BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left,
BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right,
BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94
BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left,
BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right,
BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output);

-- MUX_uxn_opcodes_h_l64_c9_2797
MUX_uxn_opcodes_h_l64_c9_2797 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l64_c9_2797_cond,
MUX_uxn_opcodes_h_l64_c9_2797_iftrue,
MUX_uxn_opcodes_h_l64_c9_2797_iffalse,
MUX_uxn_opcodes_h_l64_c9_2797_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 u16,
 u8,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output,
 MUX_uxn_opcodes_h_l64_c9_2797_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_u16 : unsigned(15 downto 0);
 variable VAR_u8 : unsigned(7 downto 0);
 variable VAR_is_negative : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_opcodes_h_l63_c24_945b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c9_2797_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c9_2797_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c9_2797_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l64_c39_466f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l64_c9_2797_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right := to_unsigned(128, 16);
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right := to_unsigned(127, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_u16 := u16;
     VAR_u8 := u8;

     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left := VAR_u16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left := VAR_u16;
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left := VAR_u8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right := VAR_u8;
     -- BIN_OP_AND[uxn_opcodes_h_l64_c50_d8e6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_left;
     BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output := BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l64_c24_51b1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_left;
     BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output := BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l64_c65_5e94] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_left;
     BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output := BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output;

     -- uint8_7_7[uxn_opcodes_h_l63_c24_945b] LATENCY=0
     VAR_uint8_7_7_uxn_opcodes_h_l63_c24_945b_return_output := uint8_7_7(
     VAR_u8);

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l64_c24_51b1_return_output;
     VAR_MUX_uxn_opcodes_h_l64_c9_2797_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c65_5e94_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l64_c9_2797_cond := VAR_uint8_7_7_uxn_opcodes_h_l63_c24_945b_return_output;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l64_c39_466f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l64_c39_466f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l64_c50_d8e6_return_output);

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l64_c39_466f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l64_c24_45d7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l64_c9_2797_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l64_c24_45d7_return_output, 16);
     -- MUX[uxn_opcodes_h_l64_c9_2797] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l64_c9_2797_cond <= VAR_MUX_uxn_opcodes_h_l64_c9_2797_cond;
     MUX_uxn_opcodes_h_l64_c9_2797_iftrue <= VAR_MUX_uxn_opcodes_h_l64_c9_2797_iftrue;
     MUX_uxn_opcodes_h_l64_c9_2797_iffalse <= VAR_MUX_uxn_opcodes_h_l64_c9_2797_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l64_c9_2797_return_output := MUX_uxn_opcodes_h_l64_c9_2797_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_MUX_uxn_opcodes_h_l64_c9_2797_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
