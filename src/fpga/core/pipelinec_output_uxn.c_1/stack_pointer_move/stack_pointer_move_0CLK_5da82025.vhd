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
-- Submodules: 5
entity stack_pointer_move_0CLK_5da82025 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 adjustment : in unsigned(7 downto 0);
 is_negative : in unsigned(0 downto 0));
end stack_pointer_move_0CLK_5da82025;
architecture arch of stack_pointer_move_0CLK_5da82025 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal stack_ptr_existing : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_ptr_new : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_stack_ptr_existing : unsigned(7 downto 0);
signal REG_COMB_stack_ptr_new : unsigned(7 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l203_c23_2f19]
signal stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output : unsigned(7 downto 0);

-- stack_ptr_new_MUX[uxn_stack_h_l204_c2_9205]
signal stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond : unsigned(0 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue : unsigned(7 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse : unsigned(7 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l205_c19_8948]
signal BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l207_c19_403f]
signal BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output : unsigned(8 downto 0);

-- stack_pointer_set[uxn_stack_h_l210_c2_e68a]
signal stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l210_c2_e68a_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l203_c23_2f19
stack_pointer_get_uxn_stack_h_l203_c23_2f19 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index,
stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output);

-- stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205
stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond,
stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue,
stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse,
stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l205_c19_8948
BIN_OP_MINUS_uxn_stack_h_l205_c19_8948 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left,
BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right,
BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l207_c19_403f
BIN_OP_PLUS_uxn_stack_h_l207_c19_403f : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left,
BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right,
BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output);

-- stack_pointer_set_uxn_stack_h_l210_c2_e68a
stack_pointer_set_uxn_stack_h_l210_c2_e68a : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index,
stack_pointer_set_uxn_stack_h_l210_c2_e68a_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 adjustment,
 is_negative,
 -- Registers
 stack_ptr_existing,
 stack_ptr_new,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output,
 stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output,
 BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output,
 BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_adjustment : unsigned(7 downto 0);
 variable VAR_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_uxn_stack_h_l207_c3_09a2 : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output : unsigned(8 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_stack_ptr_existing : unsigned(7 downto 0);
variable REG_VAR_stack_ptr_new : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_stack_ptr_existing := stack_ptr_existing;
  REG_VAR_stack_ptr_new := stack_ptr_new;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_adjustment := adjustment;
     VAR_is_negative := is_negative;

     -- Submodule level 0
     VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right := VAR_adjustment;
     VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right := VAR_adjustment;
     VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond := VAR_is_negative;
     VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index := VAR_stack_index;
     -- stack_pointer_get[uxn_stack_h_l203_c23_2f19] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output := stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left := VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left := VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output;
     REG_VAR_stack_ptr_existing := VAR_stack_pointer_get_uxn_stack_h_l203_c23_2f19_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l207_c19_403f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_left;
     BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output := BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output;

     -- BIN_OP_MINUS[uxn_stack_h_l205_c19_8948] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_left;
     BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output := BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output;

     -- Submodule level 2
     VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue := VAR_BIN_OP_MINUS_uxn_stack_h_l205_c19_8948_return_output;
     VAR_stack_ptr_new_uxn_stack_h_l207_c3_09a2 := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l207_c19_403f_return_output, 8);
     VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse := VAR_stack_ptr_new_uxn_stack_h_l207_c3_09a2;
     -- stack_ptr_new_MUX[uxn_stack_h_l204_c2_9205] LATENCY=0
     -- Inputs
     stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond <= VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_cond;
     stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue <= VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iftrue;
     stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse <= VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_iffalse;
     -- Outputs
     VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output := stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output;

     -- Submodule level 3
     VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_value := VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output;
     REG_VAR_stack_ptr_new := VAR_stack_ptr_new_MUX_uxn_stack_h_l204_c2_9205_return_output;
     -- stack_pointer_set[uxn_stack_h_l210_c2_e68a] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_stack_index;
     stack_pointer_set_uxn_stack_h_l210_c2_e68a_value <= VAR_stack_pointer_set_uxn_stack_h_l210_c2_e68a_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_stack_ptr_existing <= REG_VAR_stack_ptr_existing;
REG_COMB_stack_ptr_new <= REG_VAR_stack_ptr_new;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     stack_ptr_existing <= REG_COMB_stack_ptr_existing;
     stack_ptr_new <= REG_COMB_stack_ptr_new;
 end if;
 end if;
end process;

end arch;