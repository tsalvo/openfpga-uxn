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
entity read_rom_byte_0CLK_23f04728 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end read_rom_byte_0CLK_23f04728;
architecture arch of read_rom_byte_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_rdaddr : unsigned(31 downto 0);

-- Each function instance gets signals
-- read_rom_byte_uxn_rom_RAM_SP_RF_1[bounce_h_l239_c19_e332]
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0 : unsigned(8 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd : unsigned(7 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output : unsigned(7 downto 0);

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332 : entity work.read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 port map (
clk,
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE,
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0,
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd,
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we,
read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 read_address,
 -- Registers
 rdaddr,
 -- All submodule outputs
 read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_read_address : unsigned(15 downto 0);
 variable VAR_uxn_rom : uint8_t_512;
 variable VAR_rdaddr_bounce_h_l237_c3_a114 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_bounce_h_l237_c12_82b5_return_output : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0 : unsigned(8 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we := to_unsigned(0, 1);
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_read_address := read_address;

     -- Submodule level 0
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- CAST_TO_uint32_t[bounce_h_l237_c12_82b5] LATENCY=0
     VAR_CAST_TO_uint32_t_bounce_h_l237_c12_82b5_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_read_address);

     -- Submodule level 1
     VAR_rdaddr_bounce_h_l237_c3_a114 := VAR_CAST_TO_uint32_t_bounce_h_l237_c12_82b5_return_output;
     REG_VAR_rdaddr := VAR_rdaddr_bounce_h_l237_c3_a114;
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0 := resize(VAR_rdaddr_bounce_h_l237_c3_a114, 9);
     -- read_rom_byte_uxn_rom_RAM_SP_RF_1[bounce_h_l239_c19_e332] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0 <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_addr0;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_wd;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_we;
     -- Outputs
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output := read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_bounce_h_l239_c19_e332_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rdaddr <= REG_VAR_rdaddr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rdaddr <= REG_COMB_rdaddr;
 end if;
 end if;
end process;

end arch;
