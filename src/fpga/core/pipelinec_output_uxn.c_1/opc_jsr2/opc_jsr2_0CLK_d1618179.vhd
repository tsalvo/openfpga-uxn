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
entity opc_jsr2_0CLK_d1618179 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsr2_0CLK_d1618179;
architecture arch of opc_jsr2_0CLK_d1618179 is
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
-- t2_register[uxn_opcodes_h_l466_c8_e2cf]
signal t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l467_c9_b6a4]
signal set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_b6a4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l468_c6_4722]
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_074b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l468_c2_fba3]
signal tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l468_c2_fba3]
signal result_MUX_uxn_opcodes_h_l468_c2_fba3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l470_c30_5077]
signal pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l470_c30_5077_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l470_c10_4246]
signal push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_4246_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_4246_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_4246_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l471_c7_0177]
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_54b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l471_c3_ea41]
signal result_MUX_uxn_opcodes_h_l471_c3_ea41_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l473_c4_a354]
signal pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l473_c4_a354_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l466_c8_e2cf
t2_register_uxn_opcodes_h_l466_c8_e2cf : entity work.t2_register_0CLK_efc3e079 port map (
clk,
t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index,
t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output);

-- set_uxn_opcodes_h_l467_c9_b6a4
set_uxn_opcodes_h_l467_c9_b6a4 : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE,
set_uxn_opcodes_h_l467_c9_b6a4_stack_index,
set_uxn_opcodes_h_l467_c9_b6a4_ins,
set_uxn_opcodes_h_l467_c9_b6a4_k,
set_uxn_opcodes_h_l467_c9_b6a4_mul,
set_uxn_opcodes_h_l467_c9_b6a4_add,
set_uxn_opcodes_h_l467_c9_b6a4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l468_c6_4722
BIN_OP_GT_uxn_opcodes_h_l468_c6_4722 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left,
BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right,
BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l468_c2_fba3
tmp8_MUX_uxn_opcodes_h_l468_c2_fba3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond,
tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue,
tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse,
tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output);

-- result_MUX_uxn_opcodes_h_l468_c2_fba3
result_MUX_uxn_opcodes_h_l468_c2_fba3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l468_c2_fba3_cond,
result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue,
result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse,
result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output);

-- pc_get_uxn_opcodes_h_l470_c30_5077
pc_get_uxn_opcodes_h_l470_c30_5077 : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l470_c30_5077_return_output);

-- push2_stack_uxn_opcodes_h_l470_c10_4246
push2_stack_uxn_opcodes_h_l470_c10_4246 : entity work.push2_stack_0CLK_e79cfe61 port map (
clk,
push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index,
push2_stack_uxn_opcodes_h_l470_c10_4246_ins,
push2_stack_uxn_opcodes_h_l470_c10_4246_value,
push2_stack_uxn_opcodes_h_l470_c10_4246_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l471_c7_0177
BIN_OP_GT_uxn_opcodes_h_l471_c7_0177 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left,
BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right,
BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output);

-- result_MUX_uxn_opcodes_h_l471_c3_ea41
result_MUX_uxn_opcodes_h_l471_c3_ea41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l471_c3_ea41_cond,
result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue,
result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse,
result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output);

-- pc_set_uxn_opcodes_h_l473_c4_a354
pc_set_uxn_opcodes_h_l473_c4_a354 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l473_c4_a354_value);



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
 t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output,
 set_uxn_opcodes_h_l467_c9_b6a4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output,
 tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output,
 result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output,
 pc_get_uxn_opcodes_h_l470_c30_5077_return_output,
 push2_stack_uxn_opcodes_h_l470_c10_4246_return_output,
 BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output,
 result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_b6a4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_value : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_5077_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_a354_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_add := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue := to_unsigned(0, 1);
     VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_k := VAR_k;
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l466_c8_e2cf] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index <= VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output := t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output;

     -- set[uxn_opcodes_h_l467_c9_b6a4] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l467_c9_b6a4_stack_index <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_stack_index;
     set_uxn_opcodes_h_l467_c9_b6a4_ins <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_ins;
     set_uxn_opcodes_h_l467_c9_b6a4_k <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_k;
     set_uxn_opcodes_h_l467_c9_b6a4_mul <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_mul;
     set_uxn_opcodes_h_l467_c9_b6a4_add <= VAR_set_uxn_opcodes_h_l467_c9_b6a4_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l467_c9_b6a4_return_output := set_uxn_opcodes_h_l467_c9_b6a4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left := VAR_set_uxn_opcodes_h_l467_c9_b6a4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue := VAR_set_uxn_opcodes_h_l467_c9_b6a4_return_output;
     VAR_pc_set_uxn_opcodes_h_l473_c4_a354_value := VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l466_c8_e2cf_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l468_c6_4722] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_left;
     BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output := BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_4722_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_074b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output;
     VAR_pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_074b_return_output;
     -- pc_get[uxn_opcodes_h_l470_c30_5077] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l470_c30_5077_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l470_c30_5077_return_output := pc_get_uxn_opcodes_h_l470_c30_5077_return_output;

     -- Submodule level 4
     VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_value := VAR_pc_get_uxn_opcodes_h_l470_c30_5077_return_output;
     -- push2_stack[uxn_opcodes_h_l470_c10_4246] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index <= VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_stack_index;
     push2_stack_uxn_opcodes_h_l470_c10_4246_ins <= VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_ins;
     push2_stack_uxn_opcodes_h_l470_c10_4246_value <= VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_return_output := push2_stack_uxn_opcodes_h_l470_c10_4246_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left := VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse := VAR_push2_stack_uxn_opcodes_h_l470_c10_4246_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l471_c7_0177] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_left;
     BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output := BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l468_c2_fba3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_cond;
     tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output := tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output;
     VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0177_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_fba3_return_output;
     -- result_MUX[uxn_opcodes_h_l471_c3_ea41] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l471_c3_ea41_cond <= VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_cond;
     result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue <= VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iftrue;
     result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse <= VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output := result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_54b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output;

     -- Submodule level 7
     VAR_pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_54b6_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse := VAR_result_MUX_uxn_opcodes_h_l471_c3_ea41_return_output;
     -- result_MUX[uxn_opcodes_h_l468_c2_fba3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l468_c2_fba3_cond <= VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_cond;
     result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue <= VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iftrue;
     result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse <= VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output := result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output;

     -- pc_set[uxn_opcodes_h_l473_c4_a354] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l473_c4_a354_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l473_c4_a354_value <= VAR_pc_set_uxn_opcodes_h_l473_c4_a354_value;
     -- Outputs

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l468_c2_fba3_return_output;
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
