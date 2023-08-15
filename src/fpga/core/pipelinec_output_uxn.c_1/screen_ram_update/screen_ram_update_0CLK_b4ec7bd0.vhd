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
entity screen_ram_update_0CLK_b4ec7bd0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 write_address : in unsigned(31 downto 0);
 write_value : in unsigned(1 downto 0);
 read_address : in unsigned(31 downto 0);
 return_output : out unsigned(1 downto 0));
end screen_ram_update_0CLK_b4ec7bd0;
architecture arch of screen_ram_update_0CLK_b4ec7bd0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_rdaddr : unsigned(31 downto 0);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(1 downto 0);

-- Each function instance gets signals
-- screen_ram[uxn_ram_screen_h_l36_c33_abdb]
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0 : unsigned(31 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0 : unsigned(1 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0 : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0 : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0 : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1 : unsigned(31 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1 : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1 : unsigned(0 downto 0);
signal screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output : screen_ram_outputs_t;


begin

-- SUBMODULE INSTANCES 
-- screen_ram_uxn_ram_screen_h_l36_c33_abdb
screen_ram_uxn_ram_screen_h_l36_c33_abdb : entity work.screen_ram_0CLK_b45f1687 port map (
clk,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1,
screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 write_address,
 write_value,
 read_address,
 -- Registers
 rdaddr,
 rwaddr,
 wdata,
 -- All submodule outputs
 screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_write_address : unsigned(31 downto 0);
 variable VAR_write_value : unsigned(1 downto 0);
 variable VAR_read_address : unsigned(31 downto 0);
 variable VAR_wr_en : unsigned(0 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rw_out_en : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_rd_out_en : unsigned(0 downto 0);
 variable VAR_ram_out : screen_ram_outputs_t;
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0 : unsigned(31 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0 : unsigned(1 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0 : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0 : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0 : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1 : unsigned(31 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1 : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1 : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output : screen_ram_outputs_t;
 variable VAR_CONST_REF_RD_uint2_t_screen_ram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l49_c9_9b94_return_output : unsigned(1 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1 := to_unsigned(1, 1);
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1 := to_unsigned(1, 1);
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0 := to_unsigned(1, 1);
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0 := to_unsigned(1, 1);
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0 := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_write_address := write_address;
     VAR_write_value := write_value;
     VAR_read_address := read_address;

     -- Submodule level 0
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_rdaddr := VAR_read_address;
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1 := VAR_read_address;
     REG_VAR_rwaddr := VAR_write_address;
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0 := VAR_write_address;
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0 := VAR_write_value;
     REG_VAR_wdata := VAR_write_value;
     -- screen_ram[uxn_ram_screen_h_l36_c33_abdb] LATENCY=0
     -- Clock enable
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_CLOCK_ENABLE;
     -- Inputs
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr0;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_data0;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_wr_en0;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid0;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en0;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_addr1;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_valid1;
     screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1 <= VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_rd_en1;
     -- Outputs
     VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output := screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint2_t_screen_ram_outputs_t_rd_data1_d41d[uxn_ram_screen_h_l49_c9_9b94] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_screen_ram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l49_c9_9b94_return_output := VAR_screen_ram_uxn_ram_screen_h_l36_c33_abdb_return_output.rd_data1;

     -- Submodule level 2
     VAR_return_output := VAR_CONST_REF_RD_uint2_t_screen_ram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l49_c9_9b94_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rdaddr <= REG_VAR_rdaddr;
REG_COMB_rwaddr <= REG_VAR_rwaddr;
REG_COMB_wdata <= REG_VAR_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rdaddr <= REG_COMB_rdaddr;
     rwaddr <= REG_COMB_rwaddr;
     wdata <= REG_COMB_wdata;
 end if;
 end if;
end process;

end arch;
