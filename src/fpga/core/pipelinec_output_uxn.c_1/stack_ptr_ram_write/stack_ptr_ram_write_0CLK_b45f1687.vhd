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
-- Submodules: 1
entity stack_ptr_ram_write_0CLK_b45f1687 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 value : in unsigned(7 downto 0));
end stack_ptr_ram_write_0CLK_b45f1687;
architecture arch of stack_ptr_ram_write_0CLK_b45f1687 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_p_w_rdaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal stack_p_w_rwaddr : unsigned(31 downto 0) := to_unsigned(0, 32);
signal stack_p_w_wdata : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_stack_p_w_rdaddr : unsigned(31 downto 0);
signal REG_COMB_stack_p_w_rwaddr : unsigned(31 downto 0);
signal REG_COMB_stack_p_w_wdata : unsigned(7 downto 0);

-- Each function instance gets signals
function CAST_TO_uint32_t_uint1_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(0 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 


-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 value,
 -- Registers
 stack_p_w_rdaddr,
 stack_p_w_rwaddr,
 stack_p_w_wdata)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_value : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_stack_h_l144_c21_8834_return_output : unsigned(31 downto 0);
 variable VAR_stack_p_w_wr_en : unsigned(0 downto 0);
 variable VAR_stack_p_w_rw_valid : unsigned(0 downto 0);
 variable VAR_stack_p_w_rd_valid : unsigned(0 downto 0);
 variable VAR_stack_p_w_ram_out : stack_p_ram_outputs_t;
 -- State registers comb logic variables
variable REG_VAR_stack_p_w_rdaddr : unsigned(31 downto 0);
variable REG_VAR_stack_p_w_rwaddr : unsigned(31 downto 0);
variable REG_VAR_stack_p_w_wdata : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_p_w_rdaddr := stack_p_w_rdaddr;
  REG_VAR_stack_p_w_rwaddr := stack_p_w_rwaddr;
  REG_VAR_stack_p_w_wdata := stack_p_w_wdata;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_value := value;

     -- Submodule level 0
     REG_VAR_stack_p_w_rdaddr := stack_p_w_rdaddr;
     REG_VAR_stack_p_w_wdata := VAR_value;
     -- CAST_TO_uint32_t[uxn_stack_h_l144_c21_8834] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_stack_h_l144_c21_8834_return_output := CAST_TO_uint32_t_uint1_t(
     VAR_stack_index);

     -- Submodule level 1
     REG_VAR_stack_p_w_rwaddr := VAR_CAST_TO_uint32_t_uxn_stack_h_l144_c21_8834_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_stack_p_w_rdaddr <= REG_VAR_stack_p_w_rdaddr;
REG_COMB_stack_p_w_rwaddr <= REG_VAR_stack_p_w_rwaddr;
REG_COMB_stack_p_w_wdata <= REG_VAR_stack_p_w_wdata;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     stack_p_w_rdaddr <= REG_COMB_stack_p_w_rdaddr;
     stack_p_w_rwaddr <= REG_COMB_stack_p_w_rwaddr;
     stack_p_w_wdata <= REG_COMB_stack_p_w_wdata;
 end if;
 end if;
end process;

end arch;
