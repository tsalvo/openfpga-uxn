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
entity set_0CLK_6f2c5aad is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0));
end set_0CLK_6f2c5aad;
architecture arch of set_0CLK_6f2c5aad is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal set_tmp : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_set_tmp : unsigned(7 downto 0);

-- Each function instance gets signals
-- BIN_OP_AND[uxn_stack_h_l358_c13_bacb]
signal BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l358_c13_38b1]
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l358_c13_76b5]
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output : signed(10 downto 0);

-- stack_pointer_set[uxn_stack_h_l359_c2_a787]
signal stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l359_c2_a787_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_stack_h_l358_c13_bacb
BIN_OP_AND_uxn_stack_h_l358_c13_bacb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left,
BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right,
BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1
BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left,
BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right,
BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5
BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left,
BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right,
BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output);

-- stack_pointer_set_uxn_stack_h_l359_c2_a787
stack_pointer_set_uxn_stack_h_l359_c2_a787 : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index,
stack_pointer_set_uxn_stack_h_l359_c2_a787_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 sp,
 stack_index,
 ins,
 k,
 mul,
 add,
 -- Registers
 result,
 set_tmp,
 -- All submodule outputs
 BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output,
 BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output,
 BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l358_c2_c418 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output : signed(10 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_set_tmp : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_set_tmp := set_tmp;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;
     VAR_mul := mul;
     VAR_add := add;

     -- Submodule level 0
     VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right := VAR_add;
     VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left := VAR_mul;
     REG_VAR_result := result;
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right := signed(std_logic_vector(resize(VAR_sp, 9)));
     VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l358_c13_bacb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left <= VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_left;
     BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right <= VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output := BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l358_c13_bacb_return_output, 9)));
     -- BIN_OP_PLUS[uxn_stack_h_l358_c13_38b1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_left;
     BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output := BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left := VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_38b1_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l358_c13_76b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_left;
     BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output := BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l358_c2_c418 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l358_c13_76b5_return_output)),8);
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l358_c2_c418;
     VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_value := VAR_set_tmp_uxn_stack_h_l358_c2_c418;
     -- stack_pointer_set[uxn_stack_h_l359_c2_a787] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_stack_index;
     stack_pointer_set_uxn_stack_h_l359_c2_a787_value <= VAR_stack_pointer_set_uxn_stack_h_l359_c2_a787_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_set_tmp <= REG_VAR_set_tmp;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     set_tmp <= REG_COMB_set_tmp;
 end if;
 end if;
end process;

end arch;
