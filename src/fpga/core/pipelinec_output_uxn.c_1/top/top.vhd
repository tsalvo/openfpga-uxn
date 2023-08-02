library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top is
port(
clk_12p287999 : in std_logic;

-- IO for each main func
uxn_eval_return_output : out unsigned(7 downto 0)
  );
end top;
architecture arch of top is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;


begin

-- Instantiate each main
-- main functions are always clock enabled, always running
uxn_eval_0CLK_6e86a93e : entity work.uxn_eval_0CLK_6e86a93e port map (
clk_12p287999,
to_unsigned(1,1),
uxn_eval_return_output);


end arch;
