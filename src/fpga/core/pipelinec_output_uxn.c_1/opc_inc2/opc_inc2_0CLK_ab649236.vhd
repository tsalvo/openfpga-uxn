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
-- Submodules: 7
entity opc_inc2_0CLK_ab649236 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_inc2_0CLK_ab649236;
architecture arch of opc_inc2_0CLK_ab649236 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t2_register[uxn_opcodes_h_l99_c8_f881]
signal t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_f881_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l99_c8_f881_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l100_c9_15aa]
signal set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l100_c9_15aa_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l101_c6_05ef]
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_12ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l101_c2_c6d7]
signal result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_41a4]
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output : unsigned(16 downto 0);

-- put2_stack[uxn_opcodes_h_l102_c9_586e]
signal put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index : unsigned(0 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_586e_offset : unsigned(7 downto 0);
signal put2_stack_uxn_opcodes_h_l102_c9_586e_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l99_c8_f881
t2_register_uxn_opcodes_h_l99_c8_f881 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l99_c8_f881_stack_index,
t2_register_uxn_opcodes_h_l99_c8_f881_return_output);

-- set_uxn_opcodes_h_l100_c9_15aa
set_uxn_opcodes_h_l100_c9_15aa : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE,
set_uxn_opcodes_h_l100_c9_15aa_stack_index,
set_uxn_opcodes_h_l100_c9_15aa_ins,
set_uxn_opcodes_h_l100_c9_15aa_k,
set_uxn_opcodes_h_l100_c9_15aa_mul,
set_uxn_opcodes_h_l100_c9_15aa_add,
set_uxn_opcodes_h_l100_c9_15aa_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef
BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left,
BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right,
BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output);

-- result_MUX_uxn_opcodes_h_l101_c2_c6d7
result_MUX_uxn_opcodes_h_l101_c2_c6d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond,
result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue,
result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse,
result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right,
BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output);

-- put2_stack_uxn_opcodes_h_l102_c9_586e
put2_stack_uxn_opcodes_h_l102_c9_586e : entity work.put2_stack_0CLK_52228af0 port map (
clk,
put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE,
put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index,
put2_stack_uxn_opcodes_h_l102_c9_586e_offset,
put2_stack_uxn_opcodes_h_l102_c9_586e_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 t2_register_uxn_opcodes_h_l99_c8_f881_return_output,
 set_uxn_opcodes_h_l100_c9_15aa_return_output,
 BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output,
 result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_f881_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l99_c8_f881_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l100_c9_15aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index : unsigned(0 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_offset : unsigned(7 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output : unsigned(16 downto 0);
 variable VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l100_c9_15aa_mul := resize(to_unsigned(2, 2), 8);
     VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_offset := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l100_c9_15aa_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l100_c9_15aa_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l100_c9_15aa_k := VAR_k;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_h_l100_c9_15aa_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l99_c8_f881_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l100_c9_15aa] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l100_c9_15aa_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l100_c9_15aa_stack_index <= VAR_set_uxn_opcodes_h_l100_c9_15aa_stack_index;
     set_uxn_opcodes_h_l100_c9_15aa_ins <= VAR_set_uxn_opcodes_h_l100_c9_15aa_ins;
     set_uxn_opcodes_h_l100_c9_15aa_k <= VAR_set_uxn_opcodes_h_l100_c9_15aa_k;
     set_uxn_opcodes_h_l100_c9_15aa_mul <= VAR_set_uxn_opcodes_h_l100_c9_15aa_mul;
     set_uxn_opcodes_h_l100_c9_15aa_add <= VAR_set_uxn_opcodes_h_l100_c9_15aa_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l100_c9_15aa_return_output := set_uxn_opcodes_h_l100_c9_15aa_return_output;

     -- t2_register[uxn_opcodes_h_l99_c8_f881] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l99_c8_f881_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l99_c8_f881_stack_index <= VAR_t2_register_uxn_opcodes_h_l99_c8_f881_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l99_c8_f881_return_output := t2_register_uxn_opcodes_h_l99_c8_f881_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left := VAR_set_uxn_opcodes_h_l100_c9_15aa_return_output;
     REG_VAR_tmp8 := VAR_set_uxn_opcodes_h_l100_c9_15aa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left := VAR_t2_register_uxn_opcodes_h_l99_c8_f881_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l99_c8_f881_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l101_c6_05ef] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_left;
     BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output := BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l102_c36_41a4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output;
     VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l101_c6_05ef_return_output;
     VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l102_c36_41a4_return_output, 16);
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l102_c1_12ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output;

     -- result_MUX[uxn_opcodes_h_l101_c2_c6d7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond <= VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_cond;
     result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue <= VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iftrue;
     result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse <= VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output := result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output;

     -- Submodule level 3
     VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l102_c1_12ca_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l101_c2_c6d7_return_output;
     -- put2_stack[uxn_opcodes_h_l102_c9_586e] LATENCY=0
     -- Clock enable
     put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE <= VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_CLOCK_ENABLE;
     -- Inputs
     put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index <= VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_stack_index;
     put2_stack_uxn_opcodes_h_l102_c9_586e_offset <= VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_offset;
     put2_stack_uxn_opcodes_h_l102_c9_586e_value <= VAR_put2_stack_uxn_opcodes_h_l102_c9_586e_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
