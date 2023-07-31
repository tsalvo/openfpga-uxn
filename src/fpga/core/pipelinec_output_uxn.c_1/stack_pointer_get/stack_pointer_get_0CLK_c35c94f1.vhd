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
entity stack_pointer_get_0CLK_c35c94f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end stack_pointer_get_0CLK_c35c94f1;
architecture arch of stack_pointer_get_0CLK_c35c94f1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- stack_ptr_ram_read[uxn_stack_h_l197_c9_9202]
signal stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index : unsigned(0 downto 0);
signal stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_ptr_ram_read_uxn_stack_h_l197_c9_9202
stack_ptr_ram_read_uxn_stack_h_l197_c9_9202 : entity work.stack_ptr_ram_read_0CLK_8ab28aec port map (
clk,
stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE,
stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index,
stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 -- All submodule outputs
 stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index : unsigned(0 downto 0);
 variable VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output : unsigned(7 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;

     -- Submodule level 0
     VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index := VAR_stack_index;
     -- stack_ptr_ram_read[uxn_stack_h_l197_c9_9202] LATENCY=0
     -- Clock enable
     stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE <= VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_CLOCK_ENABLE;
     -- Inputs
     stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index <= VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_stack_index;
     -- Outputs
     VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output := stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output;

     -- Submodule level 1
     VAR_return_output := VAR_stack_ptr_ram_read_uxn_stack_h_l197_c9_9202_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
