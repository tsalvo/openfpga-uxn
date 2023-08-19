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
-- Submodules: 3
entity pc_add_0CLK_925e4dd0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 adjustment : in unsigned(15 downto 0));
end pc_add_0CLK_925e4dd0;
architecture arch of pc_add_0CLK_925e4dd0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal current_prog_ctr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_current_prog_ctr : unsigned(15 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_pc_h_l52_c21_2476]
signal pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_pc_h_l52_c21_2476_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_pc_h_l53_c9_69a0]
signal BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output : unsigned(16 downto 0);

-- pc_set[uxn_pc_h_l53_c2_6b08]
signal pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_pc_h_l53_c2_6b08_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_pc_h_l52_c21_2476
pc_get_uxn_pc_h_l52_c21_2476 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE,
pc_get_uxn_pc_h_l52_c21_2476_return_output);

-- BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0
BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left,
BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right,
BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output);

-- pc_set_uxn_pc_h_l53_c2_6b08
pc_set_uxn_pc_h_l53_c2_6b08 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE,
pc_set_uxn_pc_h_l53_c2_6b08_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 adjustment,
 -- Registers
 current_prog_ctr,
 -- All submodule outputs
 pc_get_uxn_pc_h_l52_c21_2476_return_output,
 BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_adjustment : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_pc_h_l52_c21_2476_return_output : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_pc_h_l53_c2_6b08_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_current_prog_ctr : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_current_prog_ctr := current_prog_ctr;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_adjustment := adjustment;

     -- Submodule level 0
     VAR_pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right := VAR_adjustment;
     -- pc_get[uxn_pc_h_l52_c21_2476] LATENCY=0
     -- Clock enable
     pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE <= VAR_pc_get_uxn_pc_h_l52_c21_2476_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_pc_h_l52_c21_2476_return_output := pc_get_uxn_pc_h_l52_c21_2476_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left := VAR_pc_get_uxn_pc_h_l52_c21_2476_return_output;
     REG_VAR_current_prog_ctr := VAR_pc_get_uxn_pc_h_l52_c21_2476_return_output;
     -- BIN_OP_PLUS[uxn_pc_h_l53_c9_69a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left <= VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_left;
     BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right <= VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output := BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output;

     -- Submodule level 2
     VAR_pc_set_uxn_pc_h_l53_c2_6b08_value := resize(VAR_BIN_OP_PLUS_uxn_pc_h_l53_c9_69a0_return_output, 16);
     -- pc_set[uxn_pc_h_l53_c2_6b08] LATENCY=0
     -- Clock enable
     pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE <= VAR_pc_set_uxn_pc_h_l53_c2_6b08_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_pc_h_l53_c2_6b08_value <= VAR_pc_set_uxn_pc_h_l53_c2_6b08_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_current_prog_ctr <= REG_VAR_current_prog_ctr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     current_prog_ctr <= REG_COMB_current_prog_ctr;
 end if;
 end if;
end process;

end arch;
