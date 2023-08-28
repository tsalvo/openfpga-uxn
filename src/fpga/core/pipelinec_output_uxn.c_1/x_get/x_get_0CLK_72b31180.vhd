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
entity x_get_0CLK_72b31180 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end x_get_0CLK_72b31180;
architecture arch of x_get_0CLK_72b31180 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- screen_xy_ram_update[uxn_ram_device_h_l46_c9_5550]
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address : unsigned(0 downto 0);
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value : unsigned(15 downto 0);
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable : unsigned(0 downto 0);
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable : unsigned(0 downto 0);
signal screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550 : entity work.screen_xy_ram_update_0CLK_99656e7d port map (
clk,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable,
screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- All submodule outputs
 screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value : unsigned(15 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable := to_unsigned(1, 1);
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable := to_unsigned(0, 1);
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value := resize(to_unsigned(0, 1), 16);
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- screen_xy_ram_update[uxn_ram_device_h_l46_c9_5550] LATENCY=0
     -- Clock enable
     screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE <= VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_CLOCK_ENABLE;
     -- Inputs
     screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address <= VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_address;
     screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value <= VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_value;
     screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable <= VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_write0_enable;
     screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable <= VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_read1_enable;
     -- Outputs
     VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output := screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output;

     -- Submodule level 1
     VAR_return_output := VAR_screen_xy_ram_update_uxn_ram_device_h_l46_c9_5550_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
