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
entity pc_get_0CLK_9859a581 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end pc_get_0CLK_9859a581;
architecture arch of pc_get_0CLK_9859a581 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- prog_ctr_ram_update[uxn_pc_h_l43_c9_a141]
signal prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value : unsigned(15 downto 0);
signal prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable : unsigned(0 downto 0);
signal prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable : unsigned(0 downto 0);
signal prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_update_uxn_pc_h_l43_c9_a141
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141 : entity work.prog_ctr_ram_update_0CLK_3bd6f176 port map (
clk,
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE,
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value,
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable,
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable,
prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- All submodule outputs
 prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable := to_unsigned(1, 1);
     VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value := resize(to_unsigned(0, 1), 16);
     VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- prog_ctr_ram_update[uxn_pc_h_l43_c9_a141] LATENCY=0
     -- Clock enable
     prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE <= VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value <= VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_value;
     prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable <= VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_write0_enable;
     prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable <= VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_read1_enable;
     -- Outputs
     VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output := prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output;

     -- Submodule level 1
     VAR_return_output := VAR_prog_ctr_ram_update_uxn_pc_h_l43_c9_a141_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
