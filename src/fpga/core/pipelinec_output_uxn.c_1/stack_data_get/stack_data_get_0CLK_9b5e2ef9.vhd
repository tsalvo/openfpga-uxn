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
-- Submodules: 6
entity stack_data_get_0CLK_9b5e2ef9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end stack_data_get_0CLK_9b5e2ef9;
architecture arch of stack_data_get_0CLK_9b5e2ef9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_data_ret_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_stack_data_ret_value : unsigned(7 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_stack_h_l191_c6_1f1d]
signal BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l191_c1_4222]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l193_c1_a2d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output : unsigned(0 downto 0);

-- stack_data_ret_value_MUX[uxn_stack_h_l191_c2_b52a]
signal stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond : unsigned(0 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output : unsigned(7 downto 0);

-- peek_stack_w[uxn_stack_h_l192_c26_c5f1]
signal peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_stack_w_uxn_stack_h_l192_c26_c5f1_address : unsigned(7 downto 0);
signal peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output : unsigned(7 downto 0);

-- peek_stack_r[uxn_stack_h_l194_c26_733e]
signal peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_stack_r_uxn_stack_h_l194_c26_733e_address : unsigned(7 downto 0);
signal peek_stack_r_uxn_stack_h_l194_c26_733e_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d
BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left,
BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right,
BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output);

-- stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a
stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond,
stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue,
stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse,
stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output);

-- peek_stack_w_uxn_stack_h_l192_c26_c5f1
peek_stack_w_uxn_stack_h_l192_c26_c5f1 : entity work.peek_stack_w_0CLK_7bf2eff3 port map (
clk,
peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE,
peek_stack_w_uxn_stack_h_l192_c26_c5f1_address,
peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output);

-- peek_stack_r_uxn_stack_h_l194_c26_733e
peek_stack_r_uxn_stack_h_l194_c26_733e : entity work.peek_stack_r_0CLK_7bf2eff3 port map (
clk,
peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE,
peek_stack_r_uxn_stack_h_l194_c26_733e_address,
peek_stack_r_uxn_stack_h_l194_c26_733e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 -- Registers
 stack_data_ret_value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output,
 stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output,
 peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output,
 peek_stack_r_uxn_stack_h_l194_c26_733e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond : unsigned(0 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_address : unsigned(7 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output : unsigned(7 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_address : unsigned(7 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_data_ret_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_data_ret_value := stack_data_ret_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_address := address;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_address := VAR_address;
     VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_address := VAR_address;
     VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left := VAR_stack_index;
     -- BIN_OP_EQ[uxn_stack_h_l191_c6_1f1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left <= VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_left;
     BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right <= VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output := BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond := VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond := VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond := VAR_BIN_OP_EQ_uxn_stack_h_l191_c6_1f1d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l193_c1_a2d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l191_c1_4222] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output;

     -- Submodule level 2
     VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l193_c1_a2d6_return_output;
     VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l191_c1_4222_return_output;
     -- peek_stack_r[uxn_stack_h_l194_c26_733e] LATENCY=0
     -- Clock enable
     peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE <= VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_CLOCK_ENABLE;
     -- Inputs
     peek_stack_r_uxn_stack_h_l194_c26_733e_address <= VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_address;
     -- Outputs
     VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_return_output := peek_stack_r_uxn_stack_h_l194_c26_733e_return_output;

     -- peek_stack_w[uxn_stack_h_l192_c26_c5f1] LATENCY=0
     -- Clock enable
     peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE <= VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_CLOCK_ENABLE;
     -- Inputs
     peek_stack_w_uxn_stack_h_l192_c26_c5f1_address <= VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_address;
     -- Outputs
     VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output := peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output;

     -- Submodule level 3
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse := VAR_peek_stack_r_uxn_stack_h_l194_c26_733e_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue := VAR_peek_stack_w_uxn_stack_h_l192_c26_c5f1_return_output;
     -- stack_data_ret_value_MUX[uxn_stack_h_l191_c2_b52a] LATENCY=0
     -- Inputs
     stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_cond;
     stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iftrue;
     stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_iffalse;
     -- Outputs
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output := stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output;
     REG_VAR_stack_data_ret_value := VAR_stack_data_ret_value_MUX_uxn_stack_h_l191_c2_b52a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_stack_data_ret_value <= REG_VAR_stack_data_ret_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     stack_data_ret_value <= REG_COMB_stack_data_ret_value;
 end if;
 end if;
end process;

end arch;
