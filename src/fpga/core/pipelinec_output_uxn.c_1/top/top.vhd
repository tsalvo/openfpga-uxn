library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top is
port(
clk_13p745 : in std_logic;

-- IO for each main func
uxn_top_is_visible_pixel : in unsigned(0 downto 0);
uxn_top_rom_load_valid_byte : in unsigned(0 downto 0);
uxn_top_rom_load_address : in unsigned(15 downto 0);
uxn_top_rom_load_value : in unsigned(7 downto 0);
uxn_top_return_output : out unsigned(15 downto 0)
  );
end top;
architecture arch of top is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;


begin

-- Instantiate each main
-- main functions are always clock enabled, always running
uxn_top_0CLK_27eedc4e : entity work.uxn_top_0CLK_27eedc4e port map (
clk_13p745,
to_unsigned(1,1),
uxn_top_is_visible_pixel,
uxn_top_rom_load_valid_byte,
uxn_top_rom_load_address,
uxn_top_rom_load_value,
uxn_top_return_output);


end arch;
