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
entity main_ram_read_0CLK_8ab28aec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end main_ram_read_0CLK_8ab28aec;
architecture arch of main_ram_read_0CLK_8ab28aec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal main_r_rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal main_r_rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal main_r_wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_main_r_rdaddr : unsigned(31 downto 0);
signal REG_COMB_main_r_rwaddr : unsigned(31 downto 0);
signal REG_COMB_main_r_wdata : unsigned(7 downto 0);

-- Each function instance gets signals
-- main_ram[uxn_ram_main_h_l27_c40_06d4]
signal main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_addr0 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0 : unsigned(7 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_valid0 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_addr1 : unsigned(31 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_valid1 : unsigned(0 downto 0);
signal main_ram_uxn_ram_main_h_l27_c40_06d4_return_output : main_ram_outputs_t;

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- main_ram_uxn_ram_main_h_l27_c40_06d4
main_ram_uxn_ram_main_h_l27_c40_06d4 : entity work.main_ram_0CLK_b45f1687 port map (
clk,
main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE,
main_ram_uxn_ram_main_h_l27_c40_06d4_addr0,
main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0,
main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0,
main_ram_uxn_ram_main_h_l27_c40_06d4_valid0,
main_ram_uxn_ram_main_h_l27_c40_06d4_addr1,
main_ram_uxn_ram_main_h_l27_c40_06d4_valid1,
main_ram_uxn_ram_main_h_l27_c40_06d4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 -- Registers
 main_r_rdaddr,
 main_r_rwaddr,
 main_r_wdata,
 -- All submodule outputs
 main_ram_uxn_ram_main_h_l27_c40_06d4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_address : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_ram_main_h_l21_c18_41e4_return_output : unsigned(31 downto 0);
 variable VAR_main_r_wr_en : unsigned(0 downto 0);
 variable VAR_main_r_rw_valid : unsigned(0 downto 0);
 variable VAR_main_r_rd_valid : unsigned(0 downto 0);
 variable VAR_main_r_ram_out : main_ram_outputs_t;
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr0 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0 : unsigned(7 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid0 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr1 : unsigned(31 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid1 : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_return_output : main_ram_outputs_t;
 variable VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l36_c9_4dba_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_main_r_rdaddr : unsigned(31 downto 0);
variable REG_VAR_main_r_rwaddr : unsigned(31 downto 0);
variable REG_VAR_main_r_wdata : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_main_r_rdaddr := main_r_rdaddr;
  REG_VAR_main_r_rwaddr := main_r_rwaddr;
  REG_VAR_main_r_wdata := main_r_wdata;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid1 := to_unsigned(1, 1);
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid0 := to_unsigned(1, 1);
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0 := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     REG_VAR_main_r_rwaddr := main_r_rwaddr;
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr0 := main_r_rwaddr;
     REG_VAR_main_r_wdata := main_r_wdata;
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0 := main_r_wdata;
     -- CAST_TO_uint32_t[uxn_ram_main_h_l21_c18_41e4] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_ram_main_h_l21_c18_41e4_return_output := CAST_TO_uint32_t_uint16_t(
     VAR_address);

     -- Submodule level 1
     REG_VAR_main_r_rdaddr := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l21_c18_41e4_return_output;
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr1 := VAR_CAST_TO_uint32_t_uxn_ram_main_h_l21_c18_41e4_return_output;
     -- main_ram[uxn_ram_main_h_l27_c40_06d4] LATENCY=0
     -- Clock enable
     main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_CLOCK_ENABLE;
     -- Inputs
     main_ram_uxn_ram_main_h_l27_c40_06d4_addr0 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr0;
     main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_data0;
     main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_wr_en0;
     main_ram_uxn_ram_main_h_l27_c40_06d4_valid0 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid0;
     main_ram_uxn_ram_main_h_l27_c40_06d4_addr1 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_addr1;
     main_ram_uxn_ram_main_h_l27_c40_06d4_valid1 <= VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_valid1;
     -- Outputs
     VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_return_output := main_ram_uxn_ram_main_h_l27_c40_06d4_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d[uxn_ram_main_h_l36_c9_4dba] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l36_c9_4dba_return_output := VAR_main_ram_uxn_ram_main_h_l27_c40_06d4_return_output.rd_data1;

     -- Submodule level 3
     VAR_return_output := VAR_CONST_REF_RD_uint8_t_main_ram_outputs_t_rd_data1_d41d_uxn_ram_main_h_l36_c9_4dba_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_main_r_rdaddr <= REG_VAR_main_r_rdaddr;
REG_COMB_main_r_rwaddr <= REG_VAR_main_r_rwaddr;
REG_COMB_main_r_wdata <= REG_VAR_main_r_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     main_r_rdaddr <= REG_COMB_main_r_rdaddr;
     main_r_rwaddr <= REG_COMB_main_r_rwaddr;
     main_r_wdata <= REG_COMB_main_r_wdata;
 end if;
 end if;
end process;

end arch;
