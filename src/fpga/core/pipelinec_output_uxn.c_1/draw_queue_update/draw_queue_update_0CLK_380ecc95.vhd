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
entity draw_queue_update_0CLK_380ecc95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(9 downto 0);
 write_address : in unsigned(9 downto 0);
 write_value : in unsigned(23 downto 0);
 write_enable : in unsigned(0 downto 0);
 return_output : out unsigned(23 downto 0));
end draw_queue_update_0CLK_380ecc95;
architecture arch of draw_queue_update_0CLK_380ecc95 is
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
-- draw_queue_update_draw_queue_ram_RAM_DP_RF_1[uxn_ram_screen_h_l22_c19_89bf]
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0 : unsigned(9 downto 0);
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0 : unsigned(9 downto 0);
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd : unsigned(23 downto 0);
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we : unsigned(0 downto 0);
signal draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output : unsigned(23 downto 0);

function CAST_TO_uint32_t_uint10_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(9 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf : entity work.draw_queue_update_draw_queue_ram_RAM_DP_RF_1_0CLK_de264c78 port map (
clk,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we,
draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output);



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
 draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(23 downto 0);
 variable VAR_read_address : unsigned(9 downto 0);
 variable VAR_write_address : unsigned(9 downto 0);
 variable VAR_write_value : unsigned(23 downto 0);
 variable VAR_write_enable : unsigned(0 downto 0);
 variable VAR_draw_queue_ram : uint24_t_1024;
 variable VAR_raddr_uxn_ram_screen_h_l18_c2_2408 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_5151_return_output : unsigned(31 downto 0);
 variable VAR_waddr_uxn_ram_screen_h_l19_c2_eb90 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_9f6f_return_output : unsigned(31 downto 0);
 variable VAR_wdata_uxn_ram_screen_h_l20_c2_9658 : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(23 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0 : unsigned(9 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0 : unsigned(9 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd : unsigned(23 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we : unsigned(0 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output : unsigned(23 downto 0);
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
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we := VAR_write_enable;
     VAR_wdata_uxn_ram_screen_h_l20_c2_9658 := resize(VAR_write_value, 32);
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd := resize(VAR_wdata_uxn_ram_screen_h_l20_c2_9658, 24);
     REG_VAR_wdata := VAR_wdata_uxn_ram_screen_h_l20_c2_9658;
     -- CAST_TO_uint32_t[uxn_ram_screen_h_l18_c10_5151] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_5151_return_output := CAST_TO_uint32_t_uint10_t(
     VAR_read_address);

     -- CAST_TO_uint32_t[uxn_ram_screen_h_l19_c10_9f6f] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_9f6f_return_output := CAST_TO_uint32_t_uint10_t(
     VAR_write_address);

     -- Submodule level 1
     VAR_raddr_uxn_ram_screen_h_l18_c2_2408 := VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l18_c10_5151_return_output;
     VAR_waddr_uxn_ram_screen_h_l19_c2_eb90 := VAR_CAST_TO_uint32_t_uxn_ram_screen_h_l19_c10_9f6f_return_output;
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0 := resize(VAR_raddr_uxn_ram_screen_h_l18_c2_2408, 10);
     REG_VAR_raddr := VAR_raddr_uxn_ram_screen_h_l18_c2_2408;
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0 := resize(VAR_waddr_uxn_ram_screen_h_l19_c2_eb90, 10);
     REG_VAR_waddr := VAR_waddr_uxn_ram_screen_h_l19_c2_eb90;
     -- draw_queue_update_draw_queue_ram_RAM_DP_RF_1[uxn_ram_screen_h_l22_c19_89bf] LATENCY=0
     -- Clock enable
     draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE <= VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_CLOCK_ENABLE;
     -- Inputs
     draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0 <= VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_r0;
     draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0 <= VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_addr_w0;
     draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd <= VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_wd;
     draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we <= VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_we;
     -- Outputs
     VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output := draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_draw_queue_update_draw_queue_ram_RAM_DP_RF_1_uxn_ram_screen_h_l22_c19_89bf_return_output;
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
