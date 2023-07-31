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
-- Submodules: 0
entity prog_ctr_ram_write_0CLK_de264c78 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 value : in unsigned(15 downto 0));
end prog_ctr_ram_write_0CLK_de264c78;
architecture arch of prog_ctr_ram_write_0CLK_de264c78 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal prog_ctr_w_rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal prog_ctr_w_rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal prog_ctr_w_wdata : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_prog_ctr_w_rdaddr : unsigned(31 downto 0);
signal REG_COMB_prog_ctr_w_rwaddr : unsigned(31 downto 0);
signal REG_COMB_prog_ctr_w_wdata : unsigned(15 downto 0);


begin



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 value,
 -- Registers
 prog_ctr_w_rdaddr,
 prog_ctr_w_rwaddr,
 prog_ctr_w_wdata)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_prog_ctr_w_wr_en : unsigned(0 downto 0);
 variable VAR_prog_ctr_w_rw_valid : unsigned(0 downto 0);
 variable VAR_prog_ctr_w_rd_valid : unsigned(0 downto 0);
 variable VAR_prog_ctr_w_ram_out : prog_ctr_ram_outputs_t;
 -- State registers comb logic variables
variable REG_VAR_prog_ctr_w_rdaddr : unsigned(31 downto 0);
variable REG_VAR_prog_ctr_w_rwaddr : unsigned(31 downto 0);
variable REG_VAR_prog_ctr_w_wdata : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_prog_ctr_w_rdaddr := prog_ctr_w_rdaddr;
  REG_VAR_prog_ctr_w_rwaddr := prog_ctr_w_rwaddr;
  REG_VAR_prog_ctr_w_wdata := prog_ctr_w_wdata;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_value := value;

     -- Submodule level 0
     REG_VAR_prog_ctr_w_rdaddr := prog_ctr_w_rdaddr;
     REG_VAR_prog_ctr_w_rwaddr := prog_ctr_w_rwaddr;
     REG_VAR_prog_ctr_w_wdata := VAR_value;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_prog_ctr_w_rdaddr <= REG_VAR_prog_ctr_w_rdaddr;
REG_COMB_prog_ctr_w_rwaddr <= REG_VAR_prog_ctr_w_rwaddr;
REG_COMB_prog_ctr_w_wdata <= REG_VAR_prog_ctr_w_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     prog_ctr_w_rdaddr <= REG_COMB_prog_ctr_w_rdaddr;
     prog_ctr_w_rwaddr <= REG_COMB_prog_ctr_w_rwaddr;
     prog_ctr_w_wdata <= REG_COMB_prog_ctr_w_wdata;
 end if;
 end if;
end process;

end arch;
