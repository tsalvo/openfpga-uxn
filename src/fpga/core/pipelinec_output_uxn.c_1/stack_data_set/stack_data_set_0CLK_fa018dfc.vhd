-- Timing params:
--   Fixed?: False
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
-- Submodules: 5
entity stack_data_set_0CLK_fa018dfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 index : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0));
end stack_data_set_0CLK_fa018dfc;
architecture arch of stack_data_set_0CLK_fa018dfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_EQ[uxn_stack_h_l174_c6_314c]
signal BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l174_c1_7477]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l176_c1_1a79]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output : unsigned(0 downto 0);

-- stack_w_ram_write[uxn_stack_h_l175_c3_56a9]
signal stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address : unsigned(7 downto 0);
signal stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value : unsigned(7 downto 0);

-- stack_r_ram_write[uxn_stack_h_l177_c3_879b]
signal stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_write_uxn_stack_h_l177_c3_879b_address : unsigned(7 downto 0);
signal stack_r_ram_write_uxn_stack_h_l177_c3_879b_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l174_c6_314c
BIN_OP_EQ_uxn_stack_h_l174_c6_314c : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left,
BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right,
BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output);

-- stack_w_ram_write_uxn_stack_h_l175_c3_56a9
stack_w_ram_write_uxn_stack_h_l175_c3_56a9 : entity work.stack_w_ram_write_0CLK_b45f1687 port map (
clk,
stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE,
stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address,
stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value);

-- stack_r_ram_write_uxn_stack_h_l177_c3_879b
stack_r_ram_write_uxn_stack_h_l177_c3_879b : entity work.stack_r_ram_write_0CLK_b45f1687 port map (
clk,
stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE,
stack_r_ram_write_uxn_stack_h_l177_c3_879b_address,
stack_r_ram_write_uxn_stack_h_l177_c3_879b_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 index,
 value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_index : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse : unsigned(0 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_address : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_index := index;
     VAR_value := value;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_address := VAR_index;
     VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address := VAR_index;
     VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left := VAR_stack_index;
     VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_value := VAR_value;
     VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value := VAR_value;
     -- BIN_OP_EQ[uxn_stack_h_l174_c6_314c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left <= VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_left;
     BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right <= VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output := BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond := VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond := VAR_BIN_OP_EQ_uxn_stack_h_l174_c6_314c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l176_c1_1a79] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l174_c1_7477] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output;

     -- Submodule level 2
     VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l176_c1_1a79_return_output;
     VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l174_c1_7477_return_output;
     -- stack_w_ram_write[uxn_stack_h_l175_c3_56a9] LATENCY=0
     -- Clock enable
     stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE <= VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address <= VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_address;
     stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value <= VAR_stack_w_ram_write_uxn_stack_h_l175_c3_56a9_value;
     -- Outputs

     -- stack_r_ram_write[uxn_stack_h_l177_c3_879b] LATENCY=0
     -- Clock enable
     stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE <= VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_write_uxn_stack_h_l177_c3_879b_address <= VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_address;
     stack_r_ram_write_uxn_stack_h_l177_c3_879b_value <= VAR_stack_r_ram_write_uxn_stack_h_l177_c3_879b_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;