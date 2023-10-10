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
entity main_ram_update_0CLK_380ecc95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 read_address : in unsigned(15 downto 0);
 value : in unsigned(7 downto 0);
 write_enable : in unsigned(0 downto 0);
 return_output : out unsigned(7 downto 0));
end main_ram_update_0CLK_380ecc95;
architecture arch of main_ram_update_0CLK_380ecc95 is
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
-- main_ram_update_main_ram_RAM_SP_RF_1[uxn_ram_main_h_l14_c19_b58d]
signal main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0 : unsigned(15 downto 0);
signal main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd : unsigned(7 downto 0);
signal main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we : unsigned(0 downto 0);
signal main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output : unsigned(7 downto 0);

-- printf_uxn_ram_main_h_l20_c3_64cc[uxn_ram_main_h_l20_c3_64cc]
signal printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2 : unsigned(31 downto 0);
signal printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3 : unsigned(31 downto 0);

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d : entity work.main_ram_update_main_ram_RAM_SP_RF_1_0CLK_de264c78 port map (
clk,
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE,
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0,
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd,
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we,
main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output);

-- printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc : entity work.printf_uxn_ram_main_h_l20_c3_64cc_0CLK_de264c78 port map (
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE,
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0,
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1,
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2,
printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 read_address,
 value,
 write_enable,
 -- Registers
 rwaddr,
 wdata,
 -- All submodule outputs
 main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_read_address : unsigned(15 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_write_enable : unsigned(0 downto 0);
 variable VAR_main_ram : uint8_t_65536;
 variable VAR_rwaddr_uxn_ram_main_h_l11_c2_6ffd : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l11_c11_8d37_return_output : unsigned(31 downto 0);
 variable VAR_wdata_uxn_ram_main_h_l12_c2_3dd5 : unsigned(7 downto 0);
 variable VAR_rdata : unsigned(7 downto 0);
 variable VAR_rdata_uxn_ram_main_h_l14_c11_9f77_0 : unsigned(7 downto 0);
 variable VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0 : unsigned(15 downto 0);
 variable VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd : unsigned(7 downto 0);
 variable VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we : unsigned(0 downto 0);
 variable VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3 : unsigned(31 downto 0);
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
     VAR_read_address := read_address;
     VAR_value := value;
     VAR_write_enable := write_enable;

     -- Submodule level 0
     VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_wdata_uxn_ram_main_h_l12_c2_3dd5 := VAR_value;
     VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we := VAR_write_enable;
     VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1 := resize(VAR_write_enable, 32);
     VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd := VAR_wdata_uxn_ram_main_h_l12_c2_3dd5;
     VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2 := resize(VAR_wdata_uxn_ram_main_h_l12_c2_3dd5, 32);
     REG_VAR_wdata := VAR_wdata_uxn_ram_main_h_l12_c2_3dd5;
     -- CAST_TO_uint32_t[uxn_ram_main_h_l11_c11_8d37] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l11_c11_8d37_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_read_address);

     -- Submodule level 1
     VAR_rwaddr_uxn_ram_main_h_l11_c2_6ffd := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l11_c11_8d37_return_output;
     VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0 := resize(VAR_rwaddr_uxn_ram_main_h_l11_c2_6ffd, 16);
     VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0 := VAR_rwaddr_uxn_ram_main_h_l11_c2_6ffd;
     REG_VAR_rwaddr := VAR_rwaddr_uxn_ram_main_h_l11_c2_6ffd;
     -- main_ram_update_main_ram_RAM_SP_RF_1[uxn_ram_main_h_l14_c19_b58d] LATENCY=0
     -- Clock enable
     main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE <= VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_CLOCK_ENABLE;
     -- Inputs
     main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0 <= VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_addr0;
     main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd <= VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_wd;
     main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we <= VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_we;
     -- Outputs
     VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output := main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output;

     -- Submodule level 2
     VAR_rdata_uxn_ram_main_h_l14_c11_9f77_0 := VAR_main_ram_update_main_ram_RAM_SP_RF_1_uxn_ram_main_h_l14_c19_b58d_return_output;
     VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3 := resize(VAR_rdata_uxn_ram_main_h_l14_c11_9f77_0, 32);
     VAR_return_output := VAR_rdata_uxn_ram_main_h_l14_c11_9f77_0;
     -- printf_uxn_ram_main_h_l20_c3_64cc[uxn_ram_main_h_l20_c3_64cc] LATENCY=0
     -- Clock enable
     printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE <= VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0 <= VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg0;
     printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1 <= VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg1;
     printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2 <= VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg2;
     printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3 <= VAR_printf_uxn_ram_main_h_l20_c3_64cc_uxn_ram_main_h_l20_c3_64cc_arg3;
     -- Outputs

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
