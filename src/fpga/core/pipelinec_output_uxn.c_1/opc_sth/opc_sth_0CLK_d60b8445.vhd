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
entity opc_sth_0CLK_d60b8445 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_sth_0CLK_d60b8445;
architecture arch of opc_sth_0CLK_d60b8445 is
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
-- t_register[uxn_opcodes_h_l483_c7_9c48]
signal t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_9c48_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l483_c7_9c48_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l484_c9_342a]
signal set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l484_c9_342a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l485_c6_ee8e]
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_3e15]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l485_c2_a9b1]
signal result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l485_c2_a9b1]
signal tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l487_c21_3d0e]
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l487_c21_f7f0]
signal MUX_uxn_opcodes_h_l487_c21_f7f0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l487_c21_f7f0_return_output : unsigned(0 downto 0);

-- push_stack[uxn_opcodes_h_l487_c10_a547]
signal push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_a547_stack_index : unsigned(0 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_a547_ins : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_a547_value : unsigned(7 downto 0);
signal push_stack_uxn_opcodes_h_l487_c10_a547_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l488_c7_4d4f]
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l488_c3_55bf]
signal result_MUX_uxn_opcodes_h_l488_c3_55bf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l483_c7_9c48
t_register_uxn_opcodes_h_l483_c7_9c48 : entity work.t_register_0CLK_31d26cd6 port map (
clk,
t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l483_c7_9c48_stack_index,
t_register_uxn_opcodes_h_l483_c7_9c48_return_output);

-- set_uxn_opcodes_h_l484_c9_342a
set_uxn_opcodes_h_l484_c9_342a : entity work.set_0CLK_95f06e5a port map (
clk,
set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE,
set_uxn_opcodes_h_l484_c9_342a_stack_index,
set_uxn_opcodes_h_l484_c9_342a_ins,
set_uxn_opcodes_h_l484_c9_342a_k,
set_uxn_opcodes_h_l484_c9_342a_mul,
set_uxn_opcodes_h_l484_c9_342a_add,
set_uxn_opcodes_h_l484_c9_342a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e
BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left,
BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right,
BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output);

-- result_MUX_uxn_opcodes_h_l485_c2_a9b1
result_MUX_uxn_opcodes_h_l485_c2_a9b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond,
result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue,
result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse,
result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1
tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond,
tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue,
tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse,
tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e
BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left,
BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right,
BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output);

-- MUX_uxn_opcodes_h_l487_c21_f7f0
MUX_uxn_opcodes_h_l487_c21_f7f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l487_c21_f7f0_cond,
MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue,
MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse,
MUX_uxn_opcodes_h_l487_c21_f7f0_return_output);

-- push_stack_uxn_opcodes_h_l487_c10_a547
push_stack_uxn_opcodes_h_l487_c10_a547 : entity work.push_stack_0CLK_01fb3068 port map (
clk,
push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE,
push_stack_uxn_opcodes_h_l487_c10_a547_stack_index,
push_stack_uxn_opcodes_h_l487_c10_a547_ins,
push_stack_uxn_opcodes_h_l487_c10_a547_value,
push_stack_uxn_opcodes_h_l487_c10_a547_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f
BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left,
BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right,
BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output);

-- result_MUX_uxn_opcodes_h_l488_c3_55bf
result_MUX_uxn_opcodes_h_l488_c3_55bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l488_c3_55bf_cond,
result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue,
result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse,
result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output);



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
 t_register_uxn_opcodes_h_l483_c7_9c48_return_output,
 set_uxn_opcodes_h_l484_c9_342a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output,
 result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output,
 tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output,
 MUX_uxn_opcodes_h_l487_c21_f7f0_return_output,
 push_stack_uxn_opcodes_h_l487_c10_a547_return_output,
 BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output,
 result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_9c48_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l483_c7_9c48_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l484_c9_342a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_a547_stack_index : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_a547_ins : unsigned(7 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_a547_value : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_return_output : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push_stack_uxn_opcodes_h_l487_c10_a547_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_cond : unsigned(0 downto 0);
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
     VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l484_c9_342a_mul := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right := to_unsigned(64, 7);
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l484_c9_342a_add := resize(to_signed(-1, 2), 8);
     VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left := VAR_ins;
     VAR_push_stack_uxn_opcodes_h_l487_c10_a547_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_342a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l484_c9_342a_k := VAR_k;
     VAR_set_uxn_opcodes_h_l484_c9_342a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l483_c7_9c48_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_opcodes_h_l487_c21_3d0e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_left;
     BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output := BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output;

     -- t_register[uxn_opcodes_h_l483_c7_9c48] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l483_c7_9c48_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l483_c7_9c48_stack_index <= VAR_t_register_uxn_opcodes_h_l483_c7_9c48_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l483_c7_9c48_return_output := t_register_uxn_opcodes_h_l483_c7_9c48_return_output;

     -- set[uxn_opcodes_h_l484_c9_342a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l484_c9_342a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l484_c9_342a_stack_index <= VAR_set_uxn_opcodes_h_l484_c9_342a_stack_index;
     set_uxn_opcodes_h_l484_c9_342a_ins <= VAR_set_uxn_opcodes_h_l484_c9_342a_ins;
     set_uxn_opcodes_h_l484_c9_342a_k <= VAR_set_uxn_opcodes_h_l484_c9_342a_k;
     set_uxn_opcodes_h_l484_c9_342a_mul <= VAR_set_uxn_opcodes_h_l484_c9_342a_mul;
     set_uxn_opcodes_h_l484_c9_342a_add <= VAR_set_uxn_opcodes_h_l484_c9_342a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l484_c9_342a_return_output := set_uxn_opcodes_h_l484_c9_342a_return_output;

     -- Submodule level 1
     VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_cond := resize(VAR_BIN_OP_AND_uxn_opcodes_h_l487_c21_3d0e_return_output, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left := VAR_set_uxn_opcodes_h_l484_c9_342a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue := VAR_set_uxn_opcodes_h_l484_c9_342a_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_a547_value := VAR_t_register_uxn_opcodes_h_l483_c7_9c48_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l483_c7_9c48_return_output;
     -- MUX[uxn_opcodes_h_l487_c21_f7f0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l487_c21_f7f0_cond <= VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_cond;
     MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue <= VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iftrue;
     MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse <= VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_return_output := MUX_uxn_opcodes_h_l487_c21_f7f0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l485_c6_ee8e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_left;
     BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output := BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output;
     VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l485_c6_ee8e_return_output;
     VAR_push_stack_uxn_opcodes_h_l487_c10_a547_stack_index := VAR_MUX_uxn_opcodes_h_l487_c21_f7f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l486_c1_3e15] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output;

     -- Submodule level 3
     VAR_push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l486_c1_3e15_return_output;
     -- push_stack[uxn_opcodes_h_l487_c10_a547] LATENCY=0
     -- Clock enable
     push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE <= VAR_push_stack_uxn_opcodes_h_l487_c10_a547_CLOCK_ENABLE;
     -- Inputs
     push_stack_uxn_opcodes_h_l487_c10_a547_stack_index <= VAR_push_stack_uxn_opcodes_h_l487_c10_a547_stack_index;
     push_stack_uxn_opcodes_h_l487_c10_a547_ins <= VAR_push_stack_uxn_opcodes_h_l487_c10_a547_ins;
     push_stack_uxn_opcodes_h_l487_c10_a547_value <= VAR_push_stack_uxn_opcodes_h_l487_c10_a547_value;
     -- Outputs
     VAR_push_stack_uxn_opcodes_h_l487_c10_a547_return_output := push_stack_uxn_opcodes_h_l487_c10_a547_return_output;

     -- Submodule level 4
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left := VAR_push_stack_uxn_opcodes_h_l487_c10_a547_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse := VAR_push_stack_uxn_opcodes_h_l487_c10_a547_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l485_c2_a9b1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_cond;
     tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output := tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l488_c7_4d4f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_left;
     BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output := BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l488_c7_4d4f_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output;
     -- result_MUX[uxn_opcodes_h_l488_c3_55bf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l488_c3_55bf_cond <= VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_cond;
     result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue <= VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iftrue;
     result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse <= VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output := result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse := VAR_result_MUX_uxn_opcodes_h_l488_c3_55bf_return_output;
     -- result_MUX[uxn_opcodes_h_l485_c2_a9b1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond <= VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_cond;
     result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iftrue;
     result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output := result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l485_c2_a9b1_return_output;
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
