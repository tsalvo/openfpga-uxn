library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;

  entity top_56f6 is
port(
clk_44p28 : in std_logic;

-- IO for each main func
uxn_eval_input : in unsigned(15 downto 0);
uxn_eval_return_output : out unsigned(15 downto 0)
  );
end top_56f6;
architecture arch of top_56f6 is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;

signal uxn_eval_0CLK_b89d25e1_input_input_reg : unsigned(15 downto 0) := to_unsigned(0, 16);
attribute syn_keep of uxn_eval_0CLK_b89d25e1_input_input_reg : signal is true;
attribute keep of uxn_eval_0CLK_b89d25e1_input_input_reg : signal is "true";
attribute dont_touch of uxn_eval_0CLK_b89d25e1_input_input_reg : signal is "true";

signal uxn_eval_return_output_output : unsigned(15 downto 0);
signal uxn_eval_0CLK_b89d25e1_return_output_output_reg : unsigned(15 downto 0);
attribute syn_keep of uxn_eval_0CLK_b89d25e1_return_output_output_reg : signal is true;
attribute keep of uxn_eval_0CLK_b89d25e1_return_output_output_reg : signal is "true";
attribute dont_touch of uxn_eval_0CLK_b89d25e1_return_output_output_reg : signal is "true";


begin

 -- IO regs
 process(clk_44p28) is
 begin
  if rising_edge(clk_44p28) then
   uxn_eval_0CLK_b89d25e1_input_input_reg <= uxn_eval_input;
   uxn_eval_0CLK_b89d25e1_return_output_output_reg <= uxn_eval_return_output_output;
  end if;
 end process;
 uxn_eval_return_output <= uxn_eval_0CLK_b89d25e1_return_output_output_reg;

-- Instantiate each main
-- main functions are always clock enabled, always running
uxn_eval_0CLK_b89d25e1 : entity work.uxn_eval_0CLK_b89d25e1 port map (
clk_44p28,
to_unsigned(1,1),
uxn_eval_0CLK_b89d25e1_input_input_reg,
uxn_eval_return_output_output);


end arch;