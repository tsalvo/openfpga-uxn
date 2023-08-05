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
-- stack_pointer_get[uxn_stack_h_l191_c23_27e8]
signal stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output : unsigned(7 downto 0);

-- stack_ptr_new_MUX[uxn_stack_h_l192_c2_ad06]
signal stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond : unsigned(0 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue : unsigned(7 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse : unsigned(7 downto 0);
signal stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_stack_h_l193_c19_85d1]
signal BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l195_c19_cede]
signal BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output : unsigned(8 downto 0);

-- stack_pointer_set[uxn_stack_h_l198_c2_8ed8]
signal stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l191_c23_27e8
stack_pointer_get_uxn_stack_h_l191_c23_27e8 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index,
stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output);

-- stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06
stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond,
stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue,
stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse,
stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output);

-- BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1
BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left,
BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right,
BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l195_c19_cede
BIN_OP_PLUS_uxn_stack_h_l195_c19_cede : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left,
BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right,
BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output);

-- stack_pointer_set_uxn_stack_h_l198_c2_8ed8
stack_pointer_set_uxn_stack_h_l198_c2_8ed8 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index,
stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value);



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
 stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output,
 stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output,
 BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output,
 BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_adjustment : unsigned(7 downto 0);
 variable VAR_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_uxn_stack_h_l195_c3_1edc : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output : unsigned(7 downto 0);
 variable VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output : unsigned(8 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right := VAR_adjustment;
     VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right := VAR_adjustment;
     VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond := VAR_is_negative;
     VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index := VAR_stack_index;
     -- stack_pointer_get[uxn_stack_h_l191_c23_27e8] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output := stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left := VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left := VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output;
     REG_VAR_stack_ptr_existing := VAR_stack_pointer_get_uxn_stack_h_l191_c23_27e8_return_output;
     -- BIN_OP_MINUS[uxn_stack_h_l193_c19_85d1] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left <= VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_left;
     BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right <= VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output := BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l195_c19_cede] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_left;
     BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output := BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output;

     -- Submodule level 2
     VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue := VAR_BIN_OP_MINUS_uxn_stack_h_l193_c19_85d1_return_output;
     VAR_stack_ptr_new_uxn_stack_h_l195_c3_1edc := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l195_c19_cede_return_output, 8);
     VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse := VAR_stack_ptr_new_uxn_stack_h_l195_c3_1edc;
     -- stack_ptr_new_MUX[uxn_stack_h_l192_c2_ad06] LATENCY=0
     -- Inputs
     stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond <= VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_cond;
     stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue <= VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iftrue;
     stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse <= VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_iffalse;
     -- Outputs
     VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output := stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output;

     -- Submodule level 3
     VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value := VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output;
     REG_VAR_stack_ptr_new := VAR_stack_ptr_new_MUX_uxn_stack_h_l192_c2_ad06_return_output;
     -- stack_pointer_set[uxn_stack_h_l198_c2_8ed8] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_stack_index;
     stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value <= VAR_stack_pointer_set_uxn_stack_h_l198_c2_8ed8_value;
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
