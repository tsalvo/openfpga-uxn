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
entity stack_data_get_0CLK_c34ffe29 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 index : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end stack_data_get_0CLK_c34ffe29;
architecture arch of stack_data_get_0CLK_c34ffe29 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_data_ret_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_stack_data_ret_value : unsigned(7 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_stack_h_l171_c6_4332]
signal BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l171_c1_a4d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l173_c1_2eca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output : unsigned(0 downto 0);

-- stack_data_ret_value_MUX[uxn_stack_h_l171_c2_00c1]
signal stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond : unsigned(0 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output : unsigned(7 downto 0);

-- stack_w_ram_read[uxn_stack_h_l172_c26_4f62]
signal stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address : unsigned(7 downto 0);
signal stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output : unsigned(7 downto 0);

-- stack_r_ram_read[uxn_stack_h_l174_c26_2e84]
signal stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address : unsigned(7 downto 0);
signal stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l171_c6_4332
BIN_OP_EQ_uxn_stack_h_l171_c6_4332 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left,
BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right,
BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output);

-- stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1
stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond,
stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue,
stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse,
stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output);

-- stack_w_ram_read_uxn_stack_h_l172_c26_4f62
stack_w_ram_read_uxn_stack_h_l172_c26_4f62 : entity work.stack_w_ram_read_0CLK_8ab28aec port map (
clk,
stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE,
stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address,
stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output);

-- stack_r_ram_read_uxn_stack_h_l174_c26_2e84
stack_r_ram_read_uxn_stack_h_l174_c26_2e84 : entity work.stack_r_ram_read_0CLK_8ab28aec port map (
clk,
stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE,
stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address,
stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 index,
 -- Registers
 stack_data_ret_value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output,
 stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output,
 stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output,
 stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_index : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond : unsigned(0 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output : unsigned(7 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address : unsigned(7 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_data_ret_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_data_ret_value := stack_data_ret_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_index := index;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address := VAR_index;
     VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address := VAR_index;
     VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left := VAR_stack_index;
     -- BIN_OP_EQ[uxn_stack_h_l171_c6_4332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left <= VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_left;
     BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right <= VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output := BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond := VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond := VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond := VAR_BIN_OP_EQ_uxn_stack_h_l171_c6_4332_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l173_c1_2eca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l171_c1_a4d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output;

     -- Submodule level 2
     VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l173_c1_2eca_return_output;
     VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l171_c1_a4d4_return_output;
     -- stack_w_ram_read[uxn_stack_h_l172_c26_4f62] LATENCY=0
     -- Clock enable
     stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE <= VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address <= VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_address;
     -- Outputs
     VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output := stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output;

     -- stack_r_ram_read[uxn_stack_h_l174_c26_2e84] LATENCY=0
     -- Clock enable
     stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE <= VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address <= VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_address;
     -- Outputs
     VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output := stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output;

     -- Submodule level 3
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse := VAR_stack_r_ram_read_uxn_stack_h_l174_c26_2e84_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue := VAR_stack_w_ram_read_uxn_stack_h_l172_c26_4f62_return_output;
     -- stack_data_ret_value_MUX[uxn_stack_h_l171_c2_00c1] LATENCY=0
     -- Inputs
     stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_cond;
     stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iftrue;
     stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_iffalse;
     -- Outputs
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output := stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output;
     REG_VAR_stack_data_ret_value := VAR_stack_data_ret_value_MUX_uxn_stack_h_l171_c2_00c1_return_output;
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
