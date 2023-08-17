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
-- BIN_OP_EQ[uxn_stack_h_l199_c6_7cbc]
signal BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l199_c1_372f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l201_c1_6ea7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output : unsigned(0 downto 0);

-- stack_data_ret_value_MUX[uxn_stack_h_l199_c2_47c3]
signal stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond : unsigned(0 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output : unsigned(7 downto 0);

-- peek_stack_w[uxn_stack_h_l200_c26_1127]
signal peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_stack_w_uxn_stack_h_l200_c26_1127_address : unsigned(7 downto 0);
signal peek_stack_w_uxn_stack_h_l200_c26_1127_return_output : unsigned(7 downto 0);

-- peek_stack_r[uxn_stack_h_l202_c26_d473]
signal peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_stack_r_uxn_stack_h_l202_c26_d473_address : unsigned(7 downto 0);
signal peek_stack_r_uxn_stack_h_l202_c26_d473_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc
BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left,
BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right,
BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output);

-- stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3
stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond,
stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue,
stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse,
stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output);

-- peek_stack_w_uxn_stack_h_l200_c26_1127
peek_stack_w_uxn_stack_h_l200_c26_1127 : entity work.peek_stack_w_0CLK_7bf2eff3 port map (
clk,
peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE,
peek_stack_w_uxn_stack_h_l200_c26_1127_address,
peek_stack_w_uxn_stack_h_l200_c26_1127_return_output);

-- peek_stack_r_uxn_stack_h_l202_c26_d473
peek_stack_r_uxn_stack_h_l202_c26_d473 : entity work.peek_stack_r_0CLK_7bf2eff3 port map (
clk,
peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE,
peek_stack_r_uxn_stack_h_l202_c26_d473_address,
peek_stack_r_uxn_stack_h_l202_c26_d473_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 -- Registers
 stack_data_ret_value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output,
 stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output,
 peek_stack_w_uxn_stack_h_l200_c26_1127_return_output,
 peek_stack_r_uxn_stack_h_l202_c26_d473_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond : unsigned(0 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_address : unsigned(7 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_return_output : unsigned(7 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_address : unsigned(7 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_data_ret_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_data_ret_value := stack_data_ret_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_address := VAR_address;
     VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_address := VAR_address;
     VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left := VAR_stack_index;
     -- BIN_OP_EQ[uxn_stack_h_l199_c6_7cbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left <= VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_left;
     BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right <= VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output := BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond := VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond := VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond := VAR_BIN_OP_EQ_uxn_stack_h_l199_c6_7cbc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l199_c1_372f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l201_c1_6ea7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output;

     -- Submodule level 2
     VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l201_c1_6ea7_return_output;
     VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l199_c1_372f_return_output;
     -- peek_stack_r[uxn_stack_h_l202_c26_d473] LATENCY=0
     -- Clock enable
     peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE <= VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_CLOCK_ENABLE;
     -- Inputs
     peek_stack_r_uxn_stack_h_l202_c26_d473_address <= VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_address;
     -- Outputs
     VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_return_output := peek_stack_r_uxn_stack_h_l202_c26_d473_return_output;

     -- peek_stack_w[uxn_stack_h_l200_c26_1127] LATENCY=0
     -- Clock enable
     peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE <= VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_CLOCK_ENABLE;
     -- Inputs
     peek_stack_w_uxn_stack_h_l200_c26_1127_address <= VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_address;
     -- Outputs
     VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_return_output := peek_stack_w_uxn_stack_h_l200_c26_1127_return_output;

     -- Submodule level 3
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse := VAR_peek_stack_r_uxn_stack_h_l202_c26_d473_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue := VAR_peek_stack_w_uxn_stack_h_l200_c26_1127_return_output;
     -- stack_data_ret_value_MUX[uxn_stack_h_l199_c2_47c3] LATENCY=0
     -- Inputs
     stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_cond;
     stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iftrue;
     stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_iffalse;
     -- Outputs
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output := stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output;
     REG_VAR_stack_data_ret_value := VAR_stack_data_ret_value_MUX_uxn_stack_h_l199_c2_47c3_return_output;
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
