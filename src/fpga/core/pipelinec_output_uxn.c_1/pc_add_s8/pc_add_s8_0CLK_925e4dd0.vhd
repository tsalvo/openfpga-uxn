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
entity pc_add_s8_0CLK_925e4dd0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 adjustment : in signed(7 downto 0));
end pc_add_s8_0CLK_925e4dd0;
architecture arch of pc_add_s8_0CLK_925e4dd0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal current_prog_ctr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal new_prog_ctr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_current_prog_ctr : unsigned(15 downto 0);
signal REG_COMB_new_prog_ctr : unsigned(15 downto 0);

-- Each function instance gets signals
-- pc_get[uxn_pc_h_l59_c21_152a]
signal pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_pc_h_l59_c21_152a_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_pc_h_l60_c17_937c]
signal BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output : signed(17 downto 0);

-- pc_set[uxn_pc_h_l61_c2_62b4]
signal pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_pc_h_l61_c2_62b4_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_pc_h_l59_c21_152a
pc_get_uxn_pc_h_l59_c21_152a : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE,
pc_get_uxn_pc_h_l59_c21_152a_return_output);

-- BIN_OP_PLUS_uxn_pc_h_l60_c17_937c
BIN_OP_PLUS_uxn_pc_h_l60_c17_937c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left,
BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right,
BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output);

-- pc_set_uxn_pc_h_l61_c2_62b4
pc_set_uxn_pc_h_l61_c2_62b4 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE,
pc_set_uxn_pc_h_l61_c2_62b4_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 adjustment,
 -- Registers
 current_prog_ctr,
 new_prog_ctr,
 -- All submodule outputs
 pc_get_uxn_pc_h_l59_c21_152a_return_output,
 BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_adjustment : signed(7 downto 0);
 variable VAR_current_prog_ctr_uxn_pc_h_l59_c2_0e7f : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_pc_h_l59_c21_152a_return_output : unsigned(15 downto 0);
 variable VAR_new_prog_ctr_uxn_pc_h_l60_c2_daf7 : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output : signed(17 downto 0);
 variable VAR_pc_set_uxn_pc_h_l61_c2_62b4_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_current_prog_ctr : unsigned(15 downto 0);
variable REG_VAR_new_prog_ctr : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_current_prog_ctr := current_prog_ctr;
  REG_VAR_new_prog_ctr := new_prog_ctr;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_adjustment := adjustment;

     -- Submodule level 0
     VAR_pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right := VAR_adjustment;
     -- pc_get[uxn_pc_h_l59_c21_152a] LATENCY=0
     -- Clock enable
     pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE <= VAR_pc_get_uxn_pc_h_l59_c21_152a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_pc_h_l59_c21_152a_return_output := pc_get_uxn_pc_h_l59_c21_152a_return_output;

     -- Submodule level 1
     VAR_current_prog_ctr_uxn_pc_h_l59_c2_0e7f := VAR_pc_get_uxn_pc_h_l59_c21_152a_return_output;
     VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left := signed(std_logic_vector(resize(VAR_current_prog_ctr_uxn_pc_h_l59_c2_0e7f, 17)));
     REG_VAR_current_prog_ctr := VAR_current_prog_ctr_uxn_pc_h_l59_c2_0e7f;
     -- BIN_OP_PLUS[uxn_pc_h_l60_c17_937c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left <= VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_left;
     BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right <= VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output := BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output;

     -- Submodule level 2
     VAR_new_prog_ctr_uxn_pc_h_l60_c2_daf7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_pc_h_l60_c17_937c_return_output)),16);
     REG_VAR_new_prog_ctr := VAR_new_prog_ctr_uxn_pc_h_l60_c2_daf7;
     VAR_pc_set_uxn_pc_h_l61_c2_62b4_value := VAR_new_prog_ctr_uxn_pc_h_l60_c2_daf7;
     -- pc_set[uxn_pc_h_l61_c2_62b4] LATENCY=0
     -- Clock enable
     pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE <= VAR_pc_set_uxn_pc_h_l61_c2_62b4_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_pc_h_l61_c2_62b4_value <= VAR_pc_set_uxn_pc_h_l61_c2_62b4_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_current_prog_ctr <= REG_VAR_current_prog_ctr;
REG_COMB_new_prog_ctr <= REG_VAR_new_prog_ctr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     current_prog_ctr <= REG_COMB_current_prog_ctr;
     new_prog_ctr <= REG_COMB_new_prog_ctr;
 end if;
 end if;
end process;

end arch;
