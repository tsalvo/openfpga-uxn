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
entity halt_0CLK_fd588851 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 err : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end halt_0CLK_fd588851;
architecture arch of halt_0CLK_fd588851 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- pc_get[uxn_stack_h_l264_c28_5eef]
signal pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_stack_h_l264_c28_5eef_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l264_c28_abeb]
signal BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output : unsigned(15 downto 0);

-- uxn_halt[uxn_stack_h_l264_c9_29bd]
signal uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_halt_uxn_stack_h_l264_c9_29bd_instr : unsigned(7 downto 0);
signal uxn_halt_uxn_stack_h_l264_c9_29bd_err : unsigned(7 downto 0);
signal uxn_halt_uxn_stack_h_l264_c9_29bd_addr : unsigned(15 downto 0);
signal uxn_halt_uxn_stack_h_l264_c9_29bd_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_stack_h_l264_c28_5eef
pc_get_uxn_stack_h_l264_c28_5eef : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE,
pc_get_uxn_stack_h_l264_c28_5eef_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb
BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left,
BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right,
BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output);

-- uxn_halt_uxn_stack_h_l264_c9_29bd
uxn_halt_uxn_stack_h_l264_c9_29bd : entity work.uxn_halt_0CLK_686f29a9 port map (
clk,
uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE,
uxn_halt_uxn_stack_h_l264_c9_29bd_instr,
uxn_halt_uxn_stack_h_l264_c9_29bd_err,
uxn_halt_uxn_stack_h_l264_c9_29bd_addr,
uxn_halt_uxn_stack_h_l264_c9_29bd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 ins,
 err,
 -- All submodule outputs
 pc_get_uxn_stack_h_l264_c28_5eef_return_output,
 BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output,
 uxn_halt_uxn_stack_h_l264_c9_29bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_err : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_instr : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_err : unsigned(7 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_addr : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_stack_h_l264_c28_5eef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output : unsigned(15 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_return_output : unsigned(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right := to_unsigned(1, 1);

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
     VAR_pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_err := VAR_err;
     VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_instr := VAR_ins;
     -- pc_get[uxn_stack_h_l264_c28_5eef] LATENCY=0
     -- Clock enable
     pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE <= VAR_pc_get_uxn_stack_h_l264_c28_5eef_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_stack_h_l264_c28_5eef_return_output := pc_get_uxn_stack_h_l264_c28_5eef_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left := VAR_pc_get_uxn_stack_h_l264_c28_5eef_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l264_c28_abeb] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_left;
     BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output := BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output;

     -- Submodule level 2
     VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_addr := VAR_BIN_OP_MINUS_uxn_stack_h_l264_c28_abeb_return_output;
     -- uxn_halt[uxn_stack_h_l264_c9_29bd] LATENCY=0
     -- Clock enable
     uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE <= VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_CLOCK_ENABLE;
     -- Inputs
     uxn_halt_uxn_stack_h_l264_c9_29bd_instr <= VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_instr;
     uxn_halt_uxn_stack_h_l264_c9_29bd_err <= VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_err;
     uxn_halt_uxn_stack_h_l264_c9_29bd_addr <= VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_addr;
     -- Outputs
     VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_return_output := uxn_halt_uxn_stack_h_l264_c9_29bd_return_output;

     -- Submodule level 3
     VAR_return_output := VAR_uxn_halt_uxn_stack_h_l264_c9_29bd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
