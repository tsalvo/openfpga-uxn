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
entity pc_add_s8_0CLK_8573165f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 adjustment : in signed(7 downto 0));
end pc_add_s8_0CLK_8573165f;
architecture arch of pc_add_s8_0CLK_8573165f is
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
-- prog_ctr_ram_read[uxn_pc_h_l71_c21_0ac8]
signal prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_pc_h_l72_c17_daf6]
signal BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output : signed(17 downto 0);

-- prog_ctr_ram_write[uxn_pc_h_l73_c2_fbad]
signal prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8
prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8 : entity work.prog_ctr_ram_read_0CLK_b4ec7bd0 port map (
clk,
prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE,
prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output);

-- BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6
BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left,
BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right,
BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output);

-- prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad
prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad : entity work.prog_ctr_ram_write_0CLK_de264c78 port map (
clk,
prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE,
prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 adjustment,
 -- Registers
 current_prog_ctr,
 new_prog_ctr,
 -- All submodule outputs
 prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output,
 BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_adjustment : signed(7 downto 0);
 variable VAR_current_prog_ctr_uxn_pc_h_l71_c2_acc6 : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output : unsigned(15 downto 0);
 variable VAR_new_prog_ctr_uxn_pc_h_l72_c2_e73d : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output : signed(17 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right := VAR_adjustment;
     -- prog_ctr_ram_read[uxn_pc_h_l71_c21_0ac8] LATENCY=0
     -- Clock enable
     prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE <= VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output := prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output;

     -- Submodule level 1
     VAR_current_prog_ctr_uxn_pc_h_l71_c2_acc6 := VAR_prog_ctr_ram_read_uxn_pc_h_l71_c21_0ac8_return_output;
     VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left := signed(std_logic_vector(resize(VAR_current_prog_ctr_uxn_pc_h_l71_c2_acc6, 17)));
     REG_VAR_current_prog_ctr := VAR_current_prog_ctr_uxn_pc_h_l71_c2_acc6;
     -- BIN_OP_PLUS[uxn_pc_h_l72_c17_daf6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left <= VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_left;
     BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right <= VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output := BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output;

     -- Submodule level 2
     VAR_new_prog_ctr_uxn_pc_h_l72_c2_e73d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_pc_h_l72_c17_daf6_return_output)),16);
     REG_VAR_new_prog_ctr := VAR_new_prog_ctr_uxn_pc_h_l72_c2_e73d;
     VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value := VAR_new_prog_ctr_uxn_pc_h_l72_c2_e73d;
     -- prog_ctr_ram_write[uxn_pc_h_l73_c2_fbad] LATENCY=0
     -- Clock enable
     prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE <= VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value <= VAR_prog_ctr_ram_write_uxn_pc_h_l73_c2_fbad_value;
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
