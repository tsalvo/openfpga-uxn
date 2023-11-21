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
entity device_ram_0CLK_b45f1687 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 addr0 : in unsigned(31 downto 0);
 wr_data0 : in unsigned(7 downto 0);
 wr_en0 : in unsigned(0 downto 0);
 valid0 : in unsigned(0 downto 0);
 addr1 : in unsigned(31 downto 0);
 wr_data1 : in unsigned(7 downto 0);
 wr_en1 : in unsigned(0 downto 0);
 valid1 : in unsigned(0 downto 0);
 return_output : out device_ram_outputs_t);
end device_ram_0CLK_b45f1687;
architecture arch of device_ram_0CLK_b45f1687 is

  constant SIZE : integer := 256; 
  type ram_t is array(0 to SIZE-1) of uint8_t; 
  shared variable the_ram : ram_t := (others => (others => '0')); 
  -- Limit zero latency comb. read addr range to SIZE 
  -- since invalid addresses can occur as logic propogates 
  -- (this includes out of int32 range u32 values) 
  signal addr0_s : integer range 0 to SIZE-1 := 0; 
  signal addr1_s : integer range 0 to SIZE-1 := 0; 
begin 
  process(all) begin 
    addr0_s <= to_integer(addr0(30 downto 0)) 
    -- synthesis translate_off 
    mod SIZE 
    -- synthesis translate_on 
    ; 
    addr1_s <= to_integer(addr1(30 downto 0)) 
    -- synthesis translate_off 
    mod SIZE 
    -- synthesis translate_on 
    ; 
  end process; 
  process(clk) is 
  begin 
    if rising_edge(clk) then 
      if CLOCK_ENABLE(0)='1' then 
        return_output.valid0 <= valid0; 
        return_output.addr0 <= addr0; 
        return_output.wr_data0 <= wr_data0; 
        return_output.wr_en0 <= wr_en0; 
        return_output.rd_data0 <= the_ram(addr0_s); 
        if wr_en0(0) = '1' and valid0(0)='1' then 
          the_ram(addr0_s) := wr_data0; 
        end if; 
      end if; 
    end if; 
    if rising_edge(clk) then 
      if CLOCK_ENABLE(0)='1' then 
        return_output.valid1 <= valid1; 
        return_output.addr1 <= addr1; 
        return_output.wr_data1 <= wr_data1; 
        return_output.wr_en1 <= wr_en1; 
        return_output.rd_data1 <= the_ram(addr1_s); 
        if wr_en1(0) = '1' and valid1(0)='1' then 
          the_ram(addr1_s) := wr_data1; 
        end if; 
      end if; 
    end if; 
  end process; 

end arch;
