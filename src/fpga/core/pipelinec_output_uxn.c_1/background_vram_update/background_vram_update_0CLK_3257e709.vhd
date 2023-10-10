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
entity background_vram_update_0CLK_3257e709 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 write0_address : in unsigned(31 downto 0);
 write0_value : in unsigned(1 downto 0);
 write0_enable : in unsigned(0 downto 0);
 read1_address : in unsigned(31 downto 0);
 read1_enable : in unsigned(0 downto 0);
 return_output : out unsigned(1 downto 0));
end background_vram_update_0CLK_3257e709;
architecture arch of background_vram_update_0CLK_3257e709 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal wdata : unsigned(1 downto 0) := to_unsigned(0, 2);
signal bg_vram_result : unsigned(1 downto 0) := to_unsigned(0, 2);
signal REG_COMB_rdaddr : unsigned(31 downto 0);
signal REG_COMB_rwaddr : unsigned(31 downto 0);
signal REG_COMB_wdata : unsigned(1 downto 0);
signal REG_COMB_bg_vram_result : unsigned(1 downto 0);

-- Each function instance gets signals
-- background_vram[uxn_ram_screen_h_l37_c42_b516]
signal background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_addr0 : unsigned(31 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0 : unsigned(1 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0 : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_valid0 : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0 : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_addr1 : unsigned(31 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_valid1 : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1 : unsigned(0 downto 0);
signal background_vram_uxn_ram_screen_h_l37_c42_b516_return_output : background_vram_outputs_t;

-- printf_uxn_ram_screen_h_l50_c2_c0d8[uxn_ram_screen_h_l50_c2_c0d8]
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0 : unsigned(31 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1 : unsigned(31 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2 : unsigned(31 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3 : unsigned(31 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4 : unsigned(31 downto 0);
signal printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5 : unsigned(31 downto 0);

function CAST_TO_uint4_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- background_vram_uxn_ram_screen_h_l37_c42_b516
background_vram_uxn_ram_screen_h_l37_c42_b516 : entity work.background_vram_0CLK_b45f1687 port map (
clk,
background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE,
background_vram_uxn_ram_screen_h_l37_c42_b516_addr0,
background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0,
background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0,
background_vram_uxn_ram_screen_h_l37_c42_b516_valid0,
background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0,
background_vram_uxn_ram_screen_h_l37_c42_b516_addr1,
background_vram_uxn_ram_screen_h_l37_c42_b516_valid1,
background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1,
background_vram_uxn_ram_screen_h_l37_c42_b516_return_output);

-- printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8 : entity work.printf_uxn_ram_screen_h_l50_c2_c0d8_0CLK_de264c78 port map (
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4,
printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 write0_address,
 write0_value,
 write0_enable,
 read1_address,
 read1_enable,
 -- Registers
 rdaddr,
 rwaddr,
 wdata,
 bg_vram_result,
 -- All submodule outputs
 background_vram_uxn_ram_screen_h_l37_c42_b516_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(1 downto 0);
 variable VAR_write0_address : unsigned(31 downto 0);
 variable VAR_write0_value : unsigned(1 downto 0);
 variable VAR_write0_enable : unsigned(0 downto 0);
 variable VAR_read1_address : unsigned(31 downto 0);
 variable VAR_read1_enable : unsigned(0 downto 0);
 variable VAR_rw_valid : unsigned(0 downto 0);
 variable VAR_rd_valid : unsigned(0 downto 0);
 variable VAR_bg_vram_out : background_vram_outputs_t;
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr0 : unsigned(31 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0 : unsigned(1 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0 : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid0 : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0 : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr1 : unsigned(31 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid1 : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1 : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_return_output : background_vram_outputs_t;
 variable VAR_CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l48_c19_a262_return_output : unsigned(1 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c148_82db_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c188_6742_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5 : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_rdaddr : unsigned(31 downto 0);
variable REG_VAR_rwaddr : unsigned(31 downto 0);
variable REG_VAR_wdata : unsigned(1 downto 0);
variable REG_VAR_bg_vram_result : unsigned(1 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_rdaddr := rdaddr;
  REG_VAR_rwaddr := rwaddr;
  REG_VAR_wdata := wdata;
  REG_VAR_bg_vram_result := bg_vram_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0 := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_write0_address := write0_address;
     VAR_write0_value := write0_value;
     VAR_write0_enable := write0_enable;
     VAR_read1_address := read1_address;
     VAR_read1_enable := read1_enable;

     -- Submodule level 0
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr1 := VAR_read1_address;
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3 := VAR_read1_address;
     REG_VAR_rdaddr := VAR_read1_address;
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1 := VAR_read1_enable;
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid1 := VAR_read1_enable;
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4 := resize(VAR_read1_enable, 32);
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr0 := VAR_write0_address;
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0 := VAR_write0_address;
     REG_VAR_rwaddr := VAR_write0_address;
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid0 := VAR_write0_enable;
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0 := VAR_write0_enable;
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1 := resize(VAR_write0_enable, 32);
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0 := VAR_write0_value;
     REG_VAR_wdata := VAR_write0_value;
     -- CAST_TO_uint4_t[uxn_ram_screen_h_l50_c148_82db] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c148_82db_return_output := CAST_TO_uint4_t_uint2_t(
     VAR_write0_value);

     -- background_vram[uxn_ram_screen_h_l37_c42_b516] LATENCY=0
     -- Clock enable
     background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_CLOCK_ENABLE;
     -- Inputs
     background_vram_uxn_ram_screen_h_l37_c42_b516_addr0 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr0;
     background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_data0;
     background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_wr_en0;
     background_vram_uxn_ram_screen_h_l37_c42_b516_valid0 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid0;
     background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en0;
     background_vram_uxn_ram_screen_h_l37_c42_b516_addr1 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_addr1;
     background_vram_uxn_ram_screen_h_l37_c42_b516_valid1 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_valid1;
     background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1 <= VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_rd_en1;
     -- Outputs
     VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_return_output := background_vram_uxn_ram_screen_h_l37_c42_b516_return_output;

     -- Submodule level 1
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c148_82db_return_output, 32);
     -- CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d[uxn_ram_screen_h_l48_c19_a262] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l48_c19_a262_return_output := VAR_background_vram_uxn_ram_screen_h_l37_c42_b516_return_output.rd_data1;

     -- Submodule level 2
     REG_VAR_bg_vram_result := VAR_CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l48_c19_a262_return_output;
     VAR_return_output := VAR_CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l48_c19_a262_return_output;
     -- CAST_TO_uint4_t[uxn_ram_screen_h_l50_c188_6742] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c188_6742_return_output := CAST_TO_uint4_t_uint2_t(
     VAR_CONST_REF_RD_uint2_t_background_vram_outputs_t_rd_data1_d41d_uxn_ram_screen_h_l48_c19_a262_return_output);

     -- Submodule level 3
     VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5 := resize(VAR_CAST_TO_uint4_t_uxn_ram_screen_h_l50_c188_6742_return_output, 32);
     -- printf_uxn_ram_screen_h_l50_c2_c0d8[uxn_ram_screen_h_l50_c2_c0d8] LATENCY=0
     -- Clock enable
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg0;
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg1;
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg2;
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg3;
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg4;
     printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5 <= VAR_printf_uxn_ram_screen_h_l50_c2_c0d8_uxn_ram_screen_h_l50_c2_c0d8_arg5;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_rdaddr <= REG_VAR_rdaddr;
REG_COMB_rwaddr <= REG_VAR_rwaddr;
REG_COMB_wdata <= REG_VAR_wdata;
REG_COMB_bg_vram_result <= REG_VAR_bg_vram_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     rdaddr <= REG_COMB_rdaddr;
     rwaddr <= REG_COMB_rwaddr;
     wdata <= REG_COMB_wdata;
     bg_vram_result <= REG_COMB_bg_vram_result;
 end if;
 end if;
end process;

end arch;
