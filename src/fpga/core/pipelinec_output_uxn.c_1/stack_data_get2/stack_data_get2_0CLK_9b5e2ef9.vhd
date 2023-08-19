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
entity stack_data_get2_0CLK_9b5e2ef9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end stack_data_get2_0CLK_9b5e2ef9;
architecture arch of stack_data_get2_0CLK_9b5e2ef9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_data_ret_value : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_stack_data_ret_value : unsigned(15 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_stack_h_l202_c6_cd52]
signal BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l202_c1_8567]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l204_c1_9965]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output : unsigned(0 downto 0);

-- stack_data_ret_value_MUX[uxn_stack_h_l202_c2_bbd8]
signal stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond : unsigned(0 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue : unsigned(15 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse : unsigned(15 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output : unsigned(15 downto 0);

-- peek2_stack_w[uxn_stack_h_l203_c26_e6e1]
signal peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address : unsigned(7 downto 0);
signal peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output : unsigned(15 downto 0);

-- peek2_stack_r[uxn_stack_h_l205_c26_2ecd]
signal peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address : unsigned(7 downto 0);
signal peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l202_c6_cd52
BIN_OP_EQ_uxn_stack_h_l202_c6_cd52 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left,
BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right,
BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output);

-- stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8
stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond,
stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue,
stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse,
stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output);

-- peek2_stack_w_uxn_stack_h_l203_c26_e6e1
peek2_stack_w_uxn_stack_h_l203_c26_e6e1 : entity work.peek2_stack_w_0CLK_7bf2eff3 port map (
clk,
peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE,
peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address,
peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output);

-- peek2_stack_r_uxn_stack_h_l205_c26_2ecd
peek2_stack_r_uxn_stack_h_l205_c26_2ecd : entity work.peek2_stack_r_0CLK_7bf2eff3 port map (
clk,
peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE,
peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address,
peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 address,
 -- Registers
 stack_data_ret_value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output,
 stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output,
 peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output,
 peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue : unsigned(15 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse : unsigned(15 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output : unsigned(15 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond : unsigned(0 downto 0);
 variable VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address : unsigned(7 downto 0);
 variable VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output : unsigned(15 downto 0);
 variable VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address : unsigned(7 downto 0);
 variable VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_data_ret_value : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_data_ret_value := stack_data_ret_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue := VAR_CLOCK_ENABLE;
     VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address := VAR_address;
     VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address := VAR_address;
     VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left := VAR_stack_index;
     -- BIN_OP_EQ[uxn_stack_h_l202_c6_cd52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left <= VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_left;
     BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right <= VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output := BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond := VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond := VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond := VAR_BIN_OP_EQ_uxn_stack_h_l202_c6_cd52_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l202_c1_8567] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l204_c1_9965] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output;

     -- Submodule level 2
     VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l204_c1_9965_return_output;
     VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l202_c1_8567_return_output;
     -- peek2_stack_w[uxn_stack_h_l203_c26_e6e1] LATENCY=0
     -- Clock enable
     peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE <= VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_CLOCK_ENABLE;
     -- Inputs
     peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address <= VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_address;
     -- Outputs
     VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output := peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output;

     -- peek2_stack_r[uxn_stack_h_l205_c26_2ecd] LATENCY=0
     -- Clock enable
     peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE <= VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_CLOCK_ENABLE;
     -- Inputs
     peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address <= VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_address;
     -- Outputs
     VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output := peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output;

     -- Submodule level 3
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse := VAR_peek2_stack_r_uxn_stack_h_l205_c26_2ecd_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue := VAR_peek2_stack_w_uxn_stack_h_l203_c26_e6e1_return_output;
     -- stack_data_ret_value_MUX[uxn_stack_h_l202_c2_bbd8] LATENCY=0
     -- Inputs
     stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_cond;
     stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iftrue;
     stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_iffalse;
     -- Outputs
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output := stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output;
     REG_VAR_stack_data_ret_value := VAR_stack_data_ret_value_MUX_uxn_stack_h_l202_c2_bbd8_return_output;
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
