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
-- Submodules: 8
entity peek2_dev_0CLK_ad162598 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end peek2_dev_0CLK_ad162598;
architecture arch of peek2_dev_0CLK_ad162598 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal mem0 : signed(31 downto 0) := to_signed(0, 32);
signal mem1 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_mem0 : signed(31 downto 0);
signal REG_COMB_mem1 : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(15 downto 0);

-- Each function instance gets signals
-- device_ram_read[uxn_ram_device_h_l58_c19_a2a9]
signal device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address : unsigned(7 downto 0);
signal device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_ram_device_h_l59_c36_beaa]
signal BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output : unsigned(8 downto 0);

-- device_ram_read[uxn_ram_device_h_l59_c20_983f]
signal device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_ram_device_h_l59_c20_983f_address : unsigned(7 downto 0);
signal device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_ram_device_h_l60_c22_c5ab]
signal CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x : signed(31 downto 0);
signal CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output : signed(31 downto 0);

-- BIN_OP_OR[uxn_ram_device_h_l60_c11_26f6]
signal BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output : unsigned(15 downto 0);

function CAST_TO_int32_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(31 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_int32_t( rhs : signed) return unsigned is

  --variable rhs : signed(31 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- device_ram_read_uxn_ram_device_h_l58_c19_a2a9
device_ram_read_uxn_ram_device_h_l58_c19_a2a9 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE,
device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address,
device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output);

-- BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa
BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left,
BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right,
BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output);

-- device_ram_read_uxn_ram_device_h_l59_c20_983f
device_ram_read_uxn_ram_device_h_l59_c20_983f : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE,
device_ram_read_uxn_ram_device_h_l59_c20_983f_address,
device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output);

-- CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab
CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab : entity work.CONST_SL_8_int32_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x,
CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output);

-- BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6
BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left,
BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right,
BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 -- Registers
 mem0,
 mem1,
 result,
 -- All submodule outputs
 device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output,
 BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output,
 device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output,
 CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output,
 BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int32_t_uxn_ram_device_h_l58_c9_261f_return_output : signed(31 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output : unsigned(8 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l59_c9_0bf0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output : signed(31 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x : signed(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_device_h_l60_c11_24da_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_mem0 : signed(31 downto 0);
variable REG_VAR_mem1 : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_mem0 := mem0;
  REG_VAR_mem1 := mem1;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left := VAR_address;
     VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address := VAR_address;
     -- BIN_OP_PLUS[uxn_ram_device_h_l59_c36_beaa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left <= VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_left;
     BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right <= VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output := BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output;

     -- device_ram_read[uxn_ram_device_h_l58_c19_a2a9] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE <= VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address <= VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_address;
     -- Outputs
     VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output := device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output;

     -- Submodule level 1
     VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_address := resize(VAR_BIN_OP_PLUS_uxn_ram_device_h_l59_c36_beaa_return_output, 8);
     -- CAST_TO_int32_t[uxn_ram_device_h_l58_c9_261f] LATENCY=0
     VAR_CAST_TO_int32_t_uxn_ram_device_h_l58_c9_261f_return_output := CAST_TO_int32_t_uint8_t(
     VAR_device_ram_read_uxn_ram_device_h_l58_c19_a2a9_return_output);

     -- device_ram_read[uxn_ram_device_h_l59_c20_983f] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE <= VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_ram_device_h_l59_c20_983f_address <= VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_address;
     -- Outputs
     VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output := device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output;

     -- Submodule level 2
     VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x := VAR_CAST_TO_int32_t_uxn_ram_device_h_l58_c9_261f_return_output;
     REG_VAR_mem0 := VAR_CAST_TO_int32_t_uxn_ram_device_h_l58_c9_261f_return_output;
     -- CONST_SL_8[uxn_ram_device_h_l60_c22_c5ab] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x <= VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output := CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output;

     -- CAST_TO_uint16_t[uxn_ram_device_h_l59_c9_0bf0] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l59_c9_0bf0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_read_uxn_ram_device_h_l59_c20_983f_return_output);

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l59_c9_0bf0_return_output;
     REG_VAR_mem1 := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l59_c9_0bf0_return_output;
     -- CAST_TO_uint16_t[uxn_ram_device_h_l60_c11_24da] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_device_h_l60_c11_24da_return_output := CAST_TO_uint16_t_int32_t(
     VAR_CONST_SL_8_uxn_ram_device_h_l60_c22_c5ab_return_output);

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left := VAR_CAST_TO_uint16_t_uxn_ram_device_h_l60_c11_24da_return_output;
     -- BIN_OP_OR[uxn_ram_device_h_l60_c11_26f6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left <= VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_left;
     BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right <= VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output := BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_ram_device_h_l60_c11_26f6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_mem0 <= REG_VAR_mem0;
REG_COMB_mem1 <= REG_VAR_mem1;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     mem0 <= REG_COMB_mem0;
     mem1 <= REG_COMB_mem1;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
