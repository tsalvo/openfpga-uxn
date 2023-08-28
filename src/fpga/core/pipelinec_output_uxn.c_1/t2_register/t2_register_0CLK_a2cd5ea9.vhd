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
-- Submodules: 2
entity t2_register_0CLK_a2cd5ea9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_ptr : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end t2_register_0CLK_a2cd5ea9;
architecture arch of t2_register_0CLK_a2cd5ea9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_MINUS[uxn_registers_h_l30_c34_f3bc]
signal BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output : unsigned(7 downto 0);

-- peek2_stack[uxn_registers_h_l30_c9_40db]
signal peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l30_c9_40db_stack_index : unsigned(0 downto 0);
signal peek2_stack_uxn_registers_h_l30_c9_40db_address : unsigned(7 downto 0);
signal peek2_stack_uxn_registers_h_l30_c9_40db_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc
BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left,
BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right,
BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output);

-- peek2_stack_uxn_registers_h_l30_c9_40db
peek2_stack_uxn_registers_h_l30_c9_40db : entity work.peek2_stack_0CLK_0c5d1b5b port map (
clk,
peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE,
peek2_stack_uxn_registers_h_l30_c9_40db_stack_index,
peek2_stack_uxn_registers_h_l30_c9_40db_address,
peek2_stack_uxn_registers_h_l30_c9_40db_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 stack_ptr,
 -- All submodule outputs
 BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output,
 peek2_stack_uxn_registers_h_l30_c9_40db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_ptr : unsigned(7 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l30_c9_40db_stack_index : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l30_c9_40db_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output : unsigned(7 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_stack_uxn_registers_h_l30_c9_40db_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_stack_ptr := stack_ptr;

     -- Submodule level 0
     VAR_peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_stack_uxn_registers_h_l30_c9_40db_stack_index := VAR_stack_index;
     VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left := VAR_stack_ptr;
     -- BIN_OP_MINUS[uxn_registers_h_l30_c34_f3bc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left <= VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_left;
     BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right <= VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output := BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output;

     -- Submodule level 1
     VAR_peek2_stack_uxn_registers_h_l30_c9_40db_address := VAR_BIN_OP_MINUS_uxn_registers_h_l30_c34_f3bc_return_output;
     -- peek2_stack[uxn_registers_h_l30_c9_40db] LATENCY=0
     -- Clock enable
     peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE <= VAR_peek2_stack_uxn_registers_h_l30_c9_40db_CLOCK_ENABLE;
     -- Inputs
     peek2_stack_uxn_registers_h_l30_c9_40db_stack_index <= VAR_peek2_stack_uxn_registers_h_l30_c9_40db_stack_index;
     peek2_stack_uxn_registers_h_l30_c9_40db_address <= VAR_peek2_stack_uxn_registers_h_l30_c9_40db_address;
     -- Outputs
     VAR_peek2_stack_uxn_registers_h_l30_c9_40db_return_output := peek2_stack_uxn_registers_h_l30_c9_40db_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_peek2_stack_uxn_registers_h_l30_c9_40db_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
