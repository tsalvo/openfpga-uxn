library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top is
port(
clk_None : in std_logic;

-- IO for each main func
uxn_top_controller0_up : in unsigned(0 downto 0);
uxn_top_controller0_down : in unsigned(0 downto 0);
uxn_top_controller0_left : in unsigned(0 downto 0);
uxn_top_controller0_right : in unsigned(0 downto 0);
uxn_top_controller0_a : in unsigned(0 downto 0);
uxn_top_controller0_b : in unsigned(0 downto 0);
uxn_top_controller0_x : in unsigned(0 downto 0);
uxn_top_controller0_y : in unsigned(0 downto 0);
uxn_top_controller0_l : in unsigned(0 downto 0);
uxn_top_controller0_r : in unsigned(0 downto 0);
uxn_top_controller0_select : in unsigned(0 downto 0);
uxn_top_controller0_start : in unsigned(0 downto 0);
uxn_top_is_visible_pixel : in unsigned(0 downto 0);
uxn_top_is_double_buffer_enabled : in unsigned(0 downto 0);
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
uxn_top_0CLK_298106c8 : entity work.uxn_top_0CLK_298106c8 port map (
clk_None,
to_unsigned(1,1),
uxn_top_controller0_up,
uxn_top_controller0_down,
uxn_top_controller0_left,
uxn_top_controller0_right,
uxn_top_controller0_a,
uxn_top_controller0_b,
uxn_top_controller0_x,
uxn_top_controller0_y,
uxn_top_controller0_l,
uxn_top_controller0_r,
uxn_top_controller0_select,
uxn_top_controller0_start,
uxn_top_is_visible_pixel,
uxn_top_is_double_buffer_enabled,
uxn_top_rom_load_valid_byte,
uxn_top_rom_load_address,
uxn_top_rom_load_value,
uxn_top_return_output);


end arch;
