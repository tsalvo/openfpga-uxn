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
entity read_rom_byte_0CLK_380ecc95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end read_rom_byte_0CLK_380ecc95;
architecture arch of read_rom_byte_0CLK_380ecc95 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_rdaddr : unsigned(31 downto 0);

-- Each function instance gets signals
-- read_rom_byte_uxn_rom_RAM_SP_RF_1[uxn_rom_h_l164_c19_84b2]
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0 : unsigned(8 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd : unsigned(7 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output : unsigned(7 downto 0);

-- printf_uxn_rom_h_l170_c3_2880[uxn_rom_h_l170_c3_2880]
signal printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0 : unsigned(31 downto 0);
signal printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1 : unsigned(31 downto 0);

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2 : entity work.read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 port map (
clk,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output);

-- printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880
printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880 : entity work.printf_uxn_rom_h_l170_c3_2880_0CLK_de264c78 port map (
printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE,
printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0,
printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 read_address,
 -- Registers
 rdaddr,
 -- All submodule outputs
 read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_read_address : unsigned(15 downto 0);
 variable VAR_uxn_rom : uint8_t_512;
 variable VAR_rdaddr_uxn_rom_h_l162_c3_9c2d : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_rom_h_l162_c12_a0e0_return_output : unsigned(31 downto 0);
 variable VAR_rdata : unsigned(7 downto 0);
 variable VAR_rdata_uxn_rom_h_l164_c11_8a0b_0 : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0 : unsigned(8 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1 : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd := resize(to_unsigned(0, 1), 8);
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_read_address := read_address;

     -- Submodule level 0
     VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- CAST_TO_uint32_t[uxn_rom_h_l162_c12_a0e0] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_rom_h_l162_c12_a0e0_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_read_address);

     -- Submodule level 1
     VAR_rdaddr_uxn_rom_h_l162_c3_9c2d := VAR_CAST_TO_uint32_t_uxn_rom_h_l162_c12_a0e0_return_output;
     VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0 := VAR_rdaddr_uxn_rom_h_l162_c3_9c2d;
     REG_VAR_rdaddr := VAR_rdaddr_uxn_rom_h_l162_c3_9c2d;
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0 := resize(VAR_rdaddr_uxn_rom_h_l162_c3_9c2d, 9);
     -- read_rom_byte_uxn_rom_RAM_SP_RF_1[uxn_rom_h_l164_c19_84b2] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0 <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_addr0;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_wd;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_we;
     -- Outputs
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output := read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output;

     -- Submodule level 2
     VAR_rdata_uxn_rom_h_l164_c11_8a0b_0 := VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l164_c19_84b2_return_output;
     VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1 := resize(VAR_rdata_uxn_rom_h_l164_c11_8a0b_0, 32);
     VAR_return_output := VAR_rdata_uxn_rom_h_l164_c11_8a0b_0;
     -- printf_uxn_rom_h_l170_c3_2880[uxn_rom_h_l170_c3_2880] LATENCY=0
     -- Clock enable
     printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE <= VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0 <= VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg0;
     printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1 <= VAR_printf_uxn_rom_h_l170_c3_2880_uxn_rom_h_l170_c3_2880_arg1;
     -- Outputs

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
