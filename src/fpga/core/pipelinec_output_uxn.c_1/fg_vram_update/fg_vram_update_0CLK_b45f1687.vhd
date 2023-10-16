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
entity fg_vram_update_0CLK_b45f1687 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(31 downto 0);
 write_address : in unsigned(31 downto 0);
 write_value : in unsigned(1 downto 0);
 write_enable : in unsigned(0 downto 0);
 return_output : out unsigned(1 downto 0));
end fg_vram_update_0CLK_b45f1687;
architecture arch of fg_vram_update_0CLK_b45f1687 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal waddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(31 downto 0) := to_unsigned(0, 32);
signal raddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_waddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(31 downto 0);
signal REG_COMB_raddr : unsigned(31 downto 0);

-- Each function instance gets signals
-- fg_vram_update_fg_vram_RAM_DP_RF_1[uxn_ram_screen_h_l45_c18_6514]
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE : unsigned(0 downto 0);
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0 : unsigned(17 downto 0);
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0 : unsigned(17 downto 0);
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd : unsigned(1 downto 0);
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we : unsigned(0 downto 0);
signal fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output : unsigned(1 downto 0);


begin

-- SUBMODULE INSTANCES 
-- fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514 : entity work.fg_vram_update_fg_vram_RAM_DP_RF_1_0CLK_de264c78 port map (
clk,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we,
fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 read_address,
 write_address,
 write_value,
 write_enable,
 -- Registers
 waddr,
 wdata,
 raddr,
 -- All submodule outputs
 fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_read_address : unsigned(31 downto 0);
 variable VAR_write_address : unsigned(31 downto 0);
 variable VAR_write_value : unsigned(1 downto 0);
 variable VAR_write_enable : unsigned(0 downto 0);
 variable VAR_fg_vram : uint2_t_144000;
 variable VAR_raddr_uxn_ram_screen_h_l41_c2_151a : unsigned(31 downto 0);
 variable VAR_waddr_uxn_ram_screen_h_l42_c2_b343 : unsigned(31 downto 0);
 variable VAR_wdata_uxn_ram_screen_h_l43_c2_c6f6 : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(1 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0 : unsigned(17 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0 : unsigned(17 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd : unsigned(1 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we : unsigned(0 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output : unsigned(1 downto 0);
 -- State registers comb logic variables
variable REG_VAR_waddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(31 downto 0);
variable REG_VAR_raddr : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_waddr := waddr;
  REG_VAR_wdata := wdata;
  REG_VAR_raddr := raddr;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_read_address := read_address;
     VAR_write_address := write_address;
     VAR_write_value := write_value;
     VAR_write_enable := write_enable;

     -- Submodule level 0
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_raddr_uxn_ram_screen_h_l41_c2_151a := VAR_read_address;
     VAR_waddr_uxn_ram_screen_h_l42_c2_b343 := VAR_write_address;
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we := VAR_write_enable;
     VAR_wdata_uxn_ram_screen_h_l43_c2_c6f6 := resize(VAR_write_value, 32);
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0 := resize(VAR_raddr_uxn_ram_screen_h_l41_c2_151a, 18);
     REG_VAR_raddr := VAR_raddr_uxn_ram_screen_h_l41_c2_151a;
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0 := resize(VAR_waddr_uxn_ram_screen_h_l42_c2_b343, 18);
     REG_VAR_waddr := VAR_waddr_uxn_ram_screen_h_l42_c2_b343;
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd := resize(VAR_wdata_uxn_ram_screen_h_l43_c2_c6f6, 2);
     REG_VAR_wdata := VAR_wdata_uxn_ram_screen_h_l43_c2_c6f6;
     -- fg_vram_update_fg_vram_RAM_DP_RF_1[uxn_ram_screen_h_l45_c18_6514] LATENCY=0
     -- Clock enable
     fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE <= VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_CLOCK_ENABLE;
     -- Inputs
     fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0 <= VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_r0;
     fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0 <= VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_addr_w0;
     fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd <= VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_wd;
     fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we <= VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_we;
     -- Outputs
     VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output := fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output;

     -- Submodule level 1
     VAR_return_output := VAR_fg_vram_update_fg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l45_c18_6514_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_waddr <= REG_VAR_waddr;
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_raddr <= REG_VAR_raddr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     waddr <= REG_COMB_waddr;
     wdata <= REG_COMB_wdata;
     raddr <= REG_COMB_raddr;
 end if;
 end if;
end process;

end arch;
