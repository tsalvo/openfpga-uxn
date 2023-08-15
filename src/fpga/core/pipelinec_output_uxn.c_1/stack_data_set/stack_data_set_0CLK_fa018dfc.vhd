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
-- BIN_OP_EQ[uxn_stack_h_l162_c6_76f1]
signal BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l162_c1_98ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l164_c1_1ce4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output : unsigned(0 downto 0);

-- stack_w_ram_write[uxn_stack_h_l163_c3_f666]
signal stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_write_uxn_stack_h_l163_c3_f666_address : unsigned(7 downto 0);
signal stack_w_ram_write_uxn_stack_h_l163_c3_f666_value : unsigned(7 downto 0);

-- stack_r_ram_write[uxn_stack_h_l165_c3_2da3]
signal stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address : unsigned(7 downto 0);
signal stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l162_c6_76f1
BIN_OP_EQ_uxn_stack_h_l162_c6_76f1 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left,
BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right,
BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output);

-- stack_w_ram_write_uxn_stack_h_l163_c3_f666
stack_w_ram_write_uxn_stack_h_l163_c3_f666 : entity work.stack_w_ram_write_0CLK_b45f1687 port map (
clk,
stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE,
stack_w_ram_write_uxn_stack_h_l163_c3_f666_address,
stack_w_ram_write_uxn_stack_h_l163_c3_f666_value);

-- stack_r_ram_write_uxn_stack_h_l165_c3_2da3
stack_r_ram_write_uxn_stack_h_l165_c3_2da3 : entity work.stack_r_ram_write_0CLK_b45f1687 port map (
clk,
stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE,
stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address,
stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 index,
 value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_index : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse : unsigned(0 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address := VAR_index;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_address := VAR_index;
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left := VAR_stack_index;
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value := VAR_value;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_value := VAR_value;
     -- BIN_OP_EQ[uxn_stack_h_l162_c6_76f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left <= VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_left;
     BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right <= VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output := BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond := VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond := VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_76f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l164_c1_1ce4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l162_c1_98ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output;

     -- Submodule level 2
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_1ce4_return_output;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_98ad_return_output;
     -- stack_r_ram_write[uxn_stack_h_l165_c3_2da3] LATENCY=0
     -- Clock enable
     stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_address;
     stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_2da3_value;
     -- Outputs

     -- stack_w_ram_write[uxn_stack_h_l163_c3_f666] LATENCY=0
     -- Clock enable
     stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_write_uxn_stack_h_l163_c3_f666_address <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_address;
     stack_w_ram_write_uxn_stack_h_l163_c3_f666_value <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_f666_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;
