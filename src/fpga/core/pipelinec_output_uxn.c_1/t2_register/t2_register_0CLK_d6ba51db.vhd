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
-- Submodules: 3
entity t2_register_0CLK_d6ba51db is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end t2_register_0CLK_d6ba51db;
architecture arch of t2_register_0CLK_d6ba51db is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- stack_pointer_get[uxn_registers_h_l24_c34_5716]
signal stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_registers_h_l24_c34_9eb3]
signal BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output : unsigned(7 downto 0);

-- peek2_stack[uxn_registers_h_l24_c9_df94]
signal peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l24_c9_df94_stack_index : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l24_c9_df94_address : unsigned(7 downto 0);
signal peek2_stack_uxn_registers_h_l24_c9_df94_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_registers_h_l24_c34_5716
stack_pointer_get_uxn_registers_h_l24_c34_5716 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE,
stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index,
stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output);

-- BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3
BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3 : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left,
BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right,
BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output);

-- peek2_stack_uxn_registers_h_l24_c9_df94
peek2_stack_uxn_registers_h_l24_c9_df94 : entity work.peek2_stack_0CLK_ebcae60c port map (
clk,
peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE,
peek2_stack_uxn_registers_h_l24_c9_df94_stack_index,
peek2_stack_uxn_registers_h_l24_c9_df94_address,
peek2_stack_uxn_registers_h_l24_c9_df94_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 -- All submodule outputs
 stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output,
 BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output,
 peek2_stack_uxn_registers_h_l24_c9_df94_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l24_c9_df94_stack_index : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l24_c9_df94_address : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output : unsigned(7 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l24_c9_df94_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;

     -- Submodule level 0
     VAR_peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_stack_uxn_registers_h_l24_c9_df94_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index := VAR_stack_index;
     -- stack_pointer_get[uxn_registers_h_l24_c34_5716] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index <= VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output := stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left := VAR_stack_pointer_get_uxn_registers_h_l24_c34_5716_return_output;
     -- BIN_OP_MINUS[uxn_registers_h_l24_c34_9eb3] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left <= VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_left;
     BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right <= VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output := BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output;

     -- Submodule level 2
     VAR_peek2_stack_uxn_registers_h_l24_c9_df94_address := VAR_BIN_OP_MINUS_uxn_registers_h_l24_c34_9eb3_return_output;
     -- peek2_stack[uxn_registers_h_l24_c9_df94] LATENCY=0
     -- Clock enable
     peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE <= VAR_peek2_stack_uxn_registers_h_l24_c9_df94_CLOCK_ENABLE;
     -- Inputs
     peek2_stack_uxn_registers_h_l24_c9_df94_stack_index <= VAR_peek2_stack_uxn_registers_h_l24_c9_df94_stack_index;
     peek2_stack_uxn_registers_h_l24_c9_df94_address <= VAR_peek2_stack_uxn_registers_h_l24_c9_df94_address;
     -- Outputs
     VAR_peek2_stack_uxn_registers_h_l24_c9_df94_return_output := peek2_stack_uxn_registers_h_l24_c9_df94_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_peek2_stack_uxn_registers_h_l24_c9_df94_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
