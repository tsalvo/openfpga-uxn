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
entity pc_add_0CLK_8573165f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 adjustment : in unsigned(15 downto 0));
end pc_add_0CLK_8573165f;
architecture arch of pc_add_0CLK_8573165f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal current_prog_ctr : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_current_prog_ctr : unsigned(15 downto 0);

-- Each function instance gets signals
-- prog_ctr_ram_read[uxn_pc_h_l64_c21_ad1f]
signal prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_pc_h_l65_c21_fd2b]
signal BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output : unsigned(16 downto 0);

-- prog_ctr_ram_write[uxn_pc_h_l65_c2_1186]
signal prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f
prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f : entity work.prog_ctr_ram_read_0CLK_b4ec7bd0 port map (
clk,
prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE,
prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output);

-- BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b
BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left,
BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right,
BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output);

-- prog_ctr_ram_write_uxn_pc_h_l65_c2_1186
prog_ctr_ram_write_uxn_pc_h_l65_c2_1186 : entity work.prog_ctr_ram_write_0CLK_de264c78 port map (
clk,
prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE,
prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 adjustment,
 -- Registers
 current_prog_ctr,
 -- All submodule outputs
 prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output,
 BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_adjustment : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output : unsigned(16 downto 0);
 variable VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right := VAR_adjustment;
     -- prog_ctr_ram_read[uxn_pc_h_l64_c21_ad1f] LATENCY=0
     -- Clock enable
     prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE <= VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output := prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left := VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output;
     REG_VAR_current_prog_ctr := VAR_prog_ctr_ram_read_uxn_pc_h_l64_c21_ad1f_return_output;
     -- BIN_OP_PLUS[uxn_pc_h_l65_c21_fd2b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left <= VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_left;
     BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right <= VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output := BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output;

     -- Submodule level 2
     VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value := resize(VAR_BIN_OP_PLUS_uxn_pc_h_l65_c21_fd2b_return_output, 16);
     -- prog_ctr_ram_write[uxn_pc_h_l65_c2_1186] LATENCY=0
     -- Clock enable
     prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE <= VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value <= VAR_prog_ctr_ram_write_uxn_pc_h_l65_c2_1186_value;
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
