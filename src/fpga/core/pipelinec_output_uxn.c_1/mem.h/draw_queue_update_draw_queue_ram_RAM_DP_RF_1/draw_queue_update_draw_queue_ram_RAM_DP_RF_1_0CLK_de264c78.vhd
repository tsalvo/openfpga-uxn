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
entity draw_queue_update_draw_queue_ram_RAM_DP_RF_1_0CLK_de264c78 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr_r0 : in unsigned(12 downto 0);
 addr_w0 : in unsigned(12 downto 0);
 wd : in unsigned(23 downto 0);
 we : in unsigned(0 downto 0);
 return_output : out unsigned(23 downto 0));
end draw_queue_update_draw_queue_ram_RAM_DP_RF_1_0CLK_de264c78;
architecture arch of draw_queue_update_draw_queue_ram_RAM_DP_RF_1_0CLK_de264c78 is

  signal addr_w : unsigned(12 downto 0) := to_unsigned(0, 13);
  signal addr_r : unsigned(12 downto 0) := to_unsigned(0, 13);

  signal draw_queue_ram : uint24_t_8192 := (others => to_unsigned(0, 24));

    signal return_output_r : unsigned(23 downto 0) := to_unsigned(0, 24);
begin


addr_r <= addr_r0 ;
    addr_w <= addr_w0 ;

        process(clk)
        begin
          if rising_edge(clk) then
            if CLOCK_ENABLE(0)='1' then
              -- Write port
              if we(0) = '1' then
                draw_queue_ram(to_integer(addr_w)) <= wd;
              end if;

              -- Read port
              return_output_r <= draw_queue_ram(to_integer(addr_r));
            end if;
          end if;
        end process;
        -- Tie output reg to output
        return_output <= return_output_r;
      
end arch;
