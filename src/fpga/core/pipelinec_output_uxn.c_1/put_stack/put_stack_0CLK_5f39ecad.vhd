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
-- Submodules: 4
entity put_stack_0CLK_5f39ecad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 offset : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0));
end put_stack_0CLK_5f39ecad;
architecture arch of put_stack_0CLK_5f39ecad is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal put_tmp : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_put_tmp : unsigned(7 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l312_c12_3ae8]
signal stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l312_c12_d3a3]
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l312_c12_596a]
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_stack_h_l313_c2_c7d6]
signal stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l313_c2_c7d6_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l313_c2_c7d6_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l312_c12_3ae8
stack_pointer_get_uxn_stack_h_l312_c12_3ae8 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index,
stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3
BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left,
BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right,
BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l312_c12_596a
BIN_OP_MINUS_uxn_stack_h_l312_c12_596a : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left,
BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right,
BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output);

-- stack_data_set_uxn_stack_h_l313_c2_c7d6
stack_data_set_uxn_stack_h_l313_c2_c7d6 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index,
stack_data_set_uxn_stack_h_l313_c2_c7d6_index,
stack_data_set_uxn_stack_h_l313_c2_c7d6_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 offset,
 value,
 -- Registers
 put_tmp,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output,
 BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output,
 BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_offset : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_value : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_put_tmp : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_put_tmp := put_tmp;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_offset := offset;
     VAR_value := value;

     -- Submodule level 0
     VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right := VAR_offset;
     VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_value := VAR_value;
     -- stack_pointer_get[uxn_stack_h_l312_c12_3ae8] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output := stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left := VAR_stack_pointer_get_uxn_stack_h_l312_c12_3ae8_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l312_c12_d3a3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_left;
     BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output := BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output;

     -- Submodule level 2
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left := VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_d3a3_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l312_c12_596a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_left;
     BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output := BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output;

     -- Submodule level 3
     REG_VAR_put_tmp := VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output;
     VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_index := VAR_BIN_OP_MINUS_uxn_stack_h_l312_c12_596a_return_output;
     -- stack_data_set[uxn_stack_h_l313_c2_c7d6] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index <= VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_stack_index;
     stack_data_set_uxn_stack_h_l313_c2_c7d6_index <= VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_index;
     stack_data_set_uxn_stack_h_l313_c2_c7d6_value <= VAR_stack_data_set_uxn_stack_h_l313_c2_c7d6_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_put_tmp <= REG_VAR_put_tmp;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     put_tmp <= REG_COMB_put_tmp;
 end if;
 end if;
end process;

end arch;
