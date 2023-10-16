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
-- Submodules: 0
entity device_ram_update_device_ram_RAM_SP_RF_1_0CLK_de264c78 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr0 : in unsigned(7 downto 0);
 wd : in unsigned(7 downto 0);
 we : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end device_ram_update_device_ram_RAM_SP_RF_1_0CLK_de264c78;
architecture arch of device_ram_update_device_ram_RAM_SP_RF_1_0CLK_de264c78 is

  signal addr : unsigned(7 downto 0) := to_unsigned(0, 8);

  signal device_ram : uint8_t_256 := (others => to_unsigned(0, 8));

    signal return_output_r : unsigned(7 downto 0) := to_unsigned(0, 8);
begin


addr <= addr0 ;

      process(clk) is
      begin
        if rising_edge(clk) then
          if CLOCK_ENABLE(0)='1' then            
            -- Read first
            return_output_r <= device_ram(to_integer(addr));
            -- RAM logic    
            if we(0) = '1' then
              device_ram(to_integer(addr)) <= wd; 
            end if;
          end if;
        end if;
      end process;
      -- Tie output reg to output
      return_output <= return_output_r;
      
end arch;
