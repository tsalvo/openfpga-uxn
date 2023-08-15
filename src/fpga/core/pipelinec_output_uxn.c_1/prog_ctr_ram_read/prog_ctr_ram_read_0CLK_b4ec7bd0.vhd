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
-- Submodules: 1
entity prog_ctr_ram_read_0CLK_b4ec7bd0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end prog_ctr_ram_read_0CLK_b4ec7bd0;
architecture arch of prog_ctr_ram_read_0CLK_b4ec7bd0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal prog_ctr_r_rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal prog_ctr_r_rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal prog_ctr_r_wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_prog_ctr_r_rdaddr : unsigned(31 downto 0);
signal REG_COMB_prog_ctr_r_rwaddr : unsigned(31 downto 0);
signal REG_COMB_prog_ctr_r_wdata : unsigned(7 downto 0);

-- Each function instance gets signals
-- prog_ctr_ram[uxn_pc_h_l26_c48_cdd4]
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0 : unsigned(31 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0 : unsigned(15 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1 : unsigned(31 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1 : unsigned(0 downto 0);
signal prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output : prog_ctr_ram_outputs_t;


begin

-- SUBMODULE INSTANCES 
-- prog_ctr_ram_uxn_pc_h_l26_c48_cdd4
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4 : entity work.prog_ctr_ram_0CLK_b45f1687 port map (
clk,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1,
prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 prog_ctr_r_rdaddr,
 prog_ctr_r_rwaddr,
 prog_ctr_r_wdata,
 -- All submodule outputs
 prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_prog_ctr_r_wr_en : unsigned(0 downto 0);
 variable VAR_prog_ctr_r_rw_valid : unsigned(0 downto 0);
 variable VAR_prog_ctr_r_rd_valid : unsigned(0 downto 0);
 variable VAR_prog_ctr_r_ram_out : prog_ctr_ram_outputs_t;
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0 : unsigned(31 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0 : unsigned(15 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1 : unsigned(31 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1 : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output : prog_ctr_ram_outputs_t;
 variable VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l35_c9_fe38_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_prog_ctr_r_rdaddr : unsigned(31 downto 0);
variable REG_VAR_prog_ctr_r_rwaddr : unsigned(31 downto 0);
variable REG_VAR_prog_ctr_r_wdata : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_prog_ctr_r_rdaddr := prog_ctr_r_rdaddr;
  REG_VAR_prog_ctr_r_rwaddr := prog_ctr_r_rwaddr;
  REG_VAR_prog_ctr_r_wdata := prog_ctr_r_wdata;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0 := to_unsigned(1, 1);
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0 := to_unsigned(1, 1);
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1 := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_prog_ctr_r_rdaddr := prog_ctr_r_rdaddr;
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1 := prog_ctr_r_rdaddr;
     REG_VAR_prog_ctr_r_rwaddr := prog_ctr_r_rwaddr;
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0 := prog_ctr_r_rwaddr;
     REG_VAR_prog_ctr_r_wdata := prog_ctr_r_wdata;
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0 := resize(prog_ctr_r_wdata, 16);
     -- prog_ctr_ram[uxn_pc_h_l26_c48_cdd4] LATENCY=0
     -- Clock enable
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_CLOCK_ENABLE;
     -- Inputs
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr0;
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_data0;
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_wr_en0;
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid0;
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_addr1;
     prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1 <= VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_valid1;
     -- Outputs
     VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output := prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d[uxn_pc_h_l35_c9_fe38] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l35_c9_fe38_return_output := VAR_prog_ctr_ram_uxn_pc_h_l26_c48_cdd4_return_output.rd_data1;

     -- Submodule level 2
     VAR_return_output := VAR_CONST_REF_RD_uint16_t_prog_ctr_ram_outputs_t_rd_data1_d41d_uxn_pc_h_l35_c9_fe38_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_prog_ctr_r_rdaddr <= REG_VAR_prog_ctr_r_rdaddr;
REG_COMB_prog_ctr_r_rwaddr <= REG_VAR_prog_ctr_r_rwaddr;
REG_COMB_prog_ctr_r_wdata <= REG_VAR_prog_ctr_r_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     prog_ctr_r_rdaddr <= REG_COMB_prog_ctr_r_rdaddr;
     prog_ctr_r_rwaddr <= REG_COMB_prog_ctr_r_rwaddr;
     prog_ctr_r_wdata <= REG_COMB_prog_ctr_r_wdata;
 end if;
 end if;
end process;

end arch;
