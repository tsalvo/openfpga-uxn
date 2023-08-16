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
entity opc_jsr2_0CLK_2f531d50 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsr2_0CLK_2f531d50;
architecture arch of opc_jsr2_0CLK_2f531d50 is
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
-- t2_register[uxn_opcodes_h_l466_c8_d985]
signal t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_d985_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_h_l466_c8_d985_return_output : unsigned(15 downto 0);

-- set[uxn_opcodes_h_l467_c9_af8c]
signal set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l467_c9_af8c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l468_c6_cfb9]
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_0f16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l468_c2_cc4d]
signal tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l468_c2_cc4d]
signal result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l470_c30_2c8a]
signal pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l470_c10_cb2d]
signal push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_cb2d_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l471_c7_0e7b]
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_4805]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l471_c3_23e1]
signal result_MUX_uxn_opcodes_h_l471_c3_23e1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output : unsigned(0 downto 0);

-- pc_set[uxn_opcodes_h_l473_c4_9160]
signal pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_h_l473_c4_9160_value : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- t2_register_uxn_opcodes_h_l466_c8_d985
t2_register_uxn_opcodes_h_l466_c8_d985 : entity work.t2_register_0CLK_d6ba51db port map (
clk,
t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE,
t2_register_uxn_opcodes_h_l466_c8_d985_stack_index,
t2_register_uxn_opcodes_h_l466_c8_d985_return_output);

-- set_uxn_opcodes_h_l467_c9_af8c
set_uxn_opcodes_h_l467_c9_af8c : entity work.set_0CLK_5678f3b8 port map (
clk,
set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE,
set_uxn_opcodes_h_l467_c9_af8c_stack_index,
set_uxn_opcodes_h_l467_c9_af8c_ins,
set_uxn_opcodes_h_l467_c9_af8c_k,
set_uxn_opcodes_h_l467_c9_af8c_mul,
set_uxn_opcodes_h_l467_c9_af8c_add,
set_uxn_opcodes_h_l467_c9_af8c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9
BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left,
BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right,
BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output);

-- tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d
tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond,
tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue,
tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse,
tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output);

-- result_MUX_uxn_opcodes_h_l468_c2_cc4d
result_MUX_uxn_opcodes_h_l468_c2_cc4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond,
result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue,
result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse,
result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output);

-- pc_get_uxn_opcodes_h_l470_c30_2c8a
pc_get_uxn_opcodes_h_l470_c30_2c8a : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output);

-- push2_stack_uxn_opcodes_h_l470_c10_cb2d
push2_stack_uxn_opcodes_h_l470_c10_cb2d : entity work.push2_stack_0CLK_20337205 port map (
clk,
push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index,
push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins,
push2_stack_uxn_opcodes_h_l470_c10_cb2d_value,
push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b
BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left,
BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right,
BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output);

-- result_MUX_uxn_opcodes_h_l471_c3_23e1
result_MUX_uxn_opcodes_h_l471_c3_23e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l471_c3_23e1_cond,
result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue,
result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse,
result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output);

-- pc_set_uxn_opcodes_h_l473_c4_9160
pc_set_uxn_opcodes_h_l473_c4_9160 : entity work.pc_set_0CLK_b45f1687 port map (
clk,
pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE,
pc_set_uxn_opcodes_h_l473_c4_9160_value);



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
 t2_register_uxn_opcodes_h_l466_c8_d985_return_output,
 set_uxn_opcodes_h_l467_c9_af8c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output,
 tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output,
 result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output,
 pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output,
 push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output,
 result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_d985_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_h_l466_c8_d985_return_output : unsigned(15 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l467_c9_af8c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_value : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_cond : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_9160_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right := to_unsigned(0, 1);
     VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l467_c9_af8c_mul := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_h_l467_c9_af8c_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_af8c_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l467_c9_af8c_k := VAR_k;
     VAR_set_uxn_opcodes_h_l467_c9_af8c_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_h_l466_c8_d985_stack_index := VAR_stack_index;
     -- t2_register[uxn_opcodes_h_l466_c8_d985] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_h_l466_c8_d985_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_h_l466_c8_d985_stack_index <= VAR_t2_register_uxn_opcodes_h_l466_c8_d985_stack_index;
     -- Outputs
     VAR_t2_register_uxn_opcodes_h_l466_c8_d985_return_output := t2_register_uxn_opcodes_h_l466_c8_d985_return_output;

     -- set[uxn_opcodes_h_l467_c9_af8c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l467_c9_af8c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l467_c9_af8c_stack_index <= VAR_set_uxn_opcodes_h_l467_c9_af8c_stack_index;
     set_uxn_opcodes_h_l467_c9_af8c_ins <= VAR_set_uxn_opcodes_h_l467_c9_af8c_ins;
     set_uxn_opcodes_h_l467_c9_af8c_k <= VAR_set_uxn_opcodes_h_l467_c9_af8c_k;
     set_uxn_opcodes_h_l467_c9_af8c_mul <= VAR_set_uxn_opcodes_h_l467_c9_af8c_mul;
     set_uxn_opcodes_h_l467_c9_af8c_add <= VAR_set_uxn_opcodes_h_l467_c9_af8c_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l467_c9_af8c_return_output := set_uxn_opcodes_h_l467_c9_af8c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left := VAR_set_uxn_opcodes_h_l467_c9_af8c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue := VAR_set_uxn_opcodes_h_l467_c9_af8c_return_output;
     VAR_pc_set_uxn_opcodes_h_l473_c4_9160_value := VAR_t2_register_uxn_opcodes_h_l466_c8_d985_return_output;
     REG_VAR_t16 := VAR_t2_register_uxn_opcodes_h_l466_c8_d985_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l468_c6_cfb9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_left;
     BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output := BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l468_c6_cfb9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l469_c1_0f16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output;
     VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output;
     VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l469_c1_0f16_return_output;
     -- pc_get[uxn_opcodes_h_l470_c30_2c8a] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output := pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output;

     -- Submodule level 4
     VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_value := VAR_pc_get_uxn_opcodes_h_l470_c30_2c8a_return_output;
     -- push2_stack[uxn_opcodes_h_l470_c10_cb2d] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index <= VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_stack_index;
     push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins <= VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_ins;
     push2_stack_uxn_opcodes_h_l470_c10_cb2d_value <= VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output := push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left := VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse := VAR_push2_stack_uxn_opcodes_h_l470_c10_cb2d_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l468_c2_cc4d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_cond;
     tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output := tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l471_c7_0e7b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_left;
     BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output := BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output;
     VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l471_c7_0e7b_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output;
     -- result_MUX[uxn_opcodes_h_l471_c3_23e1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l471_c3_23e1_cond <= VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_cond;
     result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue <= VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iftrue;
     result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse <= VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output := result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l472_c1_4805] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output;

     -- Submodule level 7
     VAR_pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l472_c1_4805_return_output;
     VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse := VAR_result_MUX_uxn_opcodes_h_l471_c3_23e1_return_output;
     -- pc_set[uxn_opcodes_h_l473_c4_9160] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_h_l473_c4_9160_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_h_l473_c4_9160_value <= VAR_pc_set_uxn_opcodes_h_l473_c4_9160_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_h_l468_c2_cc4d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond <= VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_cond;
     result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue <= VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iftrue;
     result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse <= VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output := result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l468_c2_cc4d_return_output;
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
