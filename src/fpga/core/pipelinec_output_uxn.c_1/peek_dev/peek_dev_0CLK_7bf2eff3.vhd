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
-- Submodules: 2
entity peek_dev_0CLK_7bf2eff3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end peek_dev_0CLK_7bf2eff3;
architecture arch of peek_dev_0CLK_7bf2eff3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ram_read : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_ram_read : unsigned(15 downto 0);

-- Each function instance gets signals
-- device_ram_update[uxn_ram_device_h_l56_c13_9a79]
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- device_ram_update_uxn_ram_device_h_l56_c13_9a79
device_ram_update_uxn_ram_device_h_l56_c13_9a79 : entity work.device_ram_update_0CLK_c464aa95 port map (
clk,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable,
device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 -- Registers
 ram_read,
 -- All submodule outputs
 device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_ram_device_h_l57_c9_cb66_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_ram_read : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ram_read := ram_read;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value := resize(to_unsigned(0, 1), 8);
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable := to_unsigned(0, 1);
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0 := resize(to_unsigned(0, 1), 8);
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable := to_unsigned(1, 1);
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1 := VAR_address;
     -- device_ram_update[uxn_ram_device_h_l56_c13_9a79] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0 <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address0;
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_value;
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_write0_enable;
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read0_enable;
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1 <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_address1;
     device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable <= VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output := device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output;

     -- Submodule level 1
     REG_VAR_ram_read := VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output;
     -- CAST_TO_uint8_t[uxn_ram_device_h_l57_c9_cb66] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_ram_device_h_l57_c9_cb66_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_device_ram_update_uxn_ram_device_h_l56_c13_9a79_return_output);

     -- Submodule level 2
     VAR_return_output := VAR_CAST_TO_uint8_t_uxn_ram_device_h_l57_c9_cb66_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ram_read <= REG_VAR_ram_read;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ram_read <= REG_COMB_ram_read;
 end if;
 end if;
end process;

end arch;
