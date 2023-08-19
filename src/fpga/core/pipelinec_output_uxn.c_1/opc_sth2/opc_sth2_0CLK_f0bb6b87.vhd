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
entity opc_sth2_0CLK_f0bb6b87 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth2_0CLK_f0bb6b87;
architecture arch of opc_sth2_0CLK_f0bb6b87 is
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
-- t2_register[uxn_opcodes_h_l498_c8_4251]
signal t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l498_c8_4251_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l498_c8_4251_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l499_c9_c6b1]
signal set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l499_c9_c6b1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l500_c6_ccbb]
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l501_c1_27b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l500_c2_9f3a]
signal tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l500_c2_9f3a]
signal result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l502_c22_62d2]
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l502_c22_114c]
signal MUX_uxn_opcodes_h_l502_c22_114c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_114c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_114c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l502_c22_114c_return_output : unsigned(0 downto 0);

-- push2_stack[uxn_opcodes_h_l502_c10_ca22]
signal push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_ca22_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_ca22_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l503_c7_eb29]
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l503_c3_123a]
signal result_MUX_uxn_opcodes_h_l503_c3_123a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l503_c3_123a_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l498_c8_4251
t2_register_uxn_opcodes_h_l498_c8_4251 : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l498_c8_4251_stack_index,
t2_register_uxn_opcodes_h_l498_c8_4251_return_output);

-- set_uxn_opcodes_h_l499_c9_c6b1
set_uxn_opcodes_h_l499_c9_c6b1 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE,
set_uxn_opcodes_h_l499_c9_c6b1_stack_index,
set_uxn_opcodes_h_l499_c9_c6b1_ins,
set_uxn_opcodes_h_l499_c9_c6b1_k,
set_uxn_opcodes_h_l499_c9_c6b1_mul,
set_uxn_opcodes_h_l499_c9_c6b1_add,
set_uxn_opcodes_h_l499_c9_c6b1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb
BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left,
BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right,
BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a
tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond,
tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue,
tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse,
tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output);

-- result_MUX_uxn_opcodes_h_l500_c2_9f3a
result_MUX_uxn_opcodes_h_l500_c2_9f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond,
result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue,
result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse,
result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2
BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left,
BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right,
BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output);

-- MUX_uxn_opcodes_h_l502_c22_114c
MUX_uxn_opcodes_h_l502_c22_114c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l502_c22_114c_cond,
MUX_uxn_opcodes_h_l502_c22_114c_iftrue,
MUX_uxn_opcodes_h_l502_c22_114c_iffalse,
MUX_uxn_opcodes_h_l502_c22_114c_return_output);

-- push2_stack_uxn_opcodes_h_l502_c10_ca22
push2_stack_uxn_opcodes_h_l502_c10_ca22 : entity work.push2_stack_0CLK_e79cfe61 port map (
clk,
push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index,
push2_stack_uxn_opcodes_h_l502_c10_ca22_ins,
push2_stack_uxn_opcodes_h_l502_c10_ca22_value,
push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29
BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left,
BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right,
BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output);

-- result_MUX_uxn_opcodes_h_l503_c3_123a
result_MUX_uxn_opcodes_h_l503_c3_123a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l503_c3_123a_cond,
result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue,
result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse,
result_MUX_uxn_opcodes_h_l503_c3_123a_return_output);



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
 t2_register_uxn_opcodes_h_l498_c8_4251_return_output,
 set_uxn_opcodes_h_l499_c9_c6b1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output,
 tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output,
 result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output,
 MUX_uxn_opcodes_h_l502_c22_114c_return_output,
 push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output,
 BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output,
 result_MUX_uxn_opcodes_h_l503_c3_123a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_4251_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l498_c8_4251_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l499_c9_c6b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_value : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_114c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_114c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_114c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l502_c22_114c_return_output : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_cond : unsigned(0 downto 0);
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
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right := to_unsigned(64, 7);
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_mul := resize(to_unsigned(2, 2), 8);
     VAR_MUX_uxn_opcodes_h_l502_c22_114c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l502_c22_114c_iffalse := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_add := resize(to_signed(-2, 3), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left := VAR_ins;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_k := VAR_k;
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l498_c8_4251_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_opcodes_h_l502_c22_62d2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_left;
     BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output := BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output;

     -- set[uxn_opcodes_h_l499_c9_c6b1] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l499_c9_c6b1_stack_index <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_stack_index;
     set_uxn_opcodes_h_l499_c9_c6b1_ins <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_ins;
     set_uxn_opcodes_h_l499_c9_c6b1_k <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_k;
     set_uxn_opcodes_h_l499_c9_c6b1_mul <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_mul;
     set_uxn_opcodes_h_l499_c9_c6b1_add <= VAR_set_uxn_opcodes_h_l499_c9_c6b1_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l499_c9_c6b1_return_output := set_uxn_opcodes_h_l499_c9_c6b1_return_output;

     -- t2_register[uxn_opcodes_h_l498_c8_4251] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l498_c8_4251_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l498_c8_4251_stack_index <= VAR_t2_register_uxn_opcodes_h_l498_c8_4251_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l498_c8_4251_return_output := t2_register_uxn_opcodes_h_l498_c8_4251_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l502_c22_114c_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l502_c22_62d2_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left := VAR_set_uxn_opcodes_h_l499_c9_c6b1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue := VAR_set_uxn_opcodes_h_l499_c9_c6b1_return_output;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_value := VAR_t2_register_uxn_opcodes_h_l498_c8_4251_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l498_c8_4251_return_output;
     -- MUX[uxn_opcodes_h_l502_c22_114c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l502_c22_114c_cond <= VAR_MUX_uxn_opcodes_h_l502_c22_114c_cond;
     MUX_uxn_opcodes_h_l502_c22_114c_iftrue <= VAR_MUX_uxn_opcodes_h_l502_c22_114c_iftrue;
     MUX_uxn_opcodes_h_l502_c22_114c_iffalse <= VAR_MUX_uxn_opcodes_h_l502_c22_114c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l502_c22_114c_return_output := MUX_uxn_opcodes_h_l502_c22_114c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l500_c6_ccbb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_left;
     BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output := BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output;
     VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l500_c6_ccbb_return_output;
     VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index := VAR_MUX_uxn_opcodes_h_l502_c22_114c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l501_c1_27b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output;

     -- Submodule level 3
     VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l501_c1_27b6_return_output;
     -- push2_stack[uxn_opcodes_h_l502_c10_ca22] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index <= VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_stack_index;
     push2_stack_uxn_opcodes_h_l502_c10_ca22_ins <= VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_ins;
     push2_stack_uxn_opcodes_h_l502_c10_ca22_value <= VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output := push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left := VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse := VAR_push2_stack_uxn_opcodes_h_l502_c10_ca22_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l503_c7_eb29] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_left;
     BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output := BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l500_c2_9f3a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_cond;
     tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output := tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l503_c7_eb29_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output;
     -- result_MUX[uxn_opcodes_h_l503_c3_123a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l503_c3_123a_cond <= VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_cond;
     result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iftrue;
     result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_return_output := result_MUX_uxn_opcodes_h_l503_c3_123a_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse := VAR_result_MUX_uxn_opcodes_h_l503_c3_123a_return_output;
     -- result_MUX[uxn_opcodes_h_l500_c2_9f3a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond <= VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_cond;
     result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iftrue;
     result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output := result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l500_c2_9f3a_return_output;
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
