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
entity stack_r_ram_read_0CLK_8ab28aec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(7 downto 0));
end stack_r_ram_read_0CLK_8ab28aec;
architecture arch of stack_r_ram_read_0CLK_8ab28aec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_r_r_rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_stack_r_r_rdaddr : unsigned(31 downto 0);

-- Each function instance gets signals
-- stack_r_ram[uxn_stack_h_l86_c44_03ff]
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0 : unsigned(31 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0 : unsigned(7 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1 : unsigned(31 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1 : unsigned(0 downto 0);
signal stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output : stack_r_ram_outputs_t;

function CAST_TO_uint32_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_r_ram_uxn_stack_h_l86_c44_03ff
stack_r_ram_uxn_stack_h_l86_c44_03ff : entity work.stack_r_ram_0CLK_b45f1687 port map (
clk,
stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE,
stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0,
stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0,
stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0,
stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0,
stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0,
stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1,
stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1,
stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1,
stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 -- Registers
 stack_r_r_rdaddr,
 -- All submodule outputs
 stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l84_c21_2828_return_output : unsigned(31 downto 0);
 variable VAR_stack_r_r_ram_out : stack_r_ram_outputs_t;
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0 : unsigned(31 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1 : unsigned(31 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1 : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output : stack_r_ram_outputs_t;
 variable VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l97_c9_6b9a_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_r_r_rdaddr : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_r_r_rdaddr := stack_r_r_rdaddr;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0 := to_unsigned(0, 1);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0 := resize(to_unsigned(0, 1), 8);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0 := to_unsigned(0, 1);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1 := to_unsigned(1, 1);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0 := resize(to_unsigned(0, 1), 32);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1 := to_unsigned(1, 1);
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0 := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- CAST_TO_uint32_t[uxn_stack_h_l84_c21_2828] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l84_c21_2828_return_output := CAST_TO_uint32_t_uint8_t(
     VAR_address);

     -- Submodule level 1
     REG_VAR_stack_r_r_rdaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l84_c21_2828_return_output;
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1 := VAR_CAST_TO_uint32_t_uxn_stack_h_l84_c21_2828_return_output;
     -- stack_r_ram[uxn_stack_h_l86_c44_03ff] LATENCY=0
     -- Clock enable
     stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr0;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_data0;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_wr_en0;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid0;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en0;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_addr1;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_valid1;
     stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1 <= VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_rd_en1;
     -- Outputs
     VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output := stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d[uxn_stack_h_l97_c9_6b9a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l97_c9_6b9a_return_output := VAR_stack_r_ram_uxn_stack_h_l86_c44_03ff_return_output.rd_data1;

     -- Submodule level 3
     VAR_return_output := VAR_CONST_REF_RD_uint8_t_stack_r_ram_outputs_t_rd_data1_d41d_uxn_stack_h_l97_c9_6b9a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_stack_r_r_rdaddr <= REG_VAR_stack_r_r_rdaddr;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     stack_r_r_rdaddr <= REG_COMB_stack_r_r_rdaddr;
 end if;
 end if;
end process;

end arch;
