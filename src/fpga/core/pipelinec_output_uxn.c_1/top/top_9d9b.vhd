library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top_9d9b is
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
end top_9d9b;
architecture arch of top_9d9b is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;

signal uxn_top_0CLK_069f88ea_controller0_up_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_up_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_up_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_up_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_down_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_down_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_down_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_down_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_left_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_left_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_left_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_left_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_right_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_right_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_right_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_right_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_a_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_a_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_a_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_a_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_b_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_b_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_b_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_b_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_x_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_x_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_x_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_x_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_y_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_y_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_y_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_y_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_l_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_l_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_l_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_l_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_r_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_r_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_r_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_r_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_select_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_select_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_select_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_select_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_controller0_start_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_controller0_start_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_controller0_start_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_controller0_start_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
attribute syn_keep of uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_rom_load_address_input_reg : unsigned(15 downto 0) := to_unsigned(0, 16);
attribute syn_keep of uxn_top_0CLK_069f88ea_rom_load_address_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_rom_load_address_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_rom_load_address_input_reg : signal is "true";
signal uxn_top_0CLK_069f88ea_rom_load_value_input_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
attribute syn_keep of uxn_top_0CLK_069f88ea_rom_load_value_input_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_rom_load_value_input_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_rom_load_value_input_reg : signal is "true";

signal uxn_top_return_output_output : unsigned(15 downto 0);
signal uxn_top_0CLK_069f88ea_return_output_output_reg : unsigned(15 downto 0);
attribute syn_keep of uxn_top_0CLK_069f88ea_return_output_output_reg : signal is true;
attribute keep of uxn_top_0CLK_069f88ea_return_output_output_reg : signal is "true";
attribute dont_touch of uxn_top_0CLK_069f88ea_return_output_output_reg : signal is "true";


begin

 -- IO regs
 process(clk_None) is
 begin
  if rising_edge(clk_None) then
   uxn_top_0CLK_069f88ea_controller0_up_input_reg <= uxn_top_controller0_up;
   uxn_top_0CLK_069f88ea_controller0_down_input_reg <= uxn_top_controller0_down;
   uxn_top_0CLK_069f88ea_controller0_left_input_reg <= uxn_top_controller0_left;
   uxn_top_0CLK_069f88ea_controller0_right_input_reg <= uxn_top_controller0_right;
   uxn_top_0CLK_069f88ea_controller0_a_input_reg <= uxn_top_controller0_a;
   uxn_top_0CLK_069f88ea_controller0_b_input_reg <= uxn_top_controller0_b;
   uxn_top_0CLK_069f88ea_controller0_x_input_reg <= uxn_top_controller0_x;
   uxn_top_0CLK_069f88ea_controller0_y_input_reg <= uxn_top_controller0_y;
   uxn_top_0CLK_069f88ea_controller0_l_input_reg <= uxn_top_controller0_l;
   uxn_top_0CLK_069f88ea_controller0_r_input_reg <= uxn_top_controller0_r;
   uxn_top_0CLK_069f88ea_controller0_select_input_reg <= uxn_top_controller0_select;
   uxn_top_0CLK_069f88ea_controller0_start_input_reg <= uxn_top_controller0_start;
   uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg <= uxn_top_is_visible_pixel;
   uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg <= uxn_top_is_double_buffer_enabled;
   uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg <= uxn_top_rom_load_valid_byte;
   uxn_top_0CLK_069f88ea_rom_load_address_input_reg <= uxn_top_rom_load_address;
   uxn_top_0CLK_069f88ea_rom_load_value_input_reg <= uxn_top_rom_load_value;
   uxn_top_0CLK_069f88ea_return_output_output_reg <= uxn_top_return_output_output;
  end if;
 end process;
 uxn_top_return_output <= uxn_top_0CLK_069f88ea_return_output_output_reg;

-- Instantiate each main
-- main functions are always clock enabled, always running
uxn_top_0CLK_069f88ea : entity work.uxn_top_0CLK_069f88ea port map (
clk_None,
to_unsigned(1,1),
uxn_top_0CLK_069f88ea_controller0_up_input_reg,
uxn_top_0CLK_069f88ea_controller0_down_input_reg,
uxn_top_0CLK_069f88ea_controller0_left_input_reg,
uxn_top_0CLK_069f88ea_controller0_right_input_reg,
uxn_top_0CLK_069f88ea_controller0_a_input_reg,
uxn_top_0CLK_069f88ea_controller0_b_input_reg,
uxn_top_0CLK_069f88ea_controller0_x_input_reg,
uxn_top_0CLK_069f88ea_controller0_y_input_reg,
uxn_top_0CLK_069f88ea_controller0_l_input_reg,
uxn_top_0CLK_069f88ea_controller0_r_input_reg,
uxn_top_0CLK_069f88ea_controller0_select_input_reg,
uxn_top_0CLK_069f88ea_controller0_start_input_reg,
uxn_top_0CLK_069f88ea_is_visible_pixel_input_reg,
uxn_top_0CLK_069f88ea_is_double_buffer_enabled_input_reg,
uxn_top_0CLK_069f88ea_rom_load_valid_byte_input_reg,
uxn_top_0CLK_069f88ea_rom_load_address_input_reg,
uxn_top_0CLK_069f88ea_rom_load_value_input_reg,
uxn_top_return_output_output);


end arch;
