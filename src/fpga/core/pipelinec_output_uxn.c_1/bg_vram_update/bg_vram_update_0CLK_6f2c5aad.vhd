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
-- Submodules: 4
entity bg_vram_update_0CLK_6f2c5aad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(23 downto 0);
 write_address : in unsigned(23 downto 0);
 write_value : in unsigned(1 downto 0);
 write_enable : in unsigned(0 downto 0);
 return_output : out unsigned(1 downto 0));
end bg_vram_update_0CLK_6f2c5aad;
architecture arch of bg_vram_update_0CLK_6f2c5aad is
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
-- bg_vram_update_bg_vram_RAM_DP_RF_1[uxn_ram_screen_h_l21_c18_7291]
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE : unsigned(0 downto 0);
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0 : unsigned(17 downto 0);
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0 : unsigned(17 downto 0);
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd : unsigned(1 downto 0);
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we : unsigned(0 downto 0);
signal bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output : unsigned(1 downto 0);

function CAST_TO_uint32_t_uint24_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(23 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint32_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291 : entity work.bg_vram_update_bg_vram_RAM_DP_RF_1_0CLK_de264c78 port map (
clk,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we,
bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output);



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
 bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_read_address : unsigned(23 downto 0);
 variable VAR_write_address : unsigned(23 downto 0);
 variable VAR_write_value : unsigned(1 downto 0);
 variable VAR_write_enable : unsigned(0 downto 0);
 variable VAR_bg_vram : uint2_t_144000;
 variable VAR_raddr_uxn_ram_screen_h_l17_c2_8989 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l17_c10_b4bb_return_output : unsigned(31 downto 0);
 variable VAR_waddr_uxn_ram_screen_h_l18_c2_8b6c : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_34ee_return_output : unsigned(31 downto 0);
 variable VAR_wdata_uxn_ram_screen_h_l19_c2_8621 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_6aad_return_output : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(1 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0 : unsigned(17 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0 : unsigned(17 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd : unsigned(1 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we : unsigned(0 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output : unsigned(1 downto 0);
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
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we := VAR_write_enable;
     -- CAST_TO_uint32_t[uxn_ram_screen_h_l18_c10_34ee] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_34ee_return_output := CAST_TO_uint32_t_uint24_t(
     VAR_write_address);

     -- CAST_TO_uint32_t[uxn_ram_screen_h_l17_c10_b4bb] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l17_c10_b4bb_return_output := CAST_TO_uint32_t_uint24_t(
     VAR_read_address);

     -- CAST_TO_uint32_t[uxn_ram_screen_h_l19_c10_6aad] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_6aad_return_output := CAST_TO_uint32_t_uint2_t(
     VAR_write_value);

     -- Submodule level 1
     VAR_raddr_uxn_ram_screen_h_l17_c2_8989 := VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l17_c10_b4bb_return_output;
     VAR_waddr_uxn_ram_screen_h_l18_c2_8b6c := VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_34ee_return_output;
     VAR_wdata_uxn_ram_screen_h_l19_c2_8621 := VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_6aad_return_output;
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0 := resize(VAR_raddr_uxn_ram_screen_h_l17_c2_8989, 18);
     REG_VAR_raddr := VAR_raddr_uxn_ram_screen_h_l17_c2_8989;
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0 := resize(VAR_waddr_uxn_ram_screen_h_l18_c2_8b6c, 18);
     REG_VAR_waddr := VAR_waddr_uxn_ram_screen_h_l18_c2_8b6c;
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd := resize(VAR_wdata_uxn_ram_screen_h_l19_c2_8621, 2);
     REG_VAR_wdata := VAR_wdata_uxn_ram_screen_h_l19_c2_8621;
     -- bg_vram_update_bg_vram_RAM_DP_RF_1[uxn_ram_screen_h_l21_c18_7291] LATENCY=0
     -- Clock enable
     bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE <= VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_CLOCK_ENABLE;
     -- Inputs
     bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0 <= VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_r0;
     bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0 <= VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_addr_w0;
     bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd <= VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_wd;
     bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we <= VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_we;
     -- Outputs
     VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output := bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_bg_vram_update_bg_vram_RAM_DP_RF_1_uxn_ram_screen_h_l21_c18_7291_return_output;
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
