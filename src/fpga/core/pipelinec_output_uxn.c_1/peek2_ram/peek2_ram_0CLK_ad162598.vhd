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
entity peek2_ram_0CLK_ad162598 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(15 downto 0);
 return_output : out unsigned(15 downto 0));
end peek2_ram_0CLK_ad162598;
architecture arch of peek2_ram_0CLK_ad162598 is
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
-- main_ram_read[uxn_ram_main_h_l60_c19_b39b]
signal main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_ram_main_h_l60_c19_b39b_address : unsigned(15 downto 0);
signal main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_ram_main_h_l61_c34_c208]
signal BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output : unsigned(16 downto 0);

-- main_ram_read[uxn_ram_main_h_l61_c20_7183]
signal main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_read_uxn_ram_main_h_l61_c20_7183_address : unsigned(15 downto 0);
signal main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_ram_main_h_l62_c22_3326]
signal CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x : signed(31 downto 0);
signal CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output : signed(31 downto 0);

-- BIN_OP_OR[uxn_ram_main_h_l62_c11_cbba]
signal BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output : unsigned(15 downto 0);

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
-- main_ram_read_uxn_ram_main_h_l60_c19_b39b
main_ram_read_uxn_ram_main_h_l60_c19_b39b : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE,
main_ram_read_uxn_ram_main_h_l60_c19_b39b_address,
main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output);

-- BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208
BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left,
BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right,
BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output);

-- main_ram_read_uxn_ram_main_h_l61_c20_7183
main_ram_read_uxn_ram_main_h_l61_c20_7183 : entity work.main_ram_read_0CLK_8ab28aec port map (
clk,
main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE,
main_ram_read_uxn_ram_main_h_l61_c20_7183_address,
main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output);

-- CONST_SL_8_uxn_ram_main_h_l62_c22_3326
CONST_SL_8_uxn_ram_main_h_l62_c22_3326 : entity work.CONST_SL_8_int32_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x,
CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output);

-- BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba
BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left,
BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right,
BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output);



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
 main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output,
 BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output,
 main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output,
 CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output,
 BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address : unsigned(15 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_address : unsigned(15 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int32_t_uxn_ram_main_h_l60_c9_3f79_return_output : signed(31 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output : unsigned(16 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_main_h_l61_c9_d42f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output : signed(31 downto 0);
 variable VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x : signed(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_ram_main_h_l62_c11_88bc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left := VAR_address;
     VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_address := VAR_address;
     -- main_ram_read[uxn_ram_main_h_l60_c19_b39b] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE <= VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_ram_main_h_l60_c19_b39b_address <= VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_address;
     -- Outputs
     VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output := main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output;

     -- BIN_OP_PLUS[uxn_ram_main_h_l61_c34_c208] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left <= VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_left;
     BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right <= VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output := BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output;

     -- Submodule level 1
     VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_address := resize(VAR_BIN_OP_PLUS_uxn_ram_main_h_l61_c34_c208_return_output, 16);
     -- main_ram_read[uxn_ram_main_h_l61_c20_7183] LATENCY=0
     -- Clock enable
     main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE <= VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_CLOCK_ENABLE;
     -- Inputs
     main_ram_read_uxn_ram_main_h_l61_c20_7183_address <= VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_address;
     -- Outputs
     VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output := main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output;

     -- CAST_TO_int32_t[uxn_ram_main_h_l60_c9_3f79] LATENCY=0
     VAR_CAST_TO_int32_t_uxn_ram_main_h_l60_c9_3f79_return_output := CAST_TO_int32_t_uint8_t(
     VAR_main_ram_read_uxn_ram_main_h_l60_c19_b39b_return_output);

     -- Submodule level 2
     VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x := VAR_CAST_TO_int32_t_uxn_ram_main_h_l60_c9_3f79_return_output;
     REG_VAR_mem0 := VAR_CAST_TO_int32_t_uxn_ram_main_h_l60_c9_3f79_return_output;
     -- CAST_TO_uint16_t[uxn_ram_main_h_l61_c9_d42f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_main_h_l61_c9_d42f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_main_ram_read_uxn_ram_main_h_l61_c20_7183_return_output);

     -- CONST_SL_8[uxn_ram_main_h_l62_c22_3326] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x <= VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output := CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output;

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l61_c9_d42f_return_output;
     REG_VAR_mem1 := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l61_c9_d42f_return_output;
     -- CAST_TO_uint16_t[uxn_ram_main_h_l62_c11_88bc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_ram_main_h_l62_c11_88bc_return_output := CAST_TO_uint16_t_int32_t(
     VAR_CONST_SL_8_uxn_ram_main_h_l62_c22_3326_return_output);

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left := VAR_CAST_TO_uint16_t_uxn_ram_main_h_l62_c11_88bc_return_output;
     -- BIN_OP_OR[uxn_ram_main_h_l62_c11_cbba] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left <= VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_left;
     BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right <= VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output := BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_ram_main_h_l62_c11_cbba_return_output;
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
