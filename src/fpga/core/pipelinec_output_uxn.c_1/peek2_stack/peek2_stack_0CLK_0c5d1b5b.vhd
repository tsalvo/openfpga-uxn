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
-- Submodules: 1
entity peek2_stack_0CLK_0c5d1b5b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end peek2_stack_0CLK_0c5d1b5b;
architecture arch of peek2_stack_0CLK_0c5d1b5b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- stack_data_get2[uxn_stack_h_l235_c9_2039]
signal stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index : unsigned(0 downto 0);
signal stack_data_get2_uxn_stack_h_l235_c9_2039_address : unsigned(7 downto 0);
signal stack_data_get2_uxn_stack_h_l235_c9_2039_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_data_get2_uxn_stack_h_l235_c9_2039
stack_data_get2_uxn_stack_h_l235_c9_2039 : entity work.stack_data_get2_0CLK_9b5e2ef9 port map (
clk,
stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE,
stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index,
stack_data_get2_uxn_stack_h_l235_c9_2039_address,
stack_data_get2_uxn_stack_h_l235_c9_2039_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 -- All submodule outputs
 stack_data_get2_uxn_stack_h_l235_c9_2039_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_address : unsigned(7 downto 0);
 variable VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_return_output : unsigned(15 downto 0);
begin

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
     VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_address := VAR_address;
     VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index := VAR_stack_index;
     -- stack_data_get2[uxn_stack_h_l235_c9_2039] LATENCY=0
     -- Clock enable
     stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE <= VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_CLOCK_ENABLE;
     -- Inputs
     stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index <= VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_stack_index;
     stack_data_get2_uxn_stack_h_l235_c9_2039_address <= VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_address;
     -- Outputs
     VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_return_output := stack_data_get2_uxn_stack_h_l235_c9_2039_return_output;

     -- Submodule level 1
     VAR_return_output := VAR_stack_data_get2_uxn_stack_h_l235_c9_2039_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
