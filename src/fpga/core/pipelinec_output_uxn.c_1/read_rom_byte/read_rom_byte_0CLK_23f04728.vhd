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
-- read_rom_byte_uxn_rom_RAM_SP_RF_1[uxn_rom_h_l26_c19_947f]
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0 : unsigned(6 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd : unsigned(7 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we : unsigned(0 downto 0);
signal read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_rom_h_l32_c3_b9e1]
signal BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output : unsigned(32 downto 0);


begin

-- SUBMODULE INSTANCES 
-- read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f : entity work.read_rom_byte_uxn_rom_RAM_SP_RF_1_0CLK_de264c78 port map (
clk,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we,
read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output);

-- BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1
BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1 : entity work.BIN_OP_PLUS_uint32_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left,
BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right,
BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 rdaddr,
 -- All submodule outputs
 read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output,
 BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_uxn_rom : uint8_t_128;
 variable VAR_rdata : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0 : unsigned(6 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd : unsigned(7 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output : unsigned(7 downto 0);
 variable VAR_rdaddr_uxn_rom_h_l32_c3_78a1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output : unsigned(32 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right := to_unsigned(1, 1);
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left := rdaddr;
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0 := resize(rdaddr, 7);
     -- BIN_OP_PLUS[uxn_rom_h_l32_c3_b9e1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left <= VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_left;
     BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right <= VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output := BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output;

     -- read_rom_byte_uxn_rom_RAM_SP_RF_1[uxn_rom_h_l26_c19_947f] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0 <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_addr0;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_wd;
     read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we <= VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_we;
     -- Outputs
     VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output := read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output;

     -- Submodule level 1
     VAR_rdaddr_uxn_rom_h_l32_c3_78a1 := resize(VAR_BIN_OP_PLUS_uxn_rom_h_l32_c3_b9e1_return_output, 32);
     VAR_return_output := VAR_read_rom_byte_uxn_rom_RAM_SP_RF_1_uxn_rom_h_l26_c19_947f_return_output;
     REG_VAR_rdaddr := VAR_rdaddr_uxn_rom_h_l32_c3_78a1;
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
