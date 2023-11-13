library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top_0bde is
port(
clk_49p152 : in std_logic;

-- IO for each main func
uxn_top_code : in unsigned(3 downto 0);
uxn_top_is_visible_pixel : in unsigned(0 downto 0);
uxn_top_rom_load_valid_byte : in unsigned(0 downto 0);
uxn_top_rom_load_address : in unsigned(15 downto 0);
uxn_top_rom_load_value : in unsigned(7 downto 0);
uxn_top_return_output : out unsigned(15 downto 0)
  );
end top_0bde;
architecture arch of top_0bde is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;

signal uxn_top_0CLK_dd8c04b0_code_input_reg : unsigned(3 downto 0) := to_unsigned(0, 4);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_code_input_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_code_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_code_input_reg : signal is "true";
signal uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg : signal is "true";
signal uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg : signal is "true";
signal uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg : unsigned(15 downto 0) := to_unsigned(0, 16);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg : signal is "true";
signal uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg : signal is "true";

signal uxn_top_return_output_output : unsigned(15 downto 0);
signal uxn_top_0CLK_dd8c04b0_return_output_output_reg : unsigned(15 downto 0);
attribute syn_keep of uxn_top_0CLK_dd8c04b0_return_output_output_reg : signal is true;
attribute keep of uxn_top_0CLK_dd8c04b0_return_output_output_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_dd8c04b0_return_output_output_reg : signal is "true";


begin

 -- IO regs
 process(clk_49p152) is
 begin
  if rising_edge(clk_49p152) then
   uxn_top_0CLK_dd8c04b0_code_input_reg <= uxn_top_code;
   uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg <= uxn_top_is_visible_pixel;
   uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg <= uxn_top_rom_load_valid_byte;
   uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg <= uxn_top_rom_load_address;
   uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg <= uxn_top_rom_load_value;
   uxn_top_0CLK_dd8c04b0_return_output_output_reg <= uxn_top_return_output_output;
  end if;
 end process;
 uxn_top_return_output <= uxn_top_0CLK_dd8c04b0_return_output_output_reg;

-- Instantiate each main
-- main functions are always clock enabled, always running
uxn_top_0CLK_dd8c04b0 : entity work.uxn_top_0CLK_dd8c04b0 port map (
clk_49p152,
to_unsigned(1,1),
uxn_top_0CLK_dd8c04b0_code_input_reg,
uxn_top_0CLK_dd8c04b0_is_visible_pixel_input_reg,
uxn_top_0CLK_dd8c04b0_rom_load_valid_byte_input_reg,
uxn_top_0CLK_dd8c04b0_rom_load_address_input_reg,
uxn_top_0CLK_dd8c04b0_rom_load_value_input_reg,
uxn_top_return_output_output);


end arch;
