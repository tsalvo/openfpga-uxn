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
-- Submodules: 2
entity pc_add_s8_0CLK_23f04728 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 pc : in unsigned(15 downto 0);
 adjustment : in signed(7 downto 0));
end pc_add_s8_0CLK_23f04728;
architecture arch of pc_add_s8_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal new_prog_ctr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_new_prog_ctr : unsigned(15 downto 0);

-- Each function instance gets signals
-- BIN_OP_PLUS[uxn_pc_h_l58_c17_5cd8]
signal BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output : signed(17 downto 0);

-- pc_set[uxn_pc_h_l59_c2_1f50]
signal pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_pc_h_l59_c2_1f50_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8
BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left,
BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right,
BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output);

-- pc_set_uxn_pc_h_l59_c2_1f50
pc_set_uxn_pc_h_l59_c2_1f50 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE,
pc_set_uxn_pc_h_l59_c2_1f50_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 pc,
 adjustment,
 -- Registers
 new_prog_ctr,
 -- All submodule outputs
 BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_adjustment : signed(7 downto 0);
 variable VAR_new_prog_ctr_uxn_pc_h_l58_c2_6219 : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output : signed(17 downto 0);
 variable VAR_pc_set_uxn_pc_h_l59_c2_1f50_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_new_prog_ctr : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_new_prog_ctr := new_prog_ctr;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_pc := pc;
     VAR_adjustment := adjustment;

     -- Submodule level 0
     VAR_pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right := VAR_adjustment;
     VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     -- BIN_OP_PLUS[uxn_pc_h_l58_c17_5cd8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left <= VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_left;
     BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right <= VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output := BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output;

     -- Submodule level 1
     VAR_new_prog_ctr_uxn_pc_h_l58_c2_6219 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_pc_h_l58_c17_5cd8_return_output)),16);
     REG_VAR_new_prog_ctr := VAR_new_prog_ctr_uxn_pc_h_l58_c2_6219;
     VAR_pc_set_uxn_pc_h_l59_c2_1f50_value := VAR_new_prog_ctr_uxn_pc_h_l58_c2_6219;
     -- pc_set[uxn_pc_h_l59_c2_1f50] LATENCY=0
     -- Clock enable
     pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE <= VAR_pc_set_uxn_pc_h_l59_c2_1f50_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_pc_h_l59_c2_1f50_value <= VAR_pc_set_uxn_pc_h_l59_c2_1f50_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_new_prog_ctr <= REG_VAR_new_prog_ctr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     new_prog_ctr <= REG_COMB_new_prog_ctr;
 end if;
 end if;
end process;

end arch;
