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
-- Submodules: 0
entity file_deo_0CLK_de264c78 is
port(
 file_index : in unsigned(0 downto 0);
 d : in unsigned(7 downto 0);
 p : in unsigned(7 downto 0));
end file_deo_0CLK_de264c78;
architecture arch of file_deo_0CLK_de264c78 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

begin



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 file_index,
 d,
 p)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_file_index : unsigned(0 downto 0);
 variable VAR_d : unsigned(7 downto 0);
 variable VAR_p : unsigned(7 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_file_index := file_index;
     VAR_d := d;
     VAR_p := p;

   end if;
 end loop;

end process;

end arch;
