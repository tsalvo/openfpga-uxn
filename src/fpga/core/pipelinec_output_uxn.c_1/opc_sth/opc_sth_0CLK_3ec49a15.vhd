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
entity opc_sth_0CLK_3ec49a15 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth_0CLK_3ec49a15;
architecture arch of opc_sth_0CLK_3ec49a15 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- t_register[uxn_opcodes_h_l483_c7_3e7b]
signal t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_3e7b_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l484_c9_3427]
signal set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_3427_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c6_e5d0]
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_79cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l485_c2_943d]
signal result_MUX_uxn_opcodes_h_l485_c2_943d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_943d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l485_c2_943d]
signal tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c21_c5a3]
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l487_c21_2b09]
signal MUX_uxn_opcodes_h_l487_c21_2b09_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_2b09_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_2b09_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_2b09_return_output : unsigned(0 downto 0);

-- push_stack[uxn_opcodes_h_l487_c10_335f]
signal push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_335f_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_335f_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_335f_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_335f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l488_c7_c32e]
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l488_c3_adee]
signal result_MUX_uxn_opcodes_h_l488_c3_adee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_adee_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l483_c7_3e7b
t_register_uxn_opcodes_h_l483_c7_3e7b : entity work.t_register_0CLK_9682be37 port map (
clk,
t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index,
t_register_uxn_opcodes_h_l483_c7_3e7b_return_output);

-- set_uxn_opcodes_h_l484_c9_3427
set_uxn_opcodes_h_l484_c9_3427 : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE,
set_uxn_opcodes_h_l484_c9_3427_stack_index,
set_uxn_opcodes_h_l484_c9_3427_ins,
set_uxn_opcodes_h_l484_c9_3427_k,
set_uxn_opcodes_h_l484_c9_3427_mul,
set_uxn_opcodes_h_l484_c9_3427_add,
set_uxn_opcodes_h_l484_c9_3427_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0
BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left,
BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right,
BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output);

-- result_MUX_uxn_opcodes_h_l485_c2_943d
result_MUX_uxn_opcodes_h_l485_c2_943d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l485_c2_943d_cond,
result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue,
result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse,
result_MUX_uxn_opcodes_h_l485_c2_943d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l485_c2_943d
tmp8_MUX_uxn_opcodes_h_l485_c2_943d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond,
tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue,
tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse,
tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3
BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left,
BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right,
BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output);

-- MUX_uxn_opcodes_h_l487_c21_2b09
MUX_uxn_opcodes_h_l487_c21_2b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c21_2b09_cond,
MUX_uxn_opcodes_h_l487_c21_2b09_iftrue,
MUX_uxn_opcodes_h_l487_c21_2b09_iffalse,
MUX_uxn_opcodes_h_l487_c21_2b09_return_output);

-- push_stack_uxn_opcodes_h_l487_c10_335f
push_stack_uxn_opcodes_h_l487_c10_335f : entity work.push_stack_0CLK_81ac7b63 port map (
clk,
push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l487_c10_335f_stack_index,
push_stack_uxn_opcodes_h_l487_c10_335f_ins,
push_stack_uxn_opcodes_h_l487_c10_335f_value,
push_stack_uxn_opcodes_h_l487_c10_335f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e
BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left,
BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right,
BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output);

-- result_MUX_uxn_opcodes_h_l488_c3_adee
result_MUX_uxn_opcodes_h_l488_c3_adee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l488_c3_adee_cond,
result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue,
result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse,
result_MUX_uxn_opcodes_h_l488_c3_adee_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 t_register_uxn_opcodes_h_l483_c7_3e7b_return_output,
 set_uxn_opcodes_h_l484_c9_3427_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output,
 result_MUX_uxn_opcodes_h_l485_c2_943d_return_output,
 tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output,
 MUX_uxn_opcodes_h_l487_c21_2b09_return_output,
 push_stack_uxn_opcodes_h_l487_c10_335f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output,
 result_MUX_uxn_opcodes_h_l488_c3_adee_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_3427_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_335f_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_335f_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_335f_value : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_2b09_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_2b09_return_output : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_335f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iffalse := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l484_c9_3427_mul := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right := to_unsigned(64, 7);
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l484_c9_3427_add := resize(to_signed(-1, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l487_c10_335f_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_3427_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_3427_k := VAR_k;
     VAR_set_uxn_opcodes_h_l484_c9_3427_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l484_c9_3427] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l484_c9_3427_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l484_c9_3427_stack_index <= VAR_set_uxn_opcodes_h_l484_c9_3427_stack_index;
     set_uxn_opcodes_h_l484_c9_3427_ins <= VAR_set_uxn_opcodes_h_l484_c9_3427_ins;
     set_uxn_opcodes_h_l484_c9_3427_k <= VAR_set_uxn_opcodes_h_l484_c9_3427_k;
     set_uxn_opcodes_h_l484_c9_3427_mul <= VAR_set_uxn_opcodes_h_l484_c9_3427_mul;
     set_uxn_opcodes_h_l484_c9_3427_add <= VAR_set_uxn_opcodes_h_l484_c9_3427_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l484_c9_3427_return_output := set_uxn_opcodes_h_l484_c9_3427_return_output;

     -- t_register[uxn_opcodes_h_l483_c7_3e7b] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index <= VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_return_output := t_register_uxn_opcodes_h_l483_c7_3e7b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l487_c21_c5a3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l487_c21_2b09_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_c5a3_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left := VAR_set_uxn_opcodes_h_l484_c9_3427_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue := VAR_set_uxn_opcodes_h_l484_c9_3427_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_335f_value := VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l483_c7_3e7b_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l485_c6_e5d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output;

     -- MUX[uxn_opcodes_h_l487_c21_2b09] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c21_2b09_cond <= VAR_MUX_uxn_opcodes_h_l487_c21_2b09_cond;
     MUX_uxn_opcodes_h_l487_c21_2b09_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iftrue;
     MUX_uxn_opcodes_h_l487_c21_2b09_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c21_2b09_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c21_2b09_return_output := MUX_uxn_opcodes_h_l487_c21_2b09_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_e5d0_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_335f_stack_index := VAR_MUX_uxn_opcodes_h_l487_c21_2b09_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_79cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output;

     -- Submodule level 3
     VAR_push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_79cc_return_output;
     -- push_stack[uxn_opcodes_h_l487_c10_335f] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l487_c10_335f_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l487_c10_335f_stack_index <= VAR_push_stack_uxn_opcodes_h_l487_c10_335f_stack_index;
     push_stack_uxn_opcodes_h_l487_c10_335f_ins <= VAR_push_stack_uxn_opcodes_h_l487_c10_335f_ins;
     push_stack_uxn_opcodes_h_l487_c10_335f_value <= VAR_push_stack_uxn_opcodes_h_l487_c10_335f_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l487_c10_335f_return_output := push_stack_uxn_opcodes_h_l487_c10_335f_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left := VAR_push_stack_uxn_opcodes_h_l487_c10_335f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse := VAR_push_stack_uxn_opcodes_h_l487_c10_335f_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l488_c7_c32e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_left;
     BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output := BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l485_c2_943d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_cond;
     tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output := tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_c32e_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_943d_return_output;
     -- result_MUX[uxn_opcodes_h_l488_c3_adee] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l488_c3_adee_cond <= VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_cond;
     result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue <= VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iftrue;
     result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse <= VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_return_output := result_MUX_uxn_opcodes_h_l488_c3_adee_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse := VAR_result_MUX_uxn_opcodes_h_l488_c3_adee_return_output;
     -- result_MUX[uxn_opcodes_h_l485_c2_943d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l485_c2_943d_cond <= VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_cond;
     result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iftrue;
     result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_return_output := result_MUX_uxn_opcodes_h_l485_c2_943d_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l485_c2_943d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
