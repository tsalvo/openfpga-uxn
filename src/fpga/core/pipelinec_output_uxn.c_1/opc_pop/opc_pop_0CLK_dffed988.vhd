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
entity opc_pop_0CLK_dffed988 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_pop_0CLK_dffed988;
architecture arch of opc_pop_0CLK_dffed988 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- set[uxn_opcodes_h_l109_c9_0227]
signal set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l109_c9_0227_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l110_c6_7997]
signal BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l110_c2_38c7]
signal result_MUX_uxn_opcodes_h_l110_c2_38c7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- set_uxn_opcodes_h_l109_c9_0227
set_uxn_opcodes_h_l109_c9_0227 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE,
set_uxn_opcodes_h_l109_c9_0227_stack_index,
set_uxn_opcodes_h_l109_c9_0227_ins,
set_uxn_opcodes_h_l109_c9_0227_k,
set_uxn_opcodes_h_l109_c9_0227_mul,
set_uxn_opcodes_h_l109_c9_0227_add,
set_uxn_opcodes_h_l109_c9_0227_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l110_c6_7997
BIN_OP_GT_uxn_opcodes_h_l110_c6_7997 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left,
BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right,
BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output);

-- result_MUX_uxn_opcodes_h_l110_c2_38c7
result_MUX_uxn_opcodes_h_l110_c2_38c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l110_c2_38c7_cond,
result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue,
result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse,
result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 tmp8,
 result,
 -- All submodule outputs
 set_uxn_opcodes_h_l109_c9_0227_return_output,
 BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output,
 result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l109_c9_0227_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l109_c9_0227_mul := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l109_c9_0227_add := resize(to_signed(-1, 2), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l109_c9_0227_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l109_c9_0227_k := VAR_k;
     VAR_set_uxn_opcodes_h_l109_c9_0227_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l109_c9_0227] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l109_c9_0227_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l109_c9_0227_stack_index <= VAR_set_uxn_opcodes_h_l109_c9_0227_stack_index;
     set_uxn_opcodes_h_l109_c9_0227_ins <= VAR_set_uxn_opcodes_h_l109_c9_0227_ins;
     set_uxn_opcodes_h_l109_c9_0227_k <= VAR_set_uxn_opcodes_h_l109_c9_0227_k;
     set_uxn_opcodes_h_l109_c9_0227_mul <= VAR_set_uxn_opcodes_h_l109_c9_0227_mul;
     set_uxn_opcodes_h_l109_c9_0227_add <= VAR_set_uxn_opcodes_h_l109_c9_0227_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l109_c9_0227_return_output := set_uxn_opcodes_h_l109_c9_0227_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left := VAR_set_uxn_opcodes_h_l109_c9_0227_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l109_c9_0227_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l110_c6_7997] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_left;
     BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output := BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l110_c6_7997_return_output;
     -- result_MUX[uxn_opcodes_h_l110_c2_38c7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l110_c2_38c7_cond <= VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_cond;
     result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iftrue;
     result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output := result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output;

     -- Submodule level 3
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l110_c2_38c7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
