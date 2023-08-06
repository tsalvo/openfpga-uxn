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
-- Submodules: 11
entity opc_sth2_0CLK_186906f2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth2_0CLK_186906f2;
architecture arch of opc_sth2_0CLK_186906f2 is
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
-- t2_register[uxn_opcodes_h_l498_c8_b51d]
signal t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l498_c8_b51d_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l499_c9_3f6c]
signal set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_3f6c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l500_c6_07de]
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l501_c1_2680]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l500_c2_1400]
signal result_MUX_uxn_opcodes_h_l500_c2_1400_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_1400_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l500_c2_1400]
signal tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l502_c22_8e8c]
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l502_c22_ea78]
signal MUX_uxn_opcodes_h_l502_c22_ea78_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_ea78_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_ea78_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_ea78_return_output : unsigned(0 downto 0);

-- push2_stack[uxn_opcodes_h_l502_c10_8cf6]
signal push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_8cf6_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l503_c7_b927]
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l503_c3_c8d3]
signal result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l498_c8_b51d
t2_register_uxn_opcodes_h_l498_c8_b51d : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index,
t2_register_uxn_opcodes_h_l498_c8_b51d_return_output);

-- set_uxn_opcodes_h_l499_c9_3f6c
set_uxn_opcodes_h_l499_c9_3f6c : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE,
set_uxn_opcodes_h_l499_c9_3f6c_stack_index,
set_uxn_opcodes_h_l499_c9_3f6c_ins,
set_uxn_opcodes_h_l499_c9_3f6c_k,
set_uxn_opcodes_h_l499_c9_3f6c_mul,
set_uxn_opcodes_h_l499_c9_3f6c_add,
set_uxn_opcodes_h_l499_c9_3f6c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l500_c6_07de
BIN_OP_GT_uxn_opcodes_h_l500_c6_07de : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left,
BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right,
BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output);

-- result_MUX_uxn_opcodes_h_l500_c2_1400
result_MUX_uxn_opcodes_h_l500_c2_1400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l500_c2_1400_cond,
result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue,
result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse,
result_MUX_uxn_opcodes_h_l500_c2_1400_return_output);

-- tmp8_MUX_uxn_opcodes_h_l500_c2_1400
tmp8_MUX_uxn_opcodes_h_l500_c2_1400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond,
tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue,
tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse,
tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c
BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left,
BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right,
BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output);

-- MUX_uxn_opcodes_h_l502_c22_ea78
MUX_uxn_opcodes_h_l502_c22_ea78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l502_c22_ea78_cond,
MUX_uxn_opcodes_h_l502_c22_ea78_iftrue,
MUX_uxn_opcodes_h_l502_c22_ea78_iffalse,
MUX_uxn_opcodes_h_l502_c22_ea78_return_output);

-- push2_stack_uxn_opcodes_h_l502_c10_8cf6
push2_stack_uxn_opcodes_h_l502_c10_8cf6 : entity work.push2_stack_0CLK_415a9aa2 port map (
clk,
push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index,
push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins,
push2_stack_uxn_opcodes_h_l502_c10_8cf6_value,
push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l503_c7_b927
BIN_OP_GT_uxn_opcodes_h_l503_c7_b927 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left,
BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right,
BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output);

-- result_MUX_uxn_opcodes_h_l503_c3_c8d3
result_MUX_uxn_opcodes_h_l503_c3_c8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond,
result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue,
result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse,
result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output);



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
 t2_register_uxn_opcodes_h_l498_c8_b51d_return_output,
 set_uxn_opcodes_h_l499_c9_3f6c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output,
 result_MUX_uxn_opcodes_h_l500_c2_1400_return_output,
 tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output,
 BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output,
 MUX_uxn_opcodes_h_l502_c22_ea78_return_output,
 push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output,
 result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_3f6c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_value : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_ea78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_ea78_return_output : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iffalse := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right := to_unsigned(64, 7);
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left := VAR_ins;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_k := VAR_k;
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l498_c8_b51d] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index <= VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_return_output := t2_register_uxn_opcodes_h_l498_c8_b51d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l502_c22_8e8c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_left;
     BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output := BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output;

     -- set[uxn_opcodes_h_l499_c9_3f6c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l499_c9_3f6c_stack_index <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_stack_index;
     set_uxn_opcodes_h_l499_c9_3f6c_ins <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_ins;
     set_uxn_opcodes_h_l499_c9_3f6c_k <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_k;
     set_uxn_opcodes_h_l499_c9_3f6c_mul <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_mul;
     set_uxn_opcodes_h_l499_c9_3f6c_add <= VAR_set_uxn_opcodes_h_l499_c9_3f6c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l499_c9_3f6c_return_output := set_uxn_opcodes_h_l499_c9_3f6c_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l502_c22_ea78_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_8e8c_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left := VAR_set_uxn_opcodes_h_l499_c9_3f6c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue := VAR_set_uxn_opcodes_h_l499_c9_3f6c_return_output;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_value := VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l498_c8_b51d_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l500_c6_07de] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_left;
     BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output := BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output;

     -- MUX[uxn_opcodes_h_l502_c22_ea78] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l502_c22_ea78_cond <= VAR_MUX_uxn_opcodes_h_l502_c22_ea78_cond;
     MUX_uxn_opcodes_h_l502_c22_ea78_iftrue <= VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iftrue;
     MUX_uxn_opcodes_h_l502_c22_ea78_iffalse <= VAR_MUX_uxn_opcodes_h_l502_c22_ea78_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l502_c22_ea78_return_output := MUX_uxn_opcodes_h_l502_c22_ea78_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output;
     VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_07de_return_output;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index := VAR_MUX_uxn_opcodes_h_l502_c22_ea78_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l501_c1_2680] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output;

     -- Submodule level 3
     VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_2680_return_output;
     -- push2_stack[uxn_opcodes_h_l502_c10_8cf6] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index <= VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_stack_index;
     push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins <= VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_ins;
     push2_stack_uxn_opcodes_h_l502_c10_8cf6_value <= VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output := push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left := VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse := VAR_push2_stack_uxn_opcodes_h_l502_c10_8cf6_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l503_c7_b927] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_left;
     BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output := BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l500_c2_1400] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_cond;
     tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iftrue;
     tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output := tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_b927_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_1400_return_output;
     -- result_MUX[uxn_opcodes_h_l503_c3_c8d3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond <= VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_cond;
     result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iftrue;
     result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output := result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse := VAR_result_MUX_uxn_opcodes_h_l503_c3_c8d3_return_output;
     -- result_MUX[uxn_opcodes_h_l500_c2_1400] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l500_c2_1400_cond <= VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_cond;
     result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue <= VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iftrue;
     result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse <= VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_return_output := result_MUX_uxn_opcodes_h_l500_c2_1400_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l500_c2_1400_return_output;
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
