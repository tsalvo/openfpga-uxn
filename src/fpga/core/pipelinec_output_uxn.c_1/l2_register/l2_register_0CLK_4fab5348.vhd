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
entity l2_register_0CLK_4fab5348 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end l2_register_0CLK_4fab5348;
architecture arch of l2_register_0CLK_4fab5348 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- stack_pointer_get[uxn_registers_h_l32_c34_417f]
signal stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_registers_h_l32_c34_b47a]
signal BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output : unsigned(7 downto 0);

-- peek2_stack[uxn_registers_h_l32_c9_0897]
signal peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l32_c9_0897_stack_index : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l32_c9_0897_address : unsigned(7 downto 0);
signal peek2_stack_uxn_registers_h_l32_c9_0897_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_registers_h_l32_c34_417f
stack_pointer_get_uxn_registers_h_l32_c34_417f : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE,
stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index,
stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output);

-- BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a
BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left,
BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right,
BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output);

-- peek2_stack_uxn_registers_h_l32_c9_0897
peek2_stack_uxn_registers_h_l32_c9_0897 : entity work.peek2_stack_0CLK_0c5d1b5b port map (
clk,
peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE,
peek2_stack_uxn_registers_h_l32_c9_0897_stack_index,
peek2_stack_uxn_registers_h_l32_c9_0897_address,
peek2_stack_uxn_registers_h_l32_c9_0897_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 -- All submodule outputs
 stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output,
 BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output,
 peek2_stack_uxn_registers_h_l32_c9_0897_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l32_c9_0897_stack_index : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l32_c9_0897_address : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output : unsigned(7 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l32_c9_0897_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right := to_unsigned(6, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;

     -- Submodule level 0
     VAR_peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_stack_uxn_registers_h_l32_c9_0897_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index := VAR_stack_index;
     -- stack_pointer_get[uxn_registers_h_l32_c34_417f] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index <= VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output := stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left := VAR_stack_pointer_get_uxn_registers_h_l32_c34_417f_return_output;
     -- BIN_OP_MINUS[uxn_registers_h_l32_c34_b47a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left <= VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_left;
     BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right <= VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output := BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output;

     -- Submodule level 2
     VAR_peek2_stack_uxn_registers_h_l32_c9_0897_address := VAR_BIN_OP_MINUS_uxn_registers_h_l32_c34_b47a_return_output;
     -- peek2_stack[uxn_registers_h_l32_c9_0897] LATENCY=0
     -- Clock enable
     peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE <= VAR_peek2_stack_uxn_registers_h_l32_c9_0897_CLOCK_ENABLE;
     -- Inputs
     peek2_stack_uxn_registers_h_l32_c9_0897_stack_index <= VAR_peek2_stack_uxn_registers_h_l32_c9_0897_stack_index;
     peek2_stack_uxn_registers_h_l32_c9_0897_address <= VAR_peek2_stack_uxn_registers_h_l32_c9_0897_address;
     -- Outputs
     VAR_peek2_stack_uxn_registers_h_l32_c9_0897_return_output := peek2_stack_uxn_registers_h_l32_c9_0897_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_peek2_stack_uxn_registers_h_l32_c9_0897_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
