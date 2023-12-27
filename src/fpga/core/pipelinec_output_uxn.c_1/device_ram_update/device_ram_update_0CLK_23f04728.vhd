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
entity device_ram_update_0CLK_23f04728 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 value : in unsigned(7 downto 0);
 write_enable : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end device_ram_update_0CLK_23f04728;
architecture arch of device_ram_update_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(7 downto 0);

-- Each function instance gets signals
-- device_ram_update_device_ram_RAM_SP_RF_1[uxn_ram_device_h_l12_c18_a70b]
signal device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0 : unsigned(7 downto 0);
signal device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd : unsigned(7 downto 0);
signal device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we : unsigned(0 downto 0);
signal device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output : unsigned(7 downto 0);

function CAST_TO_uint32_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b : entity work.device_ram_update_device_ram_RAM_SP_RF_1_0CLK_de264c78 port map (
clk,
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE,
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0,
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd,
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we,
device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 value,
 write_enable,
 -- Registers
 rwaddr,
 wdata,
 -- All submodule outputs
 device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_write_enable : unsigned(0 downto 0);
 variable VAR_device_ram : uint8_t_256;
 variable VAR_rwaddr_uxn_ram_device_h_l9_c2_ca17 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_device_h_l9_c11_384f_return_output : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(7 downto 0);
 variable VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd : unsigned(7 downto 0);
 variable VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we : unsigned(0 downto 0);
 variable VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_value := value;
     VAR_write_enable := write_enable;

     -- Submodule level 0
     VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd := VAR_value;
     REG_VAR_wdata := VAR_value;
     VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we := VAR_write_enable;
     -- CAST_TO_uint32_t[uxn_ram_device_h_l9_c11_384f] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_device_h_l9_c11_384f_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_rwaddr_uxn_ram_device_h_l9_c2_ca17 := VAR_CAST_TO_uint32_t_uxn_ram_device_h_l9_c11_384f_return_output;
     VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0 := resize(VAR_rwaddr_uxn_ram_device_h_l9_c2_ca17, 8);
     REG_VAR_rwaddr := VAR_rwaddr_uxn_ram_device_h_l9_c2_ca17;
     -- device_ram_update_device_ram_RAM_SP_RF_1[uxn_ram_device_h_l12_c18_a70b] LATENCY=0
     -- Clock enable
     device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE <= VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0 <= VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_addr0;
     device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd <= VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_wd;
     device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we <= VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_we;
     -- Outputs
     VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output := device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_device_ram_update_device_ram_RAM_SP_RF_1_uxn_ram_device_h_l12_c18_a70b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rwaddr <= REG_VAR_rwaddr;
REG_COMB_wdata <= REG_VAR_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rwaddr <= REG_COMB_rwaddr;
     wdata <= REG_COMB_wdata;
 end if;
 end if;
end process;

end arch;
