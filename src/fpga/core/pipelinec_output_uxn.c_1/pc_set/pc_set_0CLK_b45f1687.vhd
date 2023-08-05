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
entity pc_set_0CLK_b45f1687 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 value : in unsigned(15 downto 0));
end pc_set_0CLK_b45f1687;
architecture arch of pc_set_0CLK_b45f1687 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- prog_ctr_ram_write[uxn_pc_h_l77_c2_f5d6]
signal prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6
prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6 : entity work.prog_ctr_ram_write_0CLK_de264c78 port map (
clk,
prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE,
prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 value)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_value := value;

     -- Submodule level 0
     VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value := VAR_value;
     -- prog_ctr_ram_write[uxn_pc_h_l77_c2_f5d6] LATENCY=0
     -- Clock enable
     prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE <= VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value <= VAR_prog_ctr_ram_write_uxn_pc_h_l77_c2_f5d6_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;
