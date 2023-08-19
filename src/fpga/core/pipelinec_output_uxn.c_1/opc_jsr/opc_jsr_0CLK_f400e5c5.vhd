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
-- Submodules: 13
entity opc_jsr_0CLK_f400e5c5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsr_0CLK_f400e5c5;
architecture arch of opc_jsr_0CLK_f400e5c5 is
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
-- t_register[uxn_opcodes_h_l448_c7_424a]
signal t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l448_c7_424a_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_h_l448_c7_424a_return_output : unsigned(7 downto 0);

-- set[uxn_opcodes_h_l449_c9_5b3a]
signal set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_add : signed(7 downto 0);
signal set_uxn_opcodes_h_l449_c9_5b3a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l450_c6_7df0]
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l451_c1_0d8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l450_c2_2701]
signal tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_h_l450_c2_2701]
signal result_MUX_uxn_opcodes_h_l450_c2_2701_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l450_c2_2701_return_output : unsigned(0 downto 0);

-- pc_get[uxn_opcodes_h_l452_c30_242c]
signal pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l452_c30_242c_return_output : unsigned(15 downto 0);

-- push2_stack[uxn_opcodes_h_l452_c10_67c6]
signal push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index : unsigned(0 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_67c6_ins : unsigned(7 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_67c6_value : unsigned(15 downto 0);
signal push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l453_c7_6f04]
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l454_c1_d5e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_h_l453_c3_f68b]
signal result_MUX_uxn_opcodes_h_l453_c3_f68b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output : unsigned(0 downto 0);

-- pc_add_s8[uxn_opcodes_h_l455_c4_ec76]
signal pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment : signed(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- t_register_uxn_opcodes_h_l448_c7_424a
t_register_uxn_opcodes_h_l448_c7_424a : entity work.t_register_0CLK_0e5af5c0 port map (
clk,
t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE,
t_register_uxn_opcodes_h_l448_c7_424a_stack_index,
t_register_uxn_opcodes_h_l448_c7_424a_return_output);

-- set_uxn_opcodes_h_l449_c9_5b3a
set_uxn_opcodes_h_l449_c9_5b3a : entity work.set_0CLK_e105ce74 port map (
clk,
set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE,
set_uxn_opcodes_h_l449_c9_5b3a_stack_index,
set_uxn_opcodes_h_l449_c9_5b3a_ins,
set_uxn_opcodes_h_l449_c9_5b3a_k,
set_uxn_opcodes_h_l449_c9_5b3a_mul,
set_uxn_opcodes_h_l449_c9_5b3a_add,
set_uxn_opcodes_h_l449_c9_5b3a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0
BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left,
BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right,
BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l450_c2_2701
tmp8_MUX_uxn_opcodes_h_l450_c2_2701 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond,
tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue,
tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse,
tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output);

-- result_MUX_uxn_opcodes_h_l450_c2_2701
result_MUX_uxn_opcodes_h_l450_c2_2701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l450_c2_2701_cond,
result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue,
result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse,
result_MUX_uxn_opcodes_h_l450_c2_2701_return_output);

-- pc_get_uxn_opcodes_h_l452_c30_242c
pc_get_uxn_opcodes_h_l452_c30_242c : entity work.pc_get_0CLK_9859a581 port map (
clk,
pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l452_c30_242c_return_output);

-- push2_stack_uxn_opcodes_h_l452_c10_67c6
push2_stack_uxn_opcodes_h_l452_c10_67c6 : entity work.push2_stack_0CLK_e79cfe61 port map (
clk,
push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE,
push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index,
push2_stack_uxn_opcodes_h_l452_c10_67c6_ins,
push2_stack_uxn_opcodes_h_l452_c10_67c6_value,
push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04
BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left,
BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right,
BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output);

-- result_MUX_uxn_opcodes_h_l453_c3_f68b
result_MUX_uxn_opcodes_h_l453_c3_f68b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_h_l453_c3_f68b_cond,
result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue,
result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse,
result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output);

-- pc_add_s8_uxn_opcodes_h_l455_c4_ec76
pc_add_s8_uxn_opcodes_h_l455_c4_ec76 : entity work.pc_add_s8_0CLK_925e4dd0 port map (
clk,
pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment);



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
 t_register_uxn_opcodes_h_l448_c7_424a_return_output,
 set_uxn_opcodes_h_l449_c9_5b3a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output,
 tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output,
 result_MUX_uxn_opcodes_h_l450_c2_2701_return_output,
 pc_get_uxn_opcodes_h_l452_c30_242c_return_output,
 push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output,
 result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_424a_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_h_l448_c7_424a_return_output : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_h_l449_c9_5b3a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_cond : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_ins : unsigned(7 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_value : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l452_c30_242c_return_output : unsigned(15 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_cond : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_4883_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_mul := resize(to_unsigned(1, 1), 8);
     VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue := to_unsigned(0, 1);
     VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_add := resize(to_signed(-1, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_ins := VAR_ins;
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_k := VAR_k;
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_h_l448_c7_424a_stack_index := VAR_stack_index;
     -- set[uxn_opcodes_h_l449_c9_5b3a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_h_l449_c9_5b3a_stack_index <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_stack_index;
     set_uxn_opcodes_h_l449_c9_5b3a_ins <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_ins;
     set_uxn_opcodes_h_l449_c9_5b3a_k <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_k;
     set_uxn_opcodes_h_l449_c9_5b3a_mul <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_mul;
     set_uxn_opcodes_h_l449_c9_5b3a_add <= VAR_set_uxn_opcodes_h_l449_c9_5b3a_add;
     -- Outputs
     VAR_set_uxn_opcodes_h_l449_c9_5b3a_return_output := set_uxn_opcodes_h_l449_c9_5b3a_return_output;

     -- t_register[uxn_opcodes_h_l448_c7_424a] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_h_l448_c7_424a_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_h_l448_c7_424a_stack_index <= VAR_t_register_uxn_opcodes_h_l448_c7_424a_stack_index;
     -- Outputs
     VAR_t_register_uxn_opcodes_h_l448_c7_424a_return_output := t_register_uxn_opcodes_h_l448_c7_424a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left := VAR_set_uxn_opcodes_h_l449_c9_5b3a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue := VAR_set_uxn_opcodes_h_l449_c9_5b3a_return_output;
     REG_VAR_t8 := VAR_t_register_uxn_opcodes_h_l448_c7_424a_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l450_c6_7df0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_left;
     BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output := BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l455_c14_4883] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_4883_return_output := CAST_TO_int8_t_uint8_t(
     VAR_t_register_uxn_opcodes_h_l448_c7_424a_return_output);

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l450_c6_7df0_return_output;
     VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_h_l455_c14_4883_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l451_c1_0d8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output;
     VAR_pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output;
     VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l451_c1_0d8a_return_output;
     -- pc_get[uxn_opcodes_h_l452_c30_242c] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l452_c30_242c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l452_c30_242c_return_output := pc_get_uxn_opcodes_h_l452_c30_242c_return_output;

     -- Submodule level 4
     VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_value := VAR_pc_get_uxn_opcodes_h_l452_c30_242c_return_output;
     -- push2_stack[uxn_opcodes_h_l452_c10_67c6] LATENCY=0
     -- Clock enable
     push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE <= VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_CLOCK_ENABLE;
     -- Inputs
     push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index <= VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_stack_index;
     push2_stack_uxn_opcodes_h_l452_c10_67c6_ins <= VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_ins;
     push2_stack_uxn_opcodes_h_l452_c10_67c6_value <= VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_value;
     -- Outputs
     VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output := push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output;

     -- Submodule level 5
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left := VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse := VAR_push2_stack_uxn_opcodes_h_l452_c10_67c6_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l450_c2_2701] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_cond;
     tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iftrue;
     tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output := tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l453_c7_6f04] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_left;
     BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output := BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output;
     VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l453_c7_6f04_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l450_c2_2701_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l454_c1_d5e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output;

     -- result_MUX[uxn_opcodes_h_l453_c3_f68b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l453_c3_f68b_cond <= VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_cond;
     result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue <= VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iftrue;
     result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse <= VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output := result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output;

     -- Submodule level 7
     VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l454_c1_d5e0_return_output;
     VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse := VAR_result_MUX_uxn_opcodes_h_l453_c3_f68b_return_output;
     -- pc_add_s8[uxn_opcodes_h_l455_c4_ec76] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment <= VAR_pc_add_s8_uxn_opcodes_h_l455_c4_ec76_adjustment;
     -- Outputs

     -- result_MUX[uxn_opcodes_h_l450_c2_2701] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_h_l450_c2_2701_cond <= VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_cond;
     result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue <= VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iftrue;
     result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse <= VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_return_output := result_MUX_uxn_opcodes_h_l450_c2_2701_return_output;

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_h_l450_c2_2701_return_output;
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
