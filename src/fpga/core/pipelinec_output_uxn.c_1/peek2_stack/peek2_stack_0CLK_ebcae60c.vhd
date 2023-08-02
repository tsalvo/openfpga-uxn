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
entity peek2_stack_0CLK_ebcae60c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end peek2_stack_0CLK_ebcae60c;
architecture arch of peek2_stack_0CLK_ebcae60c is
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
-- stack_data_get[uxn_stack_h_l207_c19_1fb8]
signal stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index : unsigned(0 downto 0);
signal stack_data_get_uxn_stack_h_l207_c19_1fb8_index : unsigned(7 downto 0);
signal stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l208_c48_79e3]
signal BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output : unsigned(8 downto 0);

-- stack_data_get[uxn_stack_h_l208_c20_6b94]
signal stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index : unsigned(0 downto 0);
signal stack_data_get_uxn_stack_h_l208_c20_6b94_index : unsigned(7 downto 0);
signal stack_data_get_uxn_stack_h_l208_c20_6b94_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_stack_h_l209_c22_db00]
signal CONST_SL_8_uxn_stack_h_l209_c22_db00_x : signed(31 downto 0);
signal CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output : signed(31 downto 0);

-- BIN_OP_OR[uxn_stack_h_l209_c11_928d]
signal BIN_OP_OR_uxn_stack_h_l209_c11_928d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l209_c11_928d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output : unsigned(15 downto 0);

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
-- stack_data_get_uxn_stack_h_l207_c19_1fb8
stack_data_get_uxn_stack_h_l207_c19_1fb8 : entity work.stack_data_get_0CLK_c34ffe29 port map (
clk,
stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE,
stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index,
stack_data_get_uxn_stack_h_l207_c19_1fb8_index,
stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3
BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left,
BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right,
BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output);

-- stack_data_get_uxn_stack_h_l208_c20_6b94
stack_data_get_uxn_stack_h_l208_c20_6b94 : entity work.stack_data_get_0CLK_c34ffe29 port map (
clk,
stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE,
stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index,
stack_data_get_uxn_stack_h_l208_c20_6b94_index,
stack_data_get_uxn_stack_h_l208_c20_6b94_return_output);

-- CONST_SL_8_uxn_stack_h_l209_c22_db00
CONST_SL_8_uxn_stack_h_l209_c22_db00 : entity work.CONST_SL_8_int32_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_stack_h_l209_c22_db00_x,
CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output);

-- BIN_OP_OR_uxn_stack_h_l209_c11_928d
BIN_OP_OR_uxn_stack_h_l209_c11_928d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_stack_h_l209_c11_928d_left,
BIN_OP_OR_uxn_stack_h_l209_c11_928d_right,
BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 -- Registers
 mem0,
 mem1,
 result,
 -- All submodule outputs
 stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output,
 BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output,
 stack_data_get_uxn_stack_h_l208_c20_6b94_return_output,
 CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output,
 BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_index : unsigned(7 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int32_t_uxn_stack_h_l207_c9_1bd8_return_output : signed(31 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_index : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output : unsigned(8 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l208_c9_0d6d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output : signed(31 downto 0);
 variable VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_x : signed(31 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_stack_h_l209_c11_a039_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output : unsigned(15 downto 0);
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
     VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_address := address;

     -- Submodule level 0
     VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left := VAR_address;
     VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_index := VAR_address;
     VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index := VAR_stack_index;
     VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index := VAR_stack_index;
     -- BIN_OP_PLUS[uxn_stack_h_l208_c48_79e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_left;
     BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output := BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output;

     -- stack_data_get[uxn_stack_h_l207_c19_1fb8] LATENCY=0
     -- Clock enable
     stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE <= VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_CLOCK_ENABLE;
     -- Inputs
     stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index <= VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_stack_index;
     stack_data_get_uxn_stack_h_l207_c19_1fb8_index <= VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_index;
     -- Outputs
     VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output := stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output;

     -- Submodule level 1
     VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_index := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l208_c48_79e3_return_output, 8);
     -- stack_data_get[uxn_stack_h_l208_c20_6b94] LATENCY=0
     -- Clock enable
     stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE <= VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_CLOCK_ENABLE;
     -- Inputs
     stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index <= VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_stack_index;
     stack_data_get_uxn_stack_h_l208_c20_6b94_index <= VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_index;
     -- Outputs
     VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_return_output := stack_data_get_uxn_stack_h_l208_c20_6b94_return_output;

     -- CAST_TO_int32_t[uxn_stack_h_l207_c9_1bd8] LATENCY=0
     VAR_CAST_TO_int32_t_uxn_stack_h_l207_c9_1bd8_return_output := CAST_TO_int32_t_uint8_t(
     VAR_stack_data_get_uxn_stack_h_l207_c19_1fb8_return_output);

     -- Submodule level 2
     VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_x := VAR_CAST_TO_int32_t_uxn_stack_h_l207_c9_1bd8_return_output;
     REG_VAR_mem0 := VAR_CAST_TO_int32_t_uxn_stack_h_l207_c9_1bd8_return_output;
     -- CAST_TO_uint16_t[uxn_stack_h_l208_c9_0d6d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l208_c9_0d6d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_stack_data_get_uxn_stack_h_l208_c20_6b94_return_output);

     -- CONST_SL_8[uxn_stack_h_l209_c22_db00] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_stack_h_l209_c22_db00_x <= VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output := CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output;

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_right := VAR_CAST_TO_uint16_t_uxn_stack_h_l208_c9_0d6d_return_output;
     REG_VAR_mem1 := VAR_CAST_TO_uint16_t_uxn_stack_h_l208_c9_0d6d_return_output;
     -- CAST_TO_uint16_t[uxn_stack_h_l209_c11_a039] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_stack_h_l209_c11_a039_return_output := CAST_TO_uint16_t_int32_t(
     VAR_CONST_SL_8_uxn_stack_h_l209_c22_db00_return_output);

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_left := VAR_CAST_TO_uint16_t_uxn_stack_h_l209_c11_a039_return_output;
     -- BIN_OP_OR[uxn_stack_h_l209_c11_928d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_stack_h_l209_c11_928d_left <= VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_left;
     BIN_OP_OR_uxn_stack_h_l209_c11_928d_right <= VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output := BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output;

     -- Submodule level 5
     REG_VAR_result := VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output;
     VAR_return_output := VAR_BIN_OP_OR_uxn_stack_h_l209_c11_928d_return_output;
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
