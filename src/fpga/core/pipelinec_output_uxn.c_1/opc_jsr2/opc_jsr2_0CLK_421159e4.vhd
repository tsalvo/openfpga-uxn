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
-- Submodules: 12
entity opc_jsr2_0CLK_421159e4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsr2_0CLK_421159e4;
architecture arch of opc_jsr2_0CLK_421159e4 is
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
-- t2_register[uxn_opcodes_h_l466_c8_70c6]
signal t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_70c6_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l467_c9_df5a]
signal set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_df5a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l468_c6_9ce9]
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_9b5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l468_c2_f42a]
signal result_MUX_uxn_opcodes_h_l468_c2_f42a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l468_c2_f42a]
signal tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output : unsigned(7 downto 0);

-- pc_get[uxn_opcodes_h_l470_c30_4682]
signal pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l470_c30_4682_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l470_c10_70b3]
signal push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_70b3_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_70b3_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l471_c7_6c9b]
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_6f50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l471_c3_7d51]
signal result_MUX_uxn_opcodes_h_l471_c3_7d51_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l473_c4_21ef]
signal pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l473_c4_21ef_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l466_c8_70c6
t2_register_uxn_opcodes_h_l466_c8_70c6 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index,
t2_register_uxn_opcodes_h_l466_c8_70c6_return_output);

-- set_uxn_opcodes_h_l467_c9_df5a
set_uxn_opcodes_h_l467_c9_df5a : entity work.set_0CLK_28f5e9bb port map (
clk,
set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE,
set_uxn_opcodes_h_l467_c9_df5a_stack_index,
set_uxn_opcodes_h_l467_c9_df5a_ins,
set_uxn_opcodes_h_l467_c9_df5a_k,
set_uxn_opcodes_h_l467_c9_df5a_mul,
set_uxn_opcodes_h_l467_c9_df5a_add,
set_uxn_opcodes_h_l467_c9_df5a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9
BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left,
BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right,
BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output);

-- result_MUX_uxn_opcodes_h_l468_c2_f42a
result_MUX_uxn_opcodes_h_l468_c2_f42a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l468_c2_f42a_cond,
result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue,
result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse,
result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l468_c2_f42a
tmp8_MUX_uxn_opcodes_h_l468_c2_f42a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond,
tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue,
tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse,
tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output);

-- pc_get_uxn_opcodes_h_l470_c30_4682
pc_get_uxn_opcodes_h_l470_c30_4682 : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l470_c30_4682_return_output);

-- push2_stack_uxn_opcodes_h_l470_c10_70b3
push2_stack_uxn_opcodes_h_l470_c10_70b3 : entity work.push2_stack_0CLK_415a9aa2 port map (
clk,
push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index,
push2_stack_uxn_opcodes_h_l470_c10_70b3_ins,
push2_stack_uxn_opcodes_h_l470_c10_70b3_value,
push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b
BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left,
BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right,
BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output);

-- result_MUX_uxn_opcodes_h_l471_c3_7d51
result_MUX_uxn_opcodes_h_l471_c3_7d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l471_c3_7d51_cond,
result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue,
result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse,
result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output);

-- pc_set_uxn_opcodes_h_l473_c4_21ef
pc_set_uxn_opcodes_h_l473_c4_21ef : entity work.pc_set_0CLK_b45f1687 port map (
clk,
pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l473_c4_21ef_value);



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
 t2_register_uxn_opcodes_h_l466_c8_70c6_return_output,
 set_uxn_opcodes_h_l467_c9_df5a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output,
 result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output,
 tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output,
 pc_get_uxn_opcodes_h_l470_c30_4682_return_output,
 push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output,
 result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_df5a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_value : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_4682_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l467_c9_df5a_add := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l467_c9_df5a_mul := resize(to_unsigned(2, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_df5a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_df5a_k := VAR_k;
     VAR_set_uxn_opcodes_h_l467_c9_df5a_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l467_c9_df5a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l467_c9_df5a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l467_c9_df5a_stack_index <= VAR_set_uxn_opcodes_h_l467_c9_df5a_stack_index;
     set_uxn_opcodes_h_l467_c9_df5a_ins <= VAR_set_uxn_opcodes_h_l467_c9_df5a_ins;
     set_uxn_opcodes_h_l467_c9_df5a_k <= VAR_set_uxn_opcodes_h_l467_c9_df5a_k;
     set_uxn_opcodes_h_l467_c9_df5a_mul <= VAR_set_uxn_opcodes_h_l467_c9_df5a_mul;
     set_uxn_opcodes_h_l467_c9_df5a_add <= VAR_set_uxn_opcodes_h_l467_c9_df5a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l467_c9_df5a_return_output := set_uxn_opcodes_h_l467_c9_df5a_return_output;

     -- t2_register[uxn_opcodes_h_l466_c8_70c6] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index <= VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_return_output := t2_register_uxn_opcodes_h_l466_c8_70c6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left := VAR_set_uxn_opcodes_h_l467_c9_df5a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue := VAR_set_uxn_opcodes_h_l467_c9_df5a_return_output;
     VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_value := VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l466_c8_70c6_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l468_c6_9ce9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_left;
     BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output := BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_9ce9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_9b5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output;
     VAR_pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_9b5b_return_output;
     -- pc_get[uxn_opcodes_h_l470_c30_4682] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l470_c30_4682_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l470_c30_4682_return_output := pc_get_uxn_opcodes_h_l470_c30_4682_return_output;

     -- Submodule level 4
     VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_value := VAR_pc_get_uxn_opcodes_h_l470_c30_4682_return_output;
     -- push2_stack[uxn_opcodes_h_l470_c10_70b3] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index <= VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_stack_index;
     push2_stack_uxn_opcodes_h_l470_c10_70b3_ins <= VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_ins;
     push2_stack_uxn_opcodes_h_l470_c10_70b3_value <= VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output := push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left := VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse := VAR_push2_stack_uxn_opcodes_h_l470_c10_70b3_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l468_c2_f42a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_cond;
     tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output := tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l471_c7_6c9b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_left;
     BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output := BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_6c9b_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_f42a_return_output;
     -- result_MUX[uxn_opcodes_h_l471_c3_7d51] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l471_c3_7d51_cond <= VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_cond;
     result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue <= VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iftrue;
     result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse <= VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output := result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_6f50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output;

     -- Submodule level 7
     VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_6f50_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse := VAR_result_MUX_uxn_opcodes_h_l471_c3_7d51_return_output;
     -- pc_set[uxn_opcodes_h_l473_c4_21ef] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l473_c4_21ef_value <= VAR_pc_set_uxn_opcodes_h_l473_c4_21ef_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_h_l468_c2_f42a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l468_c2_f42a_cond <= VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_cond;
     result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue <= VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iftrue;
     result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse <= VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output := result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l468_c2_f42a_return_output;
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
