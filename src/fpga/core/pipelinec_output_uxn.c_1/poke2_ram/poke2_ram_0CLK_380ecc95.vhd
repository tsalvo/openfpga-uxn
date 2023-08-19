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
-- Submodules: 3
entity poke2_ram_0CLK_380ecc95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(15 downto 0);
 value : in unsigned(15 downto 0));
end poke2_ram_0CLK_380ecc95;
architecture arch of poke2_ram_0CLK_380ecc95 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal value0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal value1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_value0 : unsigned(7 downto 0);
signal REG_COMB_value1 : unsigned(7 downto 0);

-- Each function instance gets signals
-- CONST_SR_8[uxn_ram_main_h_l60_c21_994a]
signal CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_8_uxn_ram_main_h_l60_c21_994a
CONST_SR_8_uxn_ram_main_h_l60_c21_994a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x,
CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 value,
 -- Registers
 value0,
 value1,
 -- All submodule outputs
 CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_address : unsigned(15 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_ram_main_h_l60_c11_c419_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_ram_main_h_l61_c11_7a41_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_value0 : unsigned(7 downto 0);
variable REG_VAR_value1 : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_value0 := value0;
  REG_VAR_value1 := value1;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;
     VAR_value := value;

     -- Submodule level 0
     VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x := VAR_value;
     -- CONST_SR_8[uxn_ram_main_h_l60_c21_994a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x <= VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output := CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output;

     -- CAST_TO_uint8_t[uxn_ram_main_h_l61_c11_7a41] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_ram_main_h_l61_c11_7a41_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- Submodule level 1
     REG_VAR_value1 := VAR_CAST_TO_uint8_t_uxn_ram_main_h_l61_c11_7a41_return_output;
     -- CAST_TO_uint8_t[uxn_ram_main_h_l60_c11_c419] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_ram_main_h_l60_c11_c419_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_ram_main_h_l60_c21_994a_return_output);

     -- Submodule level 2
     REG_VAR_value0 := VAR_CAST_TO_uint8_t_uxn_ram_main_h_l60_c11_c419_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_value0 <= REG_VAR_value0;
REG_COMB_value1 <= REG_VAR_value1;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     value0 <= REG_COMB_value0;
     value1 <= REG_COMB_value1;
 end if;
 end if;
end process;

end arch;
