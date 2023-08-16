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
entity halt_0CLK_e55decfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 err : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end halt_0CLK_e55decfc;
architecture arch of halt_0CLK_e55decfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- pc_get[uxn_stack_h_l239_c28_c859]
signal pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_stack_h_l239_c28_c859_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l239_c28_5d84]
signal BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output : unsigned(15 downto 0);

-- uxn_halt[uxn_stack_h_l239_c9_1795]
signal uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_halt_uxn_stack_h_l239_c9_1795_instr : unsigned(7 downto 0);
signal uxn_halt_uxn_stack_h_l239_c9_1795_err : unsigned(7 downto 0);
signal uxn_halt_uxn_stack_h_l239_c9_1795_addr : unsigned(15 downto 0);
signal uxn_halt_uxn_stack_h_l239_c9_1795_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_stack_h_l239_c28_c859
pc_get_uxn_stack_h_l239_c28_c859 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE,
pc_get_uxn_stack_h_l239_c28_c859_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84
BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left,
BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right,
BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output);

-- uxn_halt_uxn_stack_h_l239_c9_1795
uxn_halt_uxn_stack_h_l239_c9_1795 : entity work.uxn_halt_0CLK_e4c88c56 port map (
clk,
uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE,
uxn_halt_uxn_stack_h_l239_c9_1795_instr,
uxn_halt_uxn_stack_h_l239_c9_1795_err,
uxn_halt_uxn_stack_h_l239_c9_1795_addr,
uxn_halt_uxn_stack_h_l239_c9_1795_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ins,
 err,
 -- All submodule outputs
 pc_get_uxn_stack_h_l239_c28_c859_return_output,
 BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output,
 uxn_halt_uxn_stack_h_l239_c9_1795_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l239_c9_1795_instr : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l239_c9_1795_err : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l239_c9_1795_addr : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_stack_h_l239_c28_c859_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output : unsigned(15 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l239_c9_1795_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_ins := ins;
     VAR_err := err;

     -- Submodule level 0
     VAR_pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_halt_uxn_stack_h_l239_c9_1795_err := VAR_err;
     VAR_uxn_halt_uxn_stack_h_l239_c9_1795_instr := VAR_ins;
     -- pc_get[uxn_stack_h_l239_c28_c859] LATENCY=0
     -- Clock enable
     pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE <= VAR_pc_get_uxn_stack_h_l239_c28_c859_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_stack_h_l239_c28_c859_return_output := pc_get_uxn_stack_h_l239_c28_c859_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left := VAR_pc_get_uxn_stack_h_l239_c28_c859_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l239_c28_5d84] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_left;
     BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output := BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output;

     -- Submodule level 2
     VAR_uxn_halt_uxn_stack_h_l239_c9_1795_addr := VAR_BIN_OP_MINUS_uxn_stack_h_l239_c28_5d84_return_output;
     -- uxn_halt[uxn_stack_h_l239_c9_1795] LATENCY=0
     -- Clock enable
     uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE <= VAR_uxn_halt_uxn_stack_h_l239_c9_1795_CLOCK_ENABLE;
     -- Inputs
     uxn_halt_uxn_stack_h_l239_c9_1795_instr <= VAR_uxn_halt_uxn_stack_h_l239_c9_1795_instr;
     uxn_halt_uxn_stack_h_l239_c9_1795_err <= VAR_uxn_halt_uxn_stack_h_l239_c9_1795_err;
     uxn_halt_uxn_stack_h_l239_c9_1795_addr <= VAR_uxn_halt_uxn_stack_h_l239_c9_1795_addr;
     -- Outputs
     VAR_uxn_halt_uxn_stack_h_l239_c9_1795_return_output := uxn_halt_uxn_stack_h_l239_c9_1795_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_uxn_halt_uxn_stack_h_l239_c9_1795_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
