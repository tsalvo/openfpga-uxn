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
-- BIN_OP_EQ[uxn_stack_h_l162_c6_7644]
signal BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l162_c1_813b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l164_c1_e898]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output : unsigned(0 downto 0);

-- stack_w_ram_write[uxn_stack_h_l163_c3_8aec]
signal stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address : unsigned(7 downto 0);
signal stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value : unsigned(7 downto 0);

-- stack_r_ram_write[uxn_stack_h_l165_c3_9730]
signal stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_write_uxn_stack_h_l165_c3_9730_address : unsigned(7 downto 0);
signal stack_r_ram_write_uxn_stack_h_l165_c3_9730_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l162_c6_7644
BIN_OP_EQ_uxn_stack_h_l162_c6_7644 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left,
BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right,
BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output);

-- stack_w_ram_write_uxn_stack_h_l163_c3_8aec
stack_w_ram_write_uxn_stack_h_l163_c3_8aec : entity work.stack_w_ram_write_0CLK_b45f1687 port map (
clk,
stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE,
stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address,
stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value);

-- stack_r_ram_write_uxn_stack_h_l165_c3_9730
stack_r_ram_write_uxn_stack_h_l165_c3_9730 : entity work.stack_r_ram_write_0CLK_b45f1687 port map (
clk,
stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE,
stack_r_ram_write_uxn_stack_h_l165_c3_9730_address,
stack_r_ram_write_uxn_stack_h_l165_c3_9730_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 index,
 value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_index : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse : unsigned(0 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_address : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_address := VAR_index;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address := VAR_index;
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left := VAR_stack_index;
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_value := VAR_value;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value := VAR_value;
     -- BIN_OP_EQ[uxn_stack_h_l162_c6_7644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left <= VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_left;
     BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right <= VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output := BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond := VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond := VAR_BIN_OP_EQ_uxn_stack_h_l162_c6_7644_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l162_c1_813b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l164_c1_e898] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output;

     -- Submodule level 2
     VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l164_c1_e898_return_output;
     VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l162_c1_813b_return_output;
     -- stack_w_ram_write[uxn_stack_h_l163_c3_8aec] LATENCY=0
     -- Clock enable
     stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_address;
     stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value <= VAR_stack_w_ram_write_uxn_stack_h_l163_c3_8aec_value;
     -- Outputs

     -- stack_r_ram_write[uxn_stack_h_l165_c3_9730] LATENCY=0
     -- Clock enable
     stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_write_uxn_stack_h_l165_c3_9730_address <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_address;
     stack_r_ram_write_uxn_stack_h_l165_c3_9730_value <= VAR_stack_r_ram_write_uxn_stack_h_l165_c3_9730_value;
     -- Outputs

   end if;
 end loop;

end process;

end arch;
