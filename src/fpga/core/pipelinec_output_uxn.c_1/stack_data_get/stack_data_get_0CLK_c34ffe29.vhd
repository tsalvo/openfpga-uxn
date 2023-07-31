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
-- BIN_OP_EQ[uxn_stack_h_l183_c6_b201]
signal BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l183_c1_a9da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l185_c1_d812]
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output : unsigned(0 downto 0);

-- stack_data_ret_value_MUX[uxn_stack_h_l183_c2_b2be]
signal stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond : unsigned(0 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse : unsigned(7 downto 0);
signal stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output : unsigned(7 downto 0);

-- stack_w_ram_read[uxn_stack_h_l184_c26_f545]
signal stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_read_uxn_stack_h_l184_c26_f545_address : unsigned(7 downto 0);
signal stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output : unsigned(7 downto 0);

-- stack_r_ram_read[uxn_stack_h_l186_c26_6aef]
signal stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address : unsigned(7 downto 0);
signal stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_stack_h_l183_c6_b201
BIN_OP_EQ_uxn_stack_h_l183_c6_b201 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left,
BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right,
BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output);

-- stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be
stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond,
stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue,
stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse,
stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output);

-- stack_w_ram_read_uxn_stack_h_l184_c26_f545
stack_w_ram_read_uxn_stack_h_l184_c26_f545 : entity work.stack_w_ram_read_0CLK_8ab28aec port map (
clk,
stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE,
stack_w_ram_read_uxn_stack_h_l184_c26_f545_address,
stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output);

-- stack_r_ram_read_uxn_stack_h_l186_c26_6aef
stack_r_ram_read_uxn_stack_h_l186_c26_6aef : entity work.stack_r_ram_read_0CLK_8ab28aec port map (
clk,
stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE,
stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address,
stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 index,
 -- Registers
 stack_data_ret_value,
 -- All submodule outputs
 BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output,
 stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output,
 stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output,
 stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_index : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse : unsigned(0 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond : unsigned(0 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output : unsigned(7 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address : unsigned(7 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_data_ret_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_data_ret_value := stack_data_ret_value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address := VAR_index;
     VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_address := VAR_index;
     VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left := VAR_stack_index;
     -- BIN_OP_EQ[uxn_stack_h_l183_c6_b201] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left <= VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_left;
     BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right <= VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output := BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond := VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond := VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond := VAR_BIN_OP_EQ_uxn_stack_h_l183_c6_b201_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_stack_h_l185_c1_d812] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l183_c1_a9da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output;

     -- Submodule level 2
     VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_stack_h_l185_c1_d812_return_output;
     VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l183_c1_a9da_return_output;
     -- stack_w_ram_read[uxn_stack_h_l184_c26_f545] LATENCY=0
     -- Clock enable
     stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE <= VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_read_uxn_stack_h_l184_c26_f545_address <= VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_address;
     -- Outputs
     VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output := stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output;

     -- stack_r_ram_read[uxn_stack_h_l186_c26_6aef] LATENCY=0
     -- Clock enable
     stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE <= VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address <= VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_address;
     -- Outputs
     VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output := stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output;

     -- Submodule level 3
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse := VAR_stack_r_ram_read_uxn_stack_h_l186_c26_6aef_return_output;
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue := VAR_stack_w_ram_read_uxn_stack_h_l184_c26_f545_return_output;
     -- stack_data_ret_value_MUX[uxn_stack_h_l183_c2_b2be] LATENCY=0
     -- Inputs
     stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_cond;
     stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iftrue;
     stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse <= VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_iffalse;
     -- Outputs
     VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output := stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output;
     REG_VAR_stack_data_ret_value := VAR_stack_data_ret_value_MUX_uxn_stack_h_l183_c2_b2be_return_output;
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